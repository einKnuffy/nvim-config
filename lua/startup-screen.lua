local minintro_opened = false
local intro_logo = require("ascii.no-place-like-home")
local intro_logo_2 = require("ascii.no-place-like-home-2")
local PLUGIN_NAME = "Home"
local DEFAULT_COLOR = "#be95ff"
local INTRO_LOGO_HEIGHT = #intro_logo
local INTRO_LOGO_WIDTH = 60
local autocmd_group = vim.api.nvim_create_augroup(PLUGIN_NAME, {})
local highlight_ns_id = vim.api.nvim_create_namespace(PLUGIN_NAME)
local minintro_buff = -1
local current_color = DEFAULT_COLOR
local TARGET_COLOR = "#95FFBE"  -- Change this to your desired target color
local target_color = TARGET_COLOR
local animation_duration = 2000 -- Duration in milliseconds for the color animation
local animation_step = 100      -- Duration between color changes in milliseconds

local function interpolate_color(start_color, end_color, progress)
  local function hex_to_rgb(hex)
    hex = hex:gsub("#", "")
    return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
  end

  local function rgb_to_hex(r, g, b)
    return string.format("#%02x%02x%02x", r, g, b)
  end

  local start_r, start_g, start_b = hex_to_rgb(start_color)
  local end_r, end_g, end_b = hex_to_rgb(end_color)

  local interpolated_r = math.floor(start_r + (end_r - start_r) * progress)
  local interpolated_g = math.floor(start_g + (end_g - start_g) * progress)
  local interpolated_b = math.floor(start_b + (end_b - start_b) * progress)

  return rgb_to_hex(interpolated_r, interpolated_g, interpolated_b)
end


local function update_intro_color()
  --[[ current_color = interpolate_color(current_color, target_color, animation_step / animation_duration) ]]
  vim.api.nvim_set_hl(highlight_ns_id, "Default", { fg = current_color })
  vim.api.nvim_set_hl_ns(highlight_ns_id)

  --[[  if current_color == target_color then
    target_color = (current_color == DEFAULT_COLOR) and TARGET_COLOR or DEFAULT_COLOR
  end ]]

  vim.defer_fn(update_intro_color, animation_step)
end

local function unlock_buf(buf)
  vim.api.nvim_set_option_value("modifiable", true, { buf = buf })
end

local function lock_buf(buf)
  vim.api.nvim_set_option_value("modifiable", false, { buf = buf })
end

local function draw_minintro(buf, logo_width, logo_height)
  local window = vim.fn.bufwinid(buf)
  local screen_width = vim.api.nvim_win_get_width(window)
  local screen_height = vim.api.nvim_win_get_height(window) - vim.opt.cmdheight:get()

  local start_col = math.floor((screen_width - logo_width) / 2)
  local start_row = math.floor((screen_height - logo_height) / 2)
  if (start_col < 0 or start_row < 0) then return end

  local top_space = {}
  for _ = 1, start_row do table.insert(top_space, "") end

  local col_offset_spaces = {}
  for _ = 1, start_col do table.insert(col_offset_spaces, " ") end
  local col_offset = table.concat(col_offset_spaces, '')

  local adjusted_logo = {}
  for _, line in ipairs(intro_logo) do
    table.insert(adjusted_logo, col_offset .. line)
  end

  unlock_buf(buf)
  vim.api.nvim_buf_set_lines(buf, 1, 1, true, top_space)
  vim.api.nvim_buf_set_lines(buf, start_row, start_row, true, adjusted_logo)
  vim.api.nvim_buf_set_lines(buf, start_row + logo_height, start_row + logo_height, true, top_space)
  lock_buf(buf)

  vim.api.nvim_buf_set_extmark(buf, highlight_ns_id, start_row, start_col, {
    end_row = start_row + INTRO_LOGO_HEIGHT,
    hl_group = "Default"
  })

  update_intro_color()
end

local function create_and_set_minintro_buf(default_buff)
  local intro_buff = vim.api.nvim_create_buf("nobuflisted", "unlisted")
  vim.api.nvim_buf_set_name(intro_buff, PLUGIN_NAME)
  vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = intro_buff })
  vim.api.nvim_set_option_value("buftype", "nofile", { buf = intro_buff })
  vim.api.nvim_set_option_value("filetype", "md", { buf = intro_buff })
  vim.api.nvim_set_option_value("swapfile", false, { buf = intro_buff })

  vim.api.nvim_set_current_buf(intro_buff)
  vim.api.nvim_buf_delete(default_buff, { force = true })

  return intro_buff
end

local function set_options()
  vim.opt_local.number = false
  vim.opt_local.list = false
  vim.opt_local.colorcolumn = "0"
  vim.opt_local.foldmethod = "manual"
end

local function redraw()
  unlock_buf(minintro_buff)
  vim.api.nvim_buf_set_lines(minintro_buff, 0, -1, true, {})
  lock_buf(minintro_buff)
  draw_minintro(minintro_buff, INTRO_LOGO_WIDTH, INTRO_LOGO_HEIGHT)
end

local function display_minintro(payload)
  local is_dir = vim.fn.isdirectory(payload.file) == 1

  local default_buff = vim.api.nvim_get_current_buf()
  local default_buff_name = vim.api.nvim_buf_get_name(default_buff)
  local default_buff_filetype = vim.api.nvim_get_option_value("filetype", { buf = default_buff })
  if not is_dir and default_buff_name ~= "" and default_buff_filetype ~= PLUGIN_NAME then
    return
  end

  minintro_buff = create_and_set_minintro_buf(default_buff)
  set_options()

  draw_minintro(minintro_buff, INTRO_LOGO_WIDTH, INTRO_LOGO_HEIGHT)

  vim.api.nvim_create_autocmd({ "WinResized", "VimResized" }, {
    group = autocmd_group,
    buffer = minintro_buff,
    callback = redraw
  })
end

local function setup(options)
  options = options or {}
  vim.api.nvim_set_hl(highlight_ns_id, "Default", { fg = options.color or DEFAULT_COLOR })
  vim.api.nvim_set_hl_ns(highlight_ns_id)
  vim.api.nvim_create_autocmd("VimEnter", {
    group = autocmd_group,
    callback = display_minintro,
    once = true
  })
end

setup()

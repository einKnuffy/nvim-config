local numbers = {
	{
		" ██████╗  ",
		"██╔═████╗ ",
		"██║██╔██║ ",
		"████╔╝██║ ",
		"╚██████╔╝ ",
		" ╚═════╝  " },
	{
		" ██╗ ",
		"███║ ",
		"╚██║ ",
		" ██║ ",
		" ██║ ",
		" ╚═╝ ", },
	{
		"██████╗  ",
		"╚════██╗ ",
		" █████╔╝ ",
		"██╔═══╝  ",
		"███████╗ ",
		"╚══════╝ ", },
	{
		"██████╗  ",
		"╚════██╗ ",
		" █████╔╝ ",
		" ╚═══██╗ ",
		"██████╔╝ ",
		"╚═════╝  ", },
	{
		"██╗  ██╗ ",
		"██║  ██║ ",
		"███████║ ",
		"╚════██║ ",
		"     ██║ ",
		"     ╚═╝ ", },
	{
		"███████╗ ",
		"██╔════╝ ",
		"███████╗ ",
		"╚════██║ ",
		"███████║ ",
		"╚══════╝  ",
	},
	{
		" ███████╗ ",
		"██╔════╝  ",
		"███████╗  ",
		"██╔═══██╗ ",
		"╚██████╔╝ ",
		" ╚═════╝  ", },
	{
		"███████╗  ",
		"╚════██║  ",
		"    ██╔╝  ",
		"   ██╔╝   ",
		"   ██║    ",
		"   ╚═╝    ",
	},
	{
		" █████╗   ",
		"██╔══██╗  ",
		"╚█████╔╝  ",
		"██╔══██╗  ",
		"╚█████╔╝  ",
		" ╚════╝   ",
	},
	{
		" █████╗   ",
		"██╔══██╗  ",
		"╚██████║  ",
		" ╚═══██║  ",
		" █████╔╝  ",
		" ╚════╝   ",
	},
}


local semicolon = {
	"    ",
	"██╗ ",
	"╚═╝ ",
	"██╗ ",
	"╚═╝ ",
	"    "
}

function getTimeText()
	local hour = os.date('%H')
	local minute = os.date('%M')

	print(os.date('%H'), os.date('%S'))

	local text_table = {}

	local first_hour_number = numbers[hour:sub(1, 1) + 1]
	text_table = first_hour_number;

	local second_hour_number = numbers[hour:sub(2, 2) + 1]
	text_table = addLinesInTable(text_table, second_hour_number)

	text_table = addLinesInTable(text_table, semicolon)

	--semicolon
	local first_minute_number = numbers[minute:sub(1, 1) + 1]
	text_table = addLinesInTable(text_table, first_minute_number)

	local second_minute_number = numbers[minute:sub(2, 2) + 1]
	text_table = addLinesInTable(text_table, second_minute_number)

	return text_table
end

function addLinesInTable(currentTable, insertingTable)
	for i, line in ipairs(currentTable) do
		currentTable[i] = line .. insertingTable[i]
	end

	return currentTable
end

local timet = getTimeText()
return timet;

-- @author Merder Kim <hoxnox@gmail.com>
-- @date 2012-11-19
-- @copyright Merder Kim

-- {{{ Grab environment
local setmetatable = setmetatable
local math = { floor = math.floor }
local io = { lines = io.lines }
local os = {
    time = os.time,
    difftime = os.difftime
}
-- }}}

module("vicious.widgets.net_rx")

local top_speed = 15*1000*1000
local tx_bytes
local tx_time
local net_usage  = {}

local function worker(format)
	local tx_bytes_curr = io.lines("/sys/class/net/wlan0/statistics/rx_bytes")()
	local tx_time_curr = os.time()
	if tx_bytes == nil then
		tx_bytes = tx_bytes_curr
	end
	if tx_time == nil then
		tx_time = os.time()
	end
	local tx_bytes_diff = tx_bytes_curr - tx_bytes
	local tx_time_diff = os.difftime(tx_time_curr, tx_time)
	net_usage[0] = 0
	if tx_time_diff ~= 0 and tx_bytes_diff ~= 0 then
		net_usage[0] = math.floor(((tx_bytes_diff/tx_time_diff)*8/top_speed) * 100)
	end
	tx_bytes = tx_bytes_curr
	tx_time = tx_time_curr
	return net_usage
end

setmetatable(_M, { __call = function(_, ...) return worker(...) end })

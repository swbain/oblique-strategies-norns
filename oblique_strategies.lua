-- eno's oblique strategies
--
-- key 2: load new strategy

local json = include "lib/json"

local BASE_URL = "http://brianeno.needsyourhelp.org/draw"

local function curl_request(url)
    print("Requesting...", url)
    return util.os_capture( "curl -sS --max-time 20 \"" .. url .. "\"", true)
end
  
local function get_json()
    return curl_request(BASE_URL)
end

local function get_strategy()
    return json.decode(get_json())["strategy"]
end

function redraw()
    screen.clear()
    screen.move(64, 32)
    screen.text_center(get_strategy())
    screen.update()
end

function key(n, z)
    if n == 2 and z == 1 then
        redraw()
    end
end

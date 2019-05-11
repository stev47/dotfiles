import JSON.json
using Dates

function init(;kwargs...)
    println(json(kwargs))
    println("[")
end

function step(blockfns...)
    println(json([f() for f in blockfns]), ",")
end

@generated function dateformat()
    f = DateFormat("Y-mm-dd e HH:MM:SS")
    return :($f)
end

function date()
    nowtime = now()
    format = dateformat()
    return (full_text = Dates.format(nowtime, format),)
end

function battery()
    path = "/sys/class/power_supply/BAT0"
    !isfile(path) && return
    cap = parse(Int, readline(joinpath(path, "capacity")))
    return (full_text = "$(cap)%",)
end

init(version = 1, click_events = true)

while true
    step(battery, date)
    sleep(1)
end


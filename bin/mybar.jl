import JSON.json
using Dates
using Printf

function init(;kwargs...)
    # we use this instead of `println`, because the protocol expects the newline to be flushed at the same time while println sometimes flushed before the newline
    print("$(json(kwargs))\n")
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
    !isdir(path) && return

    cap = parse(Int, readline(joinpath(path, "capacity")))
    status = readline(joinpath(path, "status"))

    if status == "Discharging" && !isempty(readline(joinpath(path, "current_now")))
        current_now = parse(Int, readline(joinpath(path, "current_now"))) / 10^6
        voltage_now = parse(Int, readline(joinpath(path, "voltage_now"))) / 10^6
        charge_now = parse(Int, readline(joinpath(path, "charge_now")))

        discharge = current_now * voltage_now

        return (full_text = @sprintf("%s%% %s at %4.2fW", cap, status, discharge),)
    else
        return (full_text = @sprintf("%s%% %s", cap, status),)
    end
end

init(version = 1, click_events = true)

while true
    step(battery, date)
    sleep(1)
end


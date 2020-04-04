-------------------------------------------------------------------------------
-- Commands
-------------------------------------------------------------------------------
-- self_command
------------------------------------------------------------
function self_command(raw)
    if not raw then
        return
    end

    local args = raw
    if type(raw) == 'string' then
        args = T(args:split(' '))
        if #args == 0 then
            return
        end
    end

    -- init a new eventArgs
    local eventArgs = {handled = false, equip = false}
    handle_command(eventArgs, args, raw)
    if eventArgs.equip then
        handle_action("refresh")
    end
end

function handle_command(eventArgs, args, raw)
    -- auto commands
    if auto_self_command then
        auto_self_command(eventArgs, args, raw)
    end
    if eventArgs.handled then
        return
    end

    -- user commands
    if user_self_command then
        user_self_command(eventArgs, args, raw)
    end
    if eventArgs.handled then
        return
    end

    -- job commands
    if job_self_command then
        job_self_command(eventArgs, args, raw)
    end
    if eventArgs.handled then
        return
    end

    -- module commands
    if state.modules[args[1]] then
        if state.modules[args[1]]['self_command'] then
            local cmd = args[1]
            local cmdArgs = {}

            for i=2, #args, 1 do
                cmdArgs[#cmdArgs+1] = args[i]
            end

            state.modules[cmd]:self_command(eventArgs, cmdArgs, raw)
            return
        end
    end

    -- sets and toggles
    local modeActions = S{"set", "toggle", "cycle", "cycleback"}
    if modeActions:contains(args[1]) then
        if state[args[2]] then
            local old = state[args[2]].current
            state[args[2]][args[1]](state[args[2]], args[3])
            windower.add_to_chat(14, args[2]..": "..old.." -> "..state[args[2]].current)
        end
    end
end

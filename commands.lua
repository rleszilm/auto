-------------------------------------------------------------------------------
-- Commands
-------------------------------------------------------------------------------
-- self_command
------------------------------------------------------------
function self_command(command)
    local command = command
    if type(command) == 'string' then
        command = T(command:split(' '))
        if #command == 0 then
            return
        end
    end

    -- init a new eventArgs
    local eventArgs = {handled = false, equip = false}
    if #command > 0 then
        handle_command(eventArgs, command)
        if eventArgs.equip then
            handle_action("refresh")
        end
    end
end

function handle_command(eventArgs, command)
    -- auto commands
    if auto_self_command then
        auto_self_command(eventArgs, command)
    end
    if eventArgs.handled then
        windower.add_to_chat(12, "auto_")
        return
    end

    -- user commands
    if user_self_command then
        user_self_command(eventArgs, command)
    end
    if eventArgs.handled then
        windower.add_to_chat(12, "user_")
        return
    end

    -- job commands
    if job_self_command then
        job_self_command(eventArgs, command)
    end
    if eventArgs.handled then
        windower.add_to_chat(12, "job_")
        return
    end

    -- module commands
    if state.modules[command[1]] then
        if state.modules[command[1]]['self_command'] then
            local cmd = command[1]
            local args = {}

            for i=2,#command,1 do
                args[#args+1] = command[i]
            end

            state.modules[cmd]:self_command(eventArgs, args)
            return
        end
    end

    -- sets and toggles
    local modeActions = S{"set", "toggle", "cycle", "cycleback"}
    if modeActions:contains(command[1]) then
        if state[command[2]] then
            local old = state[command[2]].current
            state[command[2]][command[1]](state[command[2]], command[3])
            windower.add_to_chat(14, command[2]..": "..old.." -> "..state[command[2]].current)
        end
    end
end

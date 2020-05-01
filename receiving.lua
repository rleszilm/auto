-------------------------------------------------------------------------------
-- Receiving
-------------------------------------------------------------------------------
res = include('resources')

function action_receiving(action)
    if action.category == 4 and state.receiving == action.actor_id then
        -- spell is completed
        local spell = res.spells[action.param]
        receiving_aftercast(spell)
        state.receiving = nil
        return
    elseif action.category == 8 and action.param == 28787 and state.receiving == action.actor_id then
        -- received spell is interrupted
        if target.id == player.id then
            for _, act in ipairs(target.actions) do
                local spell = res.spells[act.param]
                receiving_aftercast(spell)
                state.receiving = nil
                return
            end
        end
    elseif action.category == 8 and action.param == 24931 and not state.receiving then
        -- spell is started and we are not receiving
        for _, target in ipairs(action.targets) do
            if target.id == player.id then
                for _, act in ipairs(target.actions) do
                    local tokens
                    local spell = res.spells[act.param]
                    local groups = get_spell_group(spell)
                    if type(groups) == "table" then
                        tokens = groups
                        tokens[#tokens+1] = spell.en
                    else
                        tokens = {groups, spell.en}
                    end

                    for _, token in ipairs(tokens) do
                        if state.receivable:contains(token) then
                            receiving(spell)
                            state.receiving = action.actor_id
                            return
                        end
                    end
                end
            end
        end
    end
end

windower.register_event('action', action_receiving)

state = state or {}
state.receivable = S{"Regen", "Cursna"}

--------------------------------------------------------------------------------
-- User Logic
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- User Setup
--------------------------------------------------------------------------------
function user_setup(state)
    return state
end

--------------------------------------------------------------------------------
-- User Binds
--------------------------------------------------------------------------------
function user_binds(state)
end

--------------------------------------------------------------------------------
-- User Event Logic
--------------------------------------------------------------------------------
-- pretarget
------------------------------------------------------------
function user_pre_pretarget(eventArgs, spell)
end

function user_pretarget(eventArgs, spell)
end

function user_post_pretarget(eventArgs, spell)
end

------------------------------------------------------------
-- precast
------------------------------------------------------------
function user_pre_precast(eventArgs, spell, position)
end

function user_precast(eventArgs, spell, position)
end

function user_post_precast(eventArgs, spell, position)
end

------------------------------------------------------------
-- midcast
------------------------------------------------------------
function user_pre_midcast(eventArgs, spell)
end

function user_midcast(eventArgs, spell)
end

function user_post_midcast(eventArgs, spell)
end

------------------------------------------------------------
-- aftercast
------------------------------------------------------------
function user_pre_aftercast(eventArgs, spell)
end

function user_aftercast(eventArgs, spell)
end

function user_post_midcast(eventArgs, spell)
end

------------------------------------------------------------
-- status_change
------------------------------------------------------------
function user_pre_status_change(eventArgs, new, old)
end

function user_status_change(eventArgs, new, old)
end

function user_post_status_change(eventArgs, new, old)
end

------------------------------------------------------------
-- pet_change
------------------------------------------------------------
function user_pre_pet_change(eventArgs, pet, gain)
end

function user_pet_change(eventArgs, pet, gain)
end

function user_post_pet_change(eventArgs, pet, gain)
end

------------------------------------------------------------
-- pet_midcast
------------------------------------------------------------
function user_pre_pet_midcast(eventArgs, spell)
end

function user_pet_midcast(eventArgs, spell)
end

function user_post_pet_midcast(eventArgs, spell)
end

------------------------------------------------------------
-- pet_aftercast
------------------------------------------------------------
function user_pre_pet_aftercast(eventArgs, spell)
end

function user_pet_aftercast(eventArgs, spell)
end

function user_post_pet_aftercast(eventArgs, spell)
end

------------------------------------------------------------
-- pet_status_change
------------------------------------------------------------
function user_pre_pet_status_change(eventArgs, new, old)
end

function user_pet_status_change(eventArgs, new, old)
end

function user_post_pet_status_change(eventArgs, new, old)
end

------------------------------------------------------------
-- filtered_action
------------------------------------------------------------
function user_pre_filtered_action(eventArgs, spell)
end

function user_filtered_action(eventArgs, spell)
end

function user_post_filtered_action(eventArgs, spell)
end

------------------------------------------------------------
-- sub_user_change
------------------------------------------------------------
function user_pre_sub_user_change(eventArgs, new, old)
end

function user_sub_user_change(eventArgs, new, old)
end

function user_post_sub_user_change(eventArgs, new, old)
end

------------------------------------------------------------
-- buff_change
------------------------------------------------------------
function user_pre_buff_change(eventArgs, name, gain, buff_details)
end

function user_buff_change(eventArgs, name, gain, buff_details)
end

function user_post_buff_change(eventArgs, name, gain, buff_details)
end

------------------------------------------------------------
-- buff_refresh
------------------------------------------------------------
function user_pre_buff_refresh(eventArgs, name, buff_details)
end

function user_buff_refresh(eventArgs, name, buff_details)
end

function user_post_buff_refresh(eventArgs, name, buff_details)
end

------------------------------------------------------------
-- party_buff_change
------------------------------------------------------------
function user_pre_party_buff_change(eventArgs, member, name, gain, buff_details)
end

function user_party_buff_change(eventArgs, member, name, gain, buff_details)
end

function user_post_party_buff_change(eventArgs, member, name, gain, buff_details)
end

------------------------------------------------------------
-- indi_change
------------------------------------------------------------
function user_pre_indi_change(eventArgs, indi, gain)
end

function user_indi_change(eventArgs, indi, gain)
end

function user_post_indi_change(eventArgs, indi, gain)
end

------------------------------------------------------------
-- self_command
------------------------------------------------------------
function user_self_command(eventArgs, args, raw)
end

--------------------------------------------------------------------------------
-- Custom User Logic
--------------------------------------------------------------------------------

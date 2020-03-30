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
function pre_user_pretarget(eventArgs, spell)
end

function user_pretarget(eventArgs, spell)
end

function post_user_pretarget(eventArgs, spell)
end

------------------------------------------------------------
-- precast
------------------------------------------------------------
function pre_user_precast(eventArgs, spell, position)
end

function user_precast(eventArgs, spell, position)
end

function post_user_precast(eventArgs, spell, position)
end

------------------------------------------------------------
-- midcast
------------------------------------------------------------
function pre_user_midcast(eventArgs, spell)
end

function user_midcast(eventArgs, spell)
end

function post_user_midcast(eventArgs, spell)
end

------------------------------------------------------------
-- aftercast
------------------------------------------------------------
function pre_user_aftercast(eventArgs, spell)
end

function user_aftercast(eventArgs, spell)
end

function post_user_midcast(eventArgs, spell)
end

------------------------------------------------------------
-- status_change
------------------------------------------------------------
function pre_user_status_change(eventArgs, new, old)
end

function user_status_change(eventArgs, new, old)
end

function post_user_status_change(eventArgs, new, old)
end

------------------------------------------------------------
-- pet_change
------------------------------------------------------------
function pre_user_pet_change(eventArgs, pet, gain)
end

function user_pet_change(eventArgs, pet, gain)
end

function post_user_pet_change(eventArgs, pet, gain)
end

------------------------------------------------------------
-- pet_midcast
------------------------------------------------------------
function pre_user_pet_midcast(eventArgs, spell)
end

function user_pet_midcast(eventArgs, spell)
end

function post_user_pet_midcast(eventArgs, spell)
end

------------------------------------------------------------
-- pet_aftercast
------------------------------------------------------------
function pre_user_pet_aftercast(eventArgs, spell)
end

function user_pet_aftercast(eventArgs, spell)
end

function post_user_pet_aftercast(eventArgs, spell)
end

------------------------------------------------------------
-- pet_status_change
------------------------------------------------------------
function pre_user_pet_status_change(eventArgs, new, old)
end

function user_pet_status_change(eventArgs, new, old)
end

function post_user_pet_status_change(eventArgs, new, old)
end

------------------------------------------------------------
-- filtered_action
------------------------------------------------------------
function pre_user_filtered_action(eventArgs, spell)
end

function user_filtered_action(eventArgs, spell)
end

function post_user_filtered_action(eventArgs, spell)
end

------------------------------------------------------------
-- sub_user_change
------------------------------------------------------------
function pre_user_sub_user_change(eventArgs, new, old)
end

function user_sub_user_change(eventArgs, new, old)
end

function post_user_sub_user_change(eventArgs, new, old)
end

------------------------------------------------------------
-- buff_change
------------------------------------------------------------
function pre_user_buff_change(eventArgs, name, gain, buff_details)
end

function user_buff_change(eventArgs, name, gain, buff_details)
end

function post_user_buff_change(eventArgs, name, gain, buff_details)
end

------------------------------------------------------------
-- buff_refresh
------------------------------------------------------------
function pre_user_buff_refresh(eventArgs, name, buff_details)
end

function user_buff_refresh(eventArgs, name, buff_details)
end

function post_user_buff_refresh(eventArgs, name, buff_details)
end

------------------------------------------------------------
-- party_buff_change
------------------------------------------------------------
function pre_user_party_buff_change(eventArgs, member, name, gain, buff_details)
end

function user_party_buff_change(eventArgs, member, name, gain, buff_details)
end

function post_user_party_buff_change(eventArgs, member, name, gain, buff_details)
end

------------------------------------------------------------
-- indi_change
------------------------------------------------------------
function pre_user_indi_change(eventArgs, indi, gain)
end

function user_indi_change(eventArgs, indi, gain)
end

function post_user_indi_change(eventArgs, indi, gain)
end

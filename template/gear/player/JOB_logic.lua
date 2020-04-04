--------------------------------------------------------------------------------
-- Job Logic
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Job Setup
--------------------------------------------------------------------------------
function job_setup(state)
    return state
end

--------------------------------------------------------------------------------
-- Job Binds
--------------------------------------------------------------------------------
function job_binds(state)
end


--------------------------------------------------------------------------------
-- Job Event Logic
--------------------------------------------------------------------------------
-- pretarget
------------------------------------------------------------
function job_pre_pretarget(eventArgs, spell)
end

function job_pretarget(eventArgs, spell)
end

function job_post_pretarget(eventArgs, spell)
end

------------------------------------------------------------
-- precast
------------------------------------------------------------
function job_pre_precast(eventArgs, spell, position)
end

function job_precast(eventArgs, spell, position)
end

function job_post_precast(eventArgs, spell, position)
end

------------------------------------------------------------
-- midcast
------------------------------------------------------------
function job_pre_midcast(eventArgs, spell)
end

function job_midcast(eventArgs, spell)
end

function job_post_midcast(eventArgs, spell)
end

------------------------------------------------------------
-- aftercast
------------------------------------------------------------
function job_pre_aftercast(eventArgs, spell)
end

function job_aftercast(eventArgs, spell)
end

function job_post_midcast(eventArgs, spell)
end

------------------------------------------------------------
-- status_change
------------------------------------------------------------
function job_pre_status_change(eventArgs, new, old)
end

function job_status_change(eventArgs, new, old)
end

function job_post_status_change(eventArgs, new, old)
end

------------------------------------------------------------
-- pet_change
------------------------------------------------------------
function job_pre_pet_change(eventArgs, pet, gain)
end

function job_pet_change(eventArgs, pet, gain)
end

function job_post_pet_change(eventArgs, pet, gain)
end

------------------------------------------------------------
-- pet_midcast
------------------------------------------------------------
function job_pre_pet_midcast(eventArgs, spell)
end

function job_pet_midcast(eventArgs, spell)
end

function job_post_pet_midcast(eventArgs, spell)
end

------------------------------------------------------------
-- pet_aftercast
------------------------------------------------------------
function job_pre_pet_aftercast(eventArgs, spell)
end

function job_pet_aftercast(eventArgs, spell)
end

function job_post_pet_aftercast(eventArgs, spell)
end

------------------------------------------------------------
-- pet_status_change
------------------------------------------------------------
function job_pre_pet_status_change(eventArgs, new, old)
end

function job_pet_status_change(eventArgs, new, old)
end

function job_post_pet_status_change(eventArgs, new, old)
end

------------------------------------------------------------
-- filtered_action
------------------------------------------------------------
function job_pre_filtered_action(eventArgs, spell)
end

function job_filtered_action(eventArgs, spell)
end

function job_post_filtered_action(eventArgs, spell)
end

------------------------------------------------------------
-- sub_job_change
------------------------------------------------------------
function job_pre_sub_job_change(eventArgs, new, old)
end

function job_sub_job_change(eventArgs, new, old)
end

function job_post_sub_job_change(eventArgs, new, old)
end

------------------------------------------------------------
-- buff_change
------------------------------------------------------------
function job_pre_buff_change(eventArgs, name, gain, buff_details)
end

function job_buff_change(eventArgs, name, gain, buff_details)
end

function job_post_buff_change(eventArgs, name, gain, buff_details)
end

------------------------------------------------------------
-- buff_refresh
------------------------------------------------------------
function job_pre_buff_refresh(eventArgs, name, buff_details)
end

function job_buff_refresh(eventArgs, name, buff_details)
end

function job_post_buff_refresh(eventArgs, name, buff_details)
end

------------------------------------------------------------
-- party_buff_change
------------------------------------------------------------
function job_pre_party_buff_change(eventArgs, member, name, gain, buff_details)
end

function job_party_buff_change(eventArgs, member, name, gain, buff_details)
end

function job_post_party_buff_change(eventArgs, member, name, gain, buff_details)
end

------------------------------------------------------------
-- indi_change
------------------------------------------------------------
function job_pre_indi_change(eventArgs, indi, gain)
end

function job_indi_change(eventArgs, indi, gain)
end

function job_post_indi_change(eventArgs, indi, gain)
end

------------------------------------------------------------
-- self_command
------------------------------------------------------------
function job_self_command(eventArgs, args, raw)
end

--------------------------------------------------------------------------------
-- Custom Job Logic
--------------------------------------------------------------------------------

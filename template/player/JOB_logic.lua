--------------------------------------------------------------------------------
-- Job Event Logic
--------------------------------------------------------------------------------
-- pretarget
------------------------------------------------------------
function pre_job_pretarget(eventArgs, spell)
end

function post_job_pretarget(eventArgs, spell)
end

------------------------------------------------------------
-- precast
------------------------------------------------------------
function pre_job_precast(eventArgs, spell, position)
end

function post_job_precast(eventArgs, spell, position)
end

------------------------------------------------------------
-- midcast
------------------------------------------------------------
function pre_job_midcast(eventArgs, spell)
end

function post_job_midcast(eventArgs, spell)
end

------------------------------------------------------------
-- aftercast
------------------------------------------------------------
function pre_job_aftercast(eventArgs, spell)
end

function post_job_midcast(eventArgs, spell)
end

------------------------------------------------------------
-- status_change
------------------------------------------------------------
function pre_job_status_change(eventArgs, new, old)
end

function post_job_status_change(eventArgs, new, old)
end

------------------------------------------------------------
-- pet_change
------------------------------------------------------------
function pre_job_pet_change(eventArgs, pet, gain)
end

function post_job_pet_change(eventArgs, pet, gain)
end

------------------------------------------------------------
-- pet_midcast
------------------------------------------------------------
function pre_job_pet_midcast(eventArgs, spell)
end

function post_job_pet_midcast(eventArgs, spell)
end

------------------------------------------------------------
-- pet_aftercast
------------------------------------------------------------
function pre_job_pet_aftercast(eventArgs, spell)
end

function post_job_pet_aftercast(eventArgs, spell)
end

------------------------------------------------------------
-- pet_status_change
------------------------------------------------------------
function pre_job_pet_status_change(eventArgs, new, old)
end

function post_job_pet_status_change(eventArgs, new, old)
end

------------------------------------------------------------
-- filtered_action
------------------------------------------------------------
function pre_job_filtered_action(eventArgs, spell)
end

function post_job_filtered_action(eventArgs, spell)
end

------------------------------------------------------------
-- sub_job_change
------------------------------------------------------------
function pre_job_sub_job_change(eventArgs, new, old)
end

function post_job_sub_job_change(eventArgs, new, old)
end

------------------------------------------------------------
-- buff_change
------------------------------------------------------------
function pre_job_buff_change(eventArgs, name, gain, buff_details)
end

function post_job_buff_change(eventArgs, name, gain, buff_details)
end

------------------------------------------------------------
-- buff_refresh
------------------------------------------------------------
function pre_job_buff_refresh(eventArgs, name, buff_details)
end

function post_job_buff_refresh(eventArgs, name, buff_details)
end

------------------------------------------------------------
-- party_buff_change
------------------------------------------------------------
function pre_job_party_buff_change(eventArgs, member, name, gain, buff_details)
end

function post_job_party_buff_change(eventArgs, member, name, gain, buff_details)
end

------------------------------------------------------------
-- indi_change
------------------------------------------------------------
function pre_job_indi_change(eventArgs, indi, gain)
end

function post_job_indi_change(eventArgs, indi, gain)
end

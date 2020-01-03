-- Global Functions
--
--
--
--



function clear_binds()
	windower.send_command('clearbinds')
	windower.add_to_chat(8,'Clearing All Binds - Setting to Defaults')
	windower.send_command('bind ^f1 input /ta <a10>')
	windower.send_command('bind ^f2 input /ta <a11>')
	windower.send_command('bind ^f3 input /ta <a12>')
	windower.send_command('bind ^f4 input /ta <a13>')
	windower.send_command('bind ^f5 input /ta <a14>')
	windower.send_command('bind ^f6 input /ta <a15>')
	windower.send_command('bind !f1 input /ta <a20>')
	windower.send_command('bind !f2 input /ta <a21>')
	windower.send_command('bind !f3 input /ta <a22>')
	windower.send_command('bind !f4 input /ta <a23>')
	windower.send_command('bind !f5 input /ta <a24>')
	windower.send_command('bind !f6 input /ta <a25>')
end

function midcast(spell,action)
    if spell.english == 'Sneak' or spell.english == 'Spectral Jig' or spell.english:startswith('Monomi') and spell.target.type == 'SELF' then
        send_command('cancel 71')
    end
end


    sets.reive = {neck="Adoulin's Refuge +1"}
 
-- Called any time we attempt to handle automatic gear equips (ie: engaged or idle gear).
function job_handle_equipping_gear(playerStatus, eventArgs)
    if buffactive['Reive Mark'] and player.inventory["Adoulin's Refuge +1"] or player.wardrobe["Adoulin's Refuge +1"] then
       equip(sets.reive)
    end
 
    if player.equipment.back == 'Mecisto. Mantle' then      
        disable('back')
    else
        enable('back')
    end
end
 
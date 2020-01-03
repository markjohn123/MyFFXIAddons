texts = require('texts')

_addon.name = 'Unable to see'
_addon.author = 'Andreas Sheriff'
_addon.version = '1'
_addon.commands = {'ActionEventBug', 'aeb'}


t1 = nil
t2 = nil
t3 = nil
t4 = nil
t5 = nil
t6 = nil
t7 = nil
t8 = nil

windower.register_event('load', function()
	t1 = texts.new('-')
	t2 = texts.new('-')
	t3 = texts.new('-')
	t4 = texts.new('-')
	t5 = texts.new('-')
	t6 = texts.new('-')
	t7 = texts.new('-')
	t8 = texts.new('-')

	t1.pos(t1, 50,700)
	t2.pos(t2, 50,720)
	t3.pos(t3, 50,740)
	t4.pos(t4, 50,760)
	t5.pos(t5, 50,780)
	t6.pos(t6, 50,800)
	t7.pos(t7, 50,820)
	t8.pos(t8, 50,840)

	texts.visible(t1, true)
	texts.visible(t2, true)
	texts.visible(t3, true)
	texts.visible(t4, true)
	texts.visible(t5, true)
	texts.visible(t6, true)
	texts.visible(t7, true)
	texts.visible(t8, true)
end)

windower.register_event('action message',function(actor_id, target_id, actor_index, target_index, message_id, param_1, param_2, param_3)
	t1.name = 'actor_id      : ' .. tostring(actor_id)    
	t2.name = 'target_id     : ' .. tostring(target_id)   
	t3.name = 'actor_index   : ' .. tostring(actor_index) 
	t4.name = 'target_index  : ' .. tostring(target_index)
	t5.name = 'message_id    : ' .. tostring(message_id)  
	t6.name = 'param_1       : ' .. tostring(param_1)     
	t7.name = 'param_2       : ' .. tostring(param_2)     
	t8.name = 'param_3       : ' .. tostring(param_3)     
end)
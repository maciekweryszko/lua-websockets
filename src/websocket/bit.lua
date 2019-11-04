local has_bit32,bit = pcall(require,'bit32')
if has_bit32 then
  -- lua 5.2 / bit32 library
  bit.rol = bit.lrotate
  bit.ror = bit.rrotate
  return bit
else
  -- luajit / lua 5.1 + luabitop/nixio.bit
  local tmpbit = require'bit'
  
  -- extend missing functions with interpreter implementation (in case when nixio.bit is used)
  if tmpbit.rol == nil or tmpbit.ror == nil then
	local tmpbit_interpreter = require'numberlua'
	tmpbit.rol = tmpbit_interpreter.rol
	tmpbit.ror = tmpbit_interpreter.ror
  end
  return tmpbit
end

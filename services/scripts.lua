
--#EVENT scripts hello
return "Hello world!"

--#EVENT scripts load
-- Parameters {service, operation, args, count=1}
if data == nil or data.service == nil then
  return "Hello world!"
end

for i = 1, data.count or 1 do
  result = murano.service_call(data.service, data.operation, data.args)
  if result and result.error then
    return error(result.error)
  end
end

return data.count or 1

--#EVENT scripts print
-- Parameters {count: 1}
for i = 1, data.count or 1 do
  print("Hello world!" .. i)
end

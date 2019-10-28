local portinfo = {}
local function search(file,query)
 local file = io.open(file,"rb")
 if not file then error("no such database") end
 for line in file:lines() do
  local entry = {}
  for field in line:gmatch("%S+") do
   entry[#entry+1] = field
  end
  if type(query) == "string" and entry[1] == query then
   return entry
  elseif type(query) == "number" and tonumber(entry[2]) == query then
   return entry
  end
 end
 return false
end

function portinfo.search(query,ptype)
 ptype=ptype or "oc"
 local path = ptype .. ".db"
 if (_OSVERSION or ""):match("OpenOS") then
  path = "/usr/lib/ports/"..path
 end
 return search(path,query)
end

return portinfo

local tA = {...}
local formats = {}
formats.html = "<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>"
local headers = {}
headers.html = "<table>\n<tr><th>Name</th><th>Port</th><th>Registered by</th><th>More Info</th></tr>"
local footers = {}
footers.html = "</table>"

local format = tA[2] or "html"

local function tableRow(t)
 for i = 1, 4 do
  t[i] = t[i] or ""
 end
 print(string.format(formats[format],table.unpack(t)))
end

print(headers[format])

local file = io.open(tA[1],"rb")
if not file then error("no such database") end
for line in file:lines() do
 local entry = {}
 for field in line:gmatch("%S+") do
  entry[#entry+1] = field
 end
 tableRow(entry)
end

print(footers[format])

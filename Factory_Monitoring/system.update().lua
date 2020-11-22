local keys = DecodeJson(Data.getKeys())

local style = "<style>th { font-size: "..fontSize.."em; text-align: left; vertical-align: middle; border-bottom: 3px solid #ddd; }</style>"
local html = style.."<p style='font-size: "..fontSize.."em; text-align: center; margin-top: 15px; margin-bottom: 15px;'>"..tableName.."</p><table width=100%>"

for i = 1, #keys do
    local data = ReadData(keys[i])
    for i2 = 1, #data.name do
        html = html.."<tr><th>"..data.name[i2].."</th><th>"..data.state[i2].."</th></tr>"
    end
end

html = html.."</table>"

if Screen then
	Screen.setHTML(html)
    end

local itemContainer1 = "item" --export
local itemContainer2 = "item" --export
local itemContainer3 = "item" --export
local itemContainer4 = "item" --export
local itemContainer5 = "item" --export
local itemContainer6 = "item" --export
local itemContainer7 = "item" --export
local itemContainer8 = "item" --export
local itemContainer9 = "item" --export

local tableName = "Name" --export
local fontSize = 4.7 --export
local containerMaxLiter = 166400 --export

local containerName = { itemContainer1, itemContainer2, itemContainer3, itemContainer4, itemContainer5, itemContainer6, itemContainer7, itemContainer8, itemContainer9 }
local slots = { slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10 }
local itemsName = { "carbone pur", "aluminium pur", "fer pur", "silicone pur" }
local itemsWeight = { 2.27, 2.7, 7.85, 2.33 }

function getPercent(container,itemName)
    local totalWeight = container.getItemsMass()
    local itemWeight = -1
    for i, item in ipairs(itemsName) do
        if item == itemName then
            itemWeight = itemsWeight[i]
            end
        end
    if itemWeight == -1 then
        return "error"
        end
    totalWeight = totalWeight/itemWeight
    return getColor(math.ceil(totalWeight*100/containerMaxLiter))
    end

function getLiter(container,itemName)
    local totalWeight = container.getItemsMass()
    local itemWeight = -1
    for i, item in ipairs(itemsName) do
        if item == itemName then
            itemWeight = itemsWeight[i]
            end
        end
    if itemWeight == -1 then
        return "error"
        end
    return math.ceil(totalWeight/itemWeight).."L"
    end

function getColor(percent)
    if percent >= 75 then return "<font color='green'>"..percent.."%</font>"
    elseif percent >= 25 then return "<font color='yellow'>"..percent.."%</font>"
    else return "<font color='red'>"..percent.."%</font>"
        end
    end

local style = "<style>th { font-size: "..fontSize.."em; text-align: left; vertical-align: middle; border-bottom: 3px solid #ddd; }</style>"
local html = style.."<p style='font-size: "..fontSize.."em; text-align: center; margin-top: 15px; margin-bottom: 15px;'>"..tableName.."</p><table width=100%>"

for i = 1,9
do
    if slots[i] then
        html = html.."<tr><th>"..containerName[i].."</th><th>"..getLiter(slots[i],containerName[i]).."</th><th>"..getPercent(slots[i],containerName[i]).."</th></tr>"
        end
    end

html = html.."</table>"

Screen.setHTML(html)

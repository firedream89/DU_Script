---DEFINE GLOBAL VARIABLE
Screen = nil
Emitter = nil
Data = nil
fontSize = 2 --export
tableName = "Metallurgie" --export
----------------

---JSON FUNCTION
json = require("dkjson")

function DecodeJson(data)
    local obj, pos, err = json.decode(data, 1, nil)
    if err then
        system.print ("Error:", err)
        return nil
    end
    return obj
end

function EncodeJson(data)
    return json.encode (data, { indent = true })
end

function ReadData(key)
    if Data then
    	return DecodeJson(Data.getStringValue(key))
    else
        return nil
    end
end

function SaveData(key,data)
    if Data then
    	Data.setStringValue(key,EncodeJson(data))
    end
end
-------------

---FIND SLOT TYPE
slotsName = { M1Name, M2Name, M3Name, M4Name, M5Name, M6Name, M7Name, M8Name, M9Name }
slots = { slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10 }
machines = {}

for i = 1,10
do
    if slots[i] then
        if slots[i].getElementClass() == "ScreenUnit" then
            Screen = slots[i]
        elseif slots[i].getElementClass() == "EmitterUnit" then
            Emitter = slots[i]
        elseif slots[i].getElementClass() == "DataBankUnit" then
            Data = slots[i]
	   else
            machines[#machines+1] = slots[i]
        end
    end
end
------------

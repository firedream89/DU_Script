---EXPORT VARIABLE
tableName = "Name" --export
M1Name = "Machine 1" --export
M2Name = "Machine 2" --export
M3Name = "Machine 3" --export
M4Name = "Machine 4" --export
M5Name = "Machine 5" --export
M6Name = "Machine 6" --export
M7Name = "Machine 7" --export
M8Name = "Machine 8" --export
M9Name = "Machine 9" --export
fontSize = 4.5 --export
----------------

---DEFINE GLOBAL VARIABLE
Screen = nil
Emitter = nil
Data = nil
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
            system.print("Screen Found !");
            Screen = slots[i]
        elseif slots[i].getElementClass() == "EmitterUnit" then
            system.print("Emitter Found !");
            Emitter = slots[i]
        elseif slots[i].getElementClass() == "DataBankUnit" then
            system.print("DataBank Found !");
            Data = slots[i]
	   else
            machines[#machines+1] = slots[i]
        end
    end
end
------------

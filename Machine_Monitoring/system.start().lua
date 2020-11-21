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

Screen = nil
Emitter = nil

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
	   else
            machines[#machines+1] = slots[i]
        end
    end
end

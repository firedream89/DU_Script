---Filter -> update()

function getStatusName(status)
    local fontYellow = "<font color=yellow>"
    local fontRed = "<font color=red>"
    local fontGreen = "<font color=green>"
    if status == "PENDING" then return fontYellow.."En attente</font>"
    elseif status == "STOPPED" then return fontRed.."Arrêt</font>"
    elseif status == "RUNNING" then return fontGreen.."En Service</font>"
    elseif status == "JAMMED_MISSING_INGREDIENT" then return fontRed.."Ingrédient manquant</font>"
    elseif status == "JAMMED_OUTPUT_FULL" then return fontRed.."Sortie pleine</font>"
    elseif status == "JAMMED_NO_OUTPUT_CONTAINER" then return fontRed.."Pas de conteneur de sortie</font>"
    end
end

local M1Name = "Silumine" --export
local M2Name = "Alliage AL-FE" --export
local M3Name = "Acier" --export
local M4Name = "Dispo" --export
local M5Name = "Machine 5" --export
local M6Name = "Machine 6" --export
local M7Name = "Machine 7" --export
local M8Name = "Machine 8" --export
local M9Name = "Machine 9" --export
local fontSize = 4 --export

local slotsName = { M1Name, M2Name, M3Name, M4Name, M5Name, M6Name, M7Name, M8Name, M9Name }
local slots = { slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10 }

local style = "<style>th { font-size: "..fontSize.."em; text-align: left; vertical-align: middle; border-bottom: 3px solid #ddd; }</style>"
local html = style.."<table width=100%>"

for i = 1,9
do
    if slots[i] then
        html = html.."<tr><th>"..slotsName[i].."</th><th>"..getStatusName(slots[i].getStatus()).."</th></tr>"
        end
    end

html = html.."</table>"

Screen.setHTML(html)

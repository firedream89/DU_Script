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

local style = "<style>th { font-size: "..fontSize.."em; text-align: left; vertical-align: middle; border-bottom: 3px solid #ddd; }</style>"
local html = style.."<p style='font-size: "..fontSize.."em; text-align: center; margin-top: 15px; margin-bottom: 15px;'>"..tableName.."</p><table width=100%>"

for i = 1, #machines
do
	html = html.."<tr><th>"..slotsName[i].."</th><th>"..getStatusName(machines[i].getStatus()).."</th></tr>"
end

html = html.."</table>"
 
if Screen then
	Screen.setHTML(html)
    end

if Emitter then
    Emitter.send("test", "message")
    end

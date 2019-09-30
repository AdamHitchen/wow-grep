SLASH_FILTER1 = "/grep"
local grepActivated = false;
local grepMsg = "";

function SlashCmdList.FILTER(msg, editbox)
	grepMsg = msg;
	grepActivated = not grepActivated;
	if msg == "" then
		grepActivated = false;
	end

	if grepActivated == false then
		print("Ending Search.");
	end

	if grepActivated == true then
		print("Searching for '" .. msg .. "'");
	end
end

local frame=CreateFrame("Frame");
frame:RegisterEvent("CHAT_MSG_CHANNEL");
frame:SetScript("OnEvent", function(self, event, msg, sender)
		      if grepActivated == true then
		          if event=="CHAT_MSG_CHANNEL" then
		              if msg:lower():match(grepMsg) then
	       		           print("|Hplayer:" .. sender .. "|h[" .. sender .. "]|h|r: " .. msg);
			      end
			   end
		      end
end);

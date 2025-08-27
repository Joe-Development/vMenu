-- You should not be editing this file unless you know what you are doing. This shouldn't need to be changed.
-- For integrations, check client/integrations.lua

---@class inputDialog
---@return string
exports(
	"inputDialog",
	function(windowTitle, defaultText, maxLength)
		local input =
			lib.inputDialog(
				"vMenu",
				{
					{ type = "input", label = windowTitle, default = defaultText, max = maxLength or 30 }
				}
			)
		return input and input[1] or ""
	end
)

function RgbToHex(r, g, b)
	-- Ensure values are within RGB bounds (0-255)
	r = math.max(0, math.min(255, r))
	g = math.max(0, math.min(255, g))
	b = math.max(0, math.min(255, b))

	-- Format RGB values to hexadecimal string
	return format("#%02X%02X%02X", r, g, b)
end

---@class colourDialog
---@param type integer 1 for primary, 2 for secondary
---@return string
exports("colourDialog", function(type)
	if not cache.vehicle then return "" end -- edge case
	local defaultColour = type == 1 and RgbToHex(GetVehicleCustomPrimaryColour(cache.vehicle)) or
	RgbToHex(GetVehicleCustomSecondaryColour(cache.vehicle))
	local input = lib.inputDialog("vMenu", {
		{ type = 'color', label = 'Select a Colour', default = defaultColour },
	})
	return input and input[1] or ""
end)

exports("getUserConfirmation", function(title, description)
	local confirmed = lib.alertDialog({
		header = format("vMenu - %s", title),
		content = description,
		centered = true,
		cancel = true,
	})
	return confirmed and confirmed == "confirm" or false
end)

---@class copyToClipboard
---@param text string
exports("copyToClipboard", function(text)
	print("Copied to clipboard: " .. text)
	lib.setClipboard(text)
	return ""
end)

CreateThread(function()
	--[[
		vMenu - keep player head props 
		so players dont lose their head props when they are hit/pushed
	]]
	if GetConvar("keep_player_head_props", "false") == "false" then
		lib.onCache("ped", function(value)
			SetPedCanLosePropsOnDamage(value, false, 0)
			SetPedConfigFlag(value, 427, true)
		end)
	end

	--[[
		vMenu - blackout vehicles (lights)
		so blackouts dont affect vehicle headlights
	]]
	if GetConvar("vmenu_blackout_affect_vehicles", "false") == "false" then
		SetArtificialLightsStateAffectsVehicles(false)
	end
end)
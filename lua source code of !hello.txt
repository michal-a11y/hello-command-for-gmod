hook.Add("PlayerSay", "HelloCommand", function(ply, text)
    print("Player said:", text) -- debug message
    local msg = string.Trim(string.lower(text))
    if msg == "!hello" then
        print("Hello command detected") -- another debug message
        ply:ChatPrint("Hello, " .. ply:Nick() .. " owned by himself!")
        return true
    end
end)

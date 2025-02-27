--   LUA_VERSION: 5.1 LUAJIT_VERSION: 2.0 LUAJIT_API_VERSION: 2.0
--  copyrigtht:  Unlicense (modiy, distribute, and use)
hook.Add("PlayerSay", "HelloCommandWithErrorHandling", function(ply, text)
    if not SERVER then return end -- Ensure the script runs on the server side

    -- Check if the command is "!hello"
    if string.lower(text:Trim()) == "!hello" then
        -- Use pcall to catch any errors
        local success, err = pcall(function()
            -- Simulate an intentional error for demonstration
            local someValue = nil
            print(someValue:DoSomething()) -- This will throw an error since someValue is nil
        end)

        if not success then
            -- If an error occurred, send a message to the player
            ply:ChatPrint("An error occurred while processing the command: " .. err)
            print("Error occurred in !hello command:", err) -- Log the error to the server console
        else
            -- If no error occurred, send a success message
            ply:ChatPrint("Hello command executed successfully!")
        end

        return "" -- Suppress the chat message
    end

    return text -- Allow other chat messages to pass through
end)

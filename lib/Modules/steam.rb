module PlayerDB
    class Steam < PlayerDB::Client
        def initialize; end

        def Profile(id)
            @Status  = ["Offline", "Online", "Busy", "Away", "Snooze", "Looking to trade", "Looking to play"]
            @Profile = [nil, "Private", nil, "Public"]

            if !id.empty?
                @Data = contact_api("steam", id.downcase)

                # Does this player exist?
                if !@Data["success"] then abort("# [PlayerDB:Minecraft] Mojang API lookup failed; no such player exists.") end

                # Make the profile and online status suitable for humans
                @Data["data"]["player"]["meta"]["profilestate"] = @Profile[@Data["data"]["player"]["meta"]["profilestate"]]
                @Data["data"]["player"]["meta"]["personastate"] = @Status[@Data["data"]["player"]["meta"]["personastate"]]

                # Return data
                @Data["data"]["player"]
            else abort("# [PlayerDB:Steam] Please input an ID to continue.") end
        end
    end
end
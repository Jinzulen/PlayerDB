module PlayerDB
    class Xbox < PlayerDB::Client
        def initialize; end

        def Profile(id)
            if !id.empty?
                @Data = contact_api("xbox", id.downcase)

                # Does this player exist?
                if !@Data["success"] then abort("# [PlayerDB:Minecraft] Mojang API lookup failed; no such player exists.") end

                # Return the player data
                @Data["data"]["player"]
            else abort("# [PlayerDB:Xbox] Please input an ID to continue.") end
        end
    end
end
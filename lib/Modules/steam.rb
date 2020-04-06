module PlayerDB
    class Steam < PlayerDB::Client
        def initialize; end

        def Profile(id)
            @Status  = ["Offline", "Online", "Busy", "Away", "Snooze", "Looking to trade", "Looking to play"]
            @Profile = [nil, "Private", nil, "Public"]

            if !id.empty?
                begin
                    @Data = contact_api("steam", id.downcase)

                    # Does this player exist?
                    if !@Data["success"] then raise "# [PlayerDB:Steam] Steam API lookup failed; no such user <#{id}> exists." end

                    # Make the profile and online status suitable for humans
                    @Data["data"]["player"]["meta"]["profilestate"] = @Profile[@Data["data"]["player"]["meta"]["profilestate"]]
                    @Data["data"]["player"]["meta"]["personastate"] = @Status[@Data["data"]["player"]["meta"]["personastate"]]

                    # Return data
                    @Data["data"]["player"]
                rescue StandardError => e
                    puts "# [PlayerDB:Steam] Error occurred while contacting API: #{e}"
                end
            else raise "# [PlayerDB:Steam] Please input an ID to continue." end
        end
    end
end
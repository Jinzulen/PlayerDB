module PlayerDB
    class Minecraft < PlayerDB::Client
        def initialize; end

        def Profile(id)
            if !id.empty?
                @Data = contact_api("minecraft", id.downcase)

                # Does this player exist?
                if !@Data["success"]
                    abort("# [PlayerDB:Minecraft] Mojang API lookup failed; no such player exists.")
                end

                # Perform some magic to correct the Unix timestamp
                @History = @Data["data"]["player"]["meta"]["name_history"]

                if @History.length > 1
                    @History.each do |n|
                        if n["changedToAt"]
                            n["changedToAt"] = n["changedToAt"].to_s.delete_suffix!('000')
                            n["changedToAt"] = Time.at(n["changedToAt"].to_i).strftime("%d/%m/%y %I:%M %p")
                        else
                            n["changedToAt"] = "N/A (Original username)"
                        end
                    end
                end

                # Return the player data
                @Data["data"]["player"]
            else
                abort("# [PlayerDB:Minecraft] Please input an ID to continue.")
            end
        end
    end
end
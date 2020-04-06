module PlayerDB
    class Xbox < PlayerDB::Client
        def initialize; end

        def Profile(id)
            if !id.empty?
                begin
                    @Data = contact_api("xbox", id.downcase)

                    # Does this player exist?
                    if !@Data["success"] then raise "# [PlayerDB:Xbox] Xbox API lookup failed; no such player <#{id}> exists." end

                    # Return the player data
                    @Data["data"]["player"]
                rescue StandardError => e
                    puts "# [PlayerDB:Xbox] Error occurred while contacting API: #{e}"
                end
            else raise "# [PlayerDB:Xbox] Please input an ID to continue." end
        end
    end
end
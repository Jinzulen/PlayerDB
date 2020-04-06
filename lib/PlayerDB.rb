require "httparty"

module PlayerDB
    VERSION = "0.0.1"

    class Client
        def initialize; end

        def Xbox(id); PlayerDB::Xbox.new.Profile(id) end
        def Steam(id); PlayerDB::Steam.new.Profile(id) end
        def Minecraft(id); PlayerDB::Minecraft.new.Profile(id) end

        def contact_api(resource, key)
            begin
                response = HTTParty.get("https://playerdb.co/api/player/#{resource}/#{key}")

                response.parsed_response
            rescue HTTParty::Error => e
                raise "# [PlayerDB] Failed to retrieve resource: #{e}"
            rescue StandardError => e
                raise "# [PlayerDB] Error occurred: #{e}"
            end
        end
    end
end

require "#{File.expand_path('..', __FILE__)}/Modules/xbox"
require "#{File.expand_path('..', __FILE__)}/Modules/steam"
require "#{File.expand_path('..', __FILE__)}/Modules/minecraft"
# PlayerDB
### Powerful, but simple, unofficial client to interface with the PlayerDB API.
[https://api.travis-ci.org/Jinzulen/PlayerDB.svg?branch=master](https://api.travis-ci.org/Jinzulen/PlayerDB.svg?branch=master) [![Maintainability](https://api.codeclimate.com/v1/badges/ce7f5b3cd9f3690180ea/maintainability)](https://codeclimate.com/github/Jinzulen/PlayerDB/maintainability) [![Gem Version](https://badge.fury.io/rb/PlayerDB.svg)](https://badge.fury.io/rb/PlayerDB)

# 1. Installation
*Please note that the gem name is case sensitive.*
```
gem install PlayerDB
```

# 2. Usage Guides
Firstly, require and initialize the library like so:
```ruby
require "playerdb"

@Player = PlayerDB::Client.new
```

- Grab a Minecraft profile
```ruby
@Minecraft = @Player.Minecraft("jinzulen")

# General profile information
puts "# General profile information:"
puts "# ID: #{@Minecraft["id"]}"
puts "# Raw ID: #{@Minecraft["raw_id"]}"
puts "# Username: #{@Minecraft["username"]}"
puts "# Avatar: #{@Minecraft["avatar"]}\n\n"

# Name change history
@History = @Minecraft["meta"]["name_history"]

if @History.length > 1
    puts "# Name change history:"

    @History.each do |n|
        puts "# #{n["name"]} <= Changed at: #{n["changedToAt"]}"
    end
end

# General profile information:
# ID: f0e60cbe-8f68-4e88-9d46-c60884101cde
# Raw ID: f0e60cbe8f684e889d46c60884101cde
# Username: Jinzulen
# Avatar: https://crafatar.com/avatars/f0e60cbe8f684e889d46c60884101cde

# Name change history:
# AKBAT <= Changed at: N/A (Original username)
# KhalilGr <= Changed at: 30/04/15 08:51 PM
# KhalilG <= Changed at: 23/01/16 01:11 PM
# Jinzulen <= Changed at: 10/10/17 08:24 AM
```

- Grab a Steam profile
> profilestate: The visibility status of the user's profile.

> personatestate: The user's current online status.
```ruby
@Steam = @Player.Steam("jinzulen")

# Profile
puts "# Profile:"
puts "# ID: #{@Steam["id"]}"
puts "# Username: #{@Steam["username"]}"
puts "# Avatar: #{@Steam["avatar"]}\n\n"

# Profile:
# ID: 76561198262601540
# Username: Jin
# Avatar: https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/ff/ffec106a4a3b7dccce217e9c6553b73ce785b90f_full.jpg

# Misc
puts "# Miscellaneous:"
@Steam["meta"].each { |m| puts "# #{m[0]}: #{m[1]}"}

# Miscellaneous:
# steam2id: STEAM_0:0:151167906
# steam2id_new: STEAM_1:0:151167906
# steam3id: [U:1:302335812]
# steam64id: 76561198262601540
# steamid: 76561198262601540
# communityvisibilitystate: 1
# profilestate: Private
# personaname: Jin
# profileurl: https://steamcommunity.com/id/jinzulen/
# avatar: https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/ff/ffec106a4a3b7dccce217e9c6553b73ce785b90f.jpg
# avatarmedium: https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/ff/ffec106a4a3b7dccce217e9c6553b73ce785b90f_medium.jpg
# avatarfull: https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/ff/ffec106a4a3b7dccce217e9c6553b73ce785b90f_full.jpg
# personastate: Offline
```

- Grab an Xbox profile
```ruby
@Xbox = @Player.Xbox("Stallion83")

puts "# Profile:"
puts "# ID: #{@Xbox["id"]}"
puts "# Username: #{@Xbox["username"]}"
puts "# Avatar: #{@Xbox["avatar"]}"
puts "# Gamer score: #{@Xbox["meta"]["gamerscore"]}"
puts "# Account tier: #{@Xbox["meta"]["accountTier"]}"
puts "# Xbox One Rep: #{@Xbox["meta"]["xboxOneRep"]}"
puts "# Preferred color: #{@Xbox["meta"]["preferredColor"]}"
puts "# Real name: #{@Xbox["meta"]["realName"]}"
puts "# Bio: #{@Xbox["meta"]["bio"]}"
puts "# Tenure level: #{@Xbox["meta"]["tenureLevel"]}"
puts "# Watermarks: #{@Xbox["meta"]["watermarks"]}"
puts "# Location: #{@Xbox["meta"]["location"]}"
puts "# Show user as avatar: #{@Xbox["meta"]["showUserAsAvatar"]}"

# Profile:
# ID: 2745051201447500
# Username: Stallion83
# Avatar: https://avatar-ssl.xboxlive.com/avatar/Stallion83/avatarpic-l.png
# Gamer score: 2126345
# Account tier: Gold
# Xbox One Rep: Superstar
# Preferred color: https://dlassets-ssl.xboxlive.com/public/content/ppl/colors/00009.json
# Real name: Ray Cox
# Bio: 1st to 1M & 2M Gamerscore. Mixer Partner Mixer.com/Stallion83
# Tenure level: 16
# Watermarks:
# Location: Knoxville, TN
# Show user as avatar: 1
```

# 3. License
This library is published under the [Apache 2.0](https://github.com/Jinzulen/PlayerDB/blob/master/LICENSE.md) license.
# Install

1. Install Spotify
2. Spicetify installation - https://spicetify.app/docs/advanced-usage/installation or `curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.sh | sh`
3. Install themes (follow installation guide) - https://github.com/spicetify/spicetify-themes
   1. `spicetify config current_theme text` and `spicetify config color_scheme CatppuccinMocha`
4. Install marketplace (to remove ads) - https://github.com/spicetify/spicetify-marketplace/wiki/Installation
   1. `cd ~/.config/spicetify/CustomApps`
   2. `curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.sh | sh`
   3. Install the adblock extension from marketplace in spotify
5. Install Full App Display extension
   1. `cd ~/.config/spicetify/Extensions`
   2. `spicetify config extensions fullAppDisplay.js`
   3. `spicetify apply`
   4. If this doesn't work, download it from the marketplace

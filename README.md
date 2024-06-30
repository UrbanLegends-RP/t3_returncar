```
___________________         _________            .__        __          
\__    ___/\_____  \       /   _____/ ___________|__|______/  |_  ______
  |    |     _(__  <       \_____  \_/ ___\_  __ \  \____ \   __\/  ___/
  |    |    /       \      /        \  \___|  | \/  |  |_> >  |  \___ \ 
  |____|   /______  /     /_______  /\___  >__|  |__|   __/|__| /____  >
                  \/              \/     \/         |__|             \/ 
```

### README.md

```markdown
# t3_returncar

`t3_returncar` is a FiveM script for QBCore that allows players to return their vehicles using a third-eye target on NPCs. It integrates with `qb-menu` and `qb-target`, and logs vehicle return actions to a specified Discord webhook.

## Features

- Allows players to return their vehicles.
- Displays a menu with a list of player-owned vehicles.
- Uses NPCs as interaction points.
- Logs vehicle return actions to a Discord webhook.

## Requirements

- [QBCore Framework](https://github.com/qbcore-framework/qb-core)
- [qb-menu](https://github.com/qbcore-framework/qb-menu)
- [qb-target](https://github.com/qbcore-framework/qb-target)
- [mysql-async](https://github.com/brouznouf/fivem-mysql-async) (or [oxmysql](https://github.com/overextended/oxmysql))

## Installation

1. **Clone or download the repository:**

    ```bash
    git clone https://github.com/yourusername/t3_returncar.git
    ```

2. **Place the `t3_returncar` folder in your server's `resources` directory.**

3. **Add the resource to your `server.cfg`:**

    ```plaintext
    ensure t3_returncar
    ```

4. **Configure the script:**

    Open the `config.lua` file and configure the locations and Discord webhook URL.

    ```lua
    Config = {}

    Config.Locations = {
        {coords = vector3(-352.07, -179.7, 38.03), heading = 0},
        -- Add more locations here with the format {coords = vector3(x, y, z), heading = heading}
    }

    Config.DiscordWebhook = "https://discord.com/api/webhooks/your_webhook_url"
    ```

## Usage

1. **Start your server.**

2. **Interact with the NPCs at the configured locations to return your vehicles.**

3. **The script will log vehicle return actions to the specified Discord webhook.**

## Contributing

1. **Fork the repository.**

2. **Create a new branch:**

    ```bash
    git checkout -b feature/your-feature
    ```

3. **Make your changes and commit them:**

    ```bash
    git commit -m 'Add some feature'
    ```

4. **Push to the branch:**

    ```bash
    git push origin feature/your-feature
    ```

5. **Submit a pull request.**

## License

This project is licensed under the MIT License.

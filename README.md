# RedM Noclip Script

## Overview

This script provides a **noclip mode** for RedM, allowing players to freely move through the game world without collisions. It includes movement controls using standard `W`, `A`, `S`, `D` keys, as well as vertical movement using `Space` (up) and `Ctrl` (down). The `F10` key toggles noclip mode on and off, making it easy to activate or deactivate at any time.

⚠️ **Important:** This script should only be used on private servers or for development purposes. Using this on public servers could violate server rules or result in bans.

## Features

- **Toggle Noclip On/Off** with the `F10` key.
- **Free Movement** in all directions (W, A, S, D for directional movement, Space for up, Ctrl for down).
- **Collision Control**: Disables collision with the world when noclip is active.
- **Visibility Control**: Makes the player invisible when in noclip mode and restores visibility when disabled.
- **Customizable Speed**: You can adjust the speed of noclip movement by changing the `noclipSpeed` variable.

## Installation

1. Download or clone this repository to your RedM server.
2. Place the `noclip.lua` script in the `resources` folder of your server.
3. Create a file called `fxmanifest.lua` in the same folder with the following content:

    ```lua
    fx_version 'adamant'
    game 'rdr3'

    author 'Your Name'
    description 'Noclip script for RedM'
    version '1.0.0'

    client_scripts {
        'noclip.lua'
    }
    ```

4. Add the resource to your `server.cfg` file by adding:

    ```cfg
    ensure noclip
    ```

5. Restart your server or start the resource manually with the following command in the console:

    ```bash
    start noclip
    ```

## Usage

- Press `F10` to toggle noclip mode on and off.
- Use `W`, `A`, `S`, `D` for movement.
- Use `Space` to move up and `Ctrl` to move down.

## Customization

- **Movement Speed**: You can adjust the speed of movement by changing the `noclipSpeed` variable in the script:

    ```lua
    local noclipSpeed = 1.0 -- Change this value to increase or decrease speed
    ```

- **Key Bindings**: If you want to change the key used to toggle noclip, modify the key code in this line of the script:

    ```lua
    if IsControlJustPressed(0, 57) then -- F10 key (57)
    ```

    You can refer to the [CitizenFX Documentation](https://docs.fivem.net/docs/game-references/controls/) to find other key codes.

## License

This project is licensed under the MIT License. Feel free to modify or distribute the script, but please give credit to the original author.
See the [LICENSE](./LICENSE) file for more details.


---

### ⚠️ Disclaimer

This script is intended for **development purposes** only. Usage of this script in unauthorized settings, or in violation of server rules, is strictly prohibited. Always ensure that you have permission before using scripts of this nature in online environments.

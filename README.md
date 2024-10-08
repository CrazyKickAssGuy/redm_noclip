# RedM Noclip Script with Admin Permissions

## Overview

This script provides a **noclip mode** for RedM, allowing authorized players (admins) to move freely through the game world without collisions. It includes movement controls using `W`, `A`, `S`, `D` keys for directional movement, and `Space` and `Ctrl` for vertical movement. The `F10` key or the `/noclip` command can be used to toggle noclip mode on and off.

⚠️ **Important:** This script should only be used on private servers or for development purposes. Using this on public servers could violate server rules or result in bans.

## Features

- **Admin Permissions**: Only players with authorized identifiers (e.g., Steam ID, license) can use noclip.
- **Toggle Noclip On/Off**:
  - Use the `F10` key.
  - Or type `/noclip` in chat.
- **Free Movement** in all directions:
  - `W`, `A`, `S`, `D` for directional movement.
  - `Space` for moving up and `Ctrl` for moving down.
- **Collision and Visibility Control**: Disables collision with the world and makes the player invisible when noclip is active.
- **Customizable Speed**: The speed of noclip movement can be adjusted.

## Installation

1. Download or clone this repository to your RedM server.
2. Place the `noclip.lua` script in the `resources` folder of your server.
3. Create a file called `fxmanifest.lua` in the same folder with the following content:

    ```lua
    fx_version 'adamant'
    game 'rdr3'

    author 'Your Name'
    description 'Noclip script with admin permissions for RedM'
    version '1.1.0'

    client_scripts {
        'noclip.lua'
    }
    ```

4. Add the resource to your `server.cfg` file by adding:

    ```cfg
    ensure noclip
    ```

5. Restart your server or manually start the resource with:

    ```bash
    start noclip
    ```

## Usage

- Press `F10` to toggle noclip mode on and off.
- Alternatively, type `/noclip` in chat to toggle noclip.
- Use `W`, `A`, `S`, `D` for directional movement.
- Use `Space` to move up and `Ctrl` to move down.

## Admin Permissions

This script restricts noclip access to only authorized players (admins). You must add the player's **Steam ID** or **license identifier** to the admin list in the script to grant them permission to use noclip.

### How to Add Admins

1. Open `noclip.lua` in any text editor.
2. Locate the `adminList` section:
    ```lua
    local adminList = {
        "steam:110000112345678",  -- Replace with actual Steam ID
        "license:1234567890abcdef"  -- Replace with actual license identifier
    }
    ```
3. Add the Steam IDs or license identifiers of players who should have admin access.

### Example Admin Identifiers:

- **Steam**: `"steam:110000112345678"`
- **License**: `"license:1234567890abcdef"`

Once added to the list, these players will be able to use the `F10` key or the `/noclip` command to enable and disable noclip.

## Customization

- **Movement Speed**: You can adjust the speed of movement by changing the `noclipSpeed` variable in the script:
    ```lua
    local noclipSpeed = 1.0  -- Change this value to increase or decrease speed
    ```

- **Key Bindings**: If you want to change the key used to toggle noclip, modify the key code for `F10` in this line of the script:
    ```lua
    if IsControlJustPressed(0, 57) then -- F10 key (57)
    ```
    You can refer to the [CitizenFX Documentation](https://docs.fivem.net/docs/game-references/controls/) to find other key codes.

- **Command Name**: If you want to change the `/noclip` command to something else, edit this section of the script:
    ```lua
    RegisterCommand("noclip", function(source, args, rawCommand)
    ```

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for more details.

---

### ⚠️ Disclaimer

This script is intended for **development purposes** only. Usage of this script in unauthorized settings, or in violation of server rules, is strictly prohibited. Always ensure that you have permission before using scripts of this nature in online environments.

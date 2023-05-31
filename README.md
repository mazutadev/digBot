# Digging Area Program

The Digging Area program is a script for the "Turtle" robot in the game Minecraft, designed to excavate a rectangular area of specified dimensions.

## Installation
The program does not require the installation of additional software. To run the program, you will need a computer with Minecraft installed.

## Usage
The program can be launched using the following command:

```
DigBot/src/main.lua [length] [width] [height]
```

Where:

- `[length]` is a positive number that determines the length of the area to be excavated.
- `[width]` is a positive number that determines the width of the area to be excavated.
- `[height]` is a positive number that determines the height of the area to be excavated.

The program will utilize the "Turtle" robot to dig the specified area. During the operation, the program will check for specific blocks and sort the inventory.

Alternatively, you can use the command `DigBot/src/main.lua` and then enter the values for length, width, and height one by one.

## Configuration
At the beginning of the program, there are several customizable parameters:

Currently, the extraction of configuration files into a separate folder, `DigBot/config`, is under development. The block lists are located in the module `DigBot/src/utils/check.lua`.

- `blacklist_block`: A list of blocks to be excluded from the inventory. You can add or remove blocks from the list to customize it according to your needs.
- `sand_blocks_list`: A list of sand blocks to be checked during program execution. You can add or remove blocks from the list to customize it according to your needs.

## Notes
- The program is intended for use in Minecraft with the ComputerCraft mod.
- Make sure you have enough fuel for the "Turtle" robot. It is recommended to check the fuel level before running the program and refuel the "Turtle" if necessary.
- The program will automatically sort the inventory after each digging iteration.
- Before running the program, ensure that the "Turtle" robot has enough inventory space to collect resources.

## License
This is free software with no warranties. You can modify and distribute it under the terms of the MIT license.
# Polybar

Status bar configuration used by the BSPWM session.

***Language***
- 🇺🇸 English
- [🇪🇸 Español](./README.es.md)

## Files

- `current.ini`: active bar configuration and modules.
- `workspace.ini`: workspace bar configuration.
- `launch.sh`: stops existing Polybar processes and launches the configured bars.
- `colors*.ini`: color palettes.
- `scripts/`: launcher, power menu, and Rofi theme helpers.
- `fonts/`: fonts bundled with the configuration.

## Launch

The BSPWM startup file launches:

```bash
~/.config/polybar/launch.sh
```

The script starts bars for logs, Ethernet, VPN, target tracking, primary system information, and workspaces.

## Customization

Review the monitor names, network interfaces, fonts, and module commands before using this configuration on another machine.

# BSPWM

This directory contains the main [BSPWM](https://github.com/baskerville/bspwm) session configuration.

***Language***
- 🇺🇸 English
- [🇪🇸 Español](./README.es.md)

## Files

- `bspwmrc`: starts the session, defines desktops, window rules, environment variables, wallpaper, Polybar, Picom, and keyboard layout.
- `scripts/bspwm_resize`: custom window-resizing helper.
- `scripts/ethernet_status.sh`: Ethernet status used by the bar.
- `scripts/vpn_status.sh`: VPN status used by the bar.
- `scripts/target_to_hack.sh`: target display helper for security labs.

## Session details

The configuration creates ten desktops, uses a 12-pixel window gap, enables monocle optimizations, starts `sxhkd`, and launches Polybar and Picom.

The default startup also sets the keyboard layout to `latam`, uses `nvim` as the editor, and loads a wallpaper from `/home/RafaxWolf/Wallpapers/bg.jpeg`.

Update machine-specific paths before using this configuration.

## Dependencies

Install the tools required by the session:

```bash
bspwm sxhkd polybar picom feh kitty rofi
```

Package names vary by distribution.

## Related documentation

- [SXHKD keybindings](../sxhkd/README.md)
- [Polybar](../polybar/README.md)
- [Picom](../picom/README.md)

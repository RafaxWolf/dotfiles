# Dotfiles de RafaxWolf

Configuración personal de Linux para un flujo de trabajo controlado mediante el teclado, con gestores de ventanas en mosaico, herramientas de terminal, desarrollo e investigación de seguridad.

***Idioma***
- [🇺🇸 English](./README.md)
- 🇪🇸 Español

***Enlaces rápidos***
- [BSPWM](./.config/bspwm/README.es.md)
- [SXHKD](./.config/sxhkd/README.es.md)
- [Polybar](./.config/polybar/README.es.md)
- [Qtile](./.config/qtile/README.es.md)
- [Kitty](./.config/kitty/README.es.md)
- [Neovim](./.config/nvim/README.es.md)
- [Fish](./.config/fish/README.es.md)
- [Ranger](./.config/ranger/README.es.md)
- [Rofi](./.config/rofi/README.es.md)
- [Picom](./.config/picom/README.es.md)
- [Ghidra](./.config/ghidra/README.es.md)

## Descripción general

Este repositorio contiene mis dotfiles y archivos de configuración personales. La sesión principal está construida alrededor de **BSPWM**, mientras que **Qtile** está disponible como gestor de ventanas alternativo.

Incluye configuraciones para:

- Gestores de ventanas en mosaico y atajos de teclado.
- Barras de estado, lanzadores, composición y fondos de pantalla.
- Kitty, Zsh, Fish y utilidades de terminal.
- Neovim, sus plugins, temas e integraciones.
- Ranger, Ghidra y scripts utilizados en desarrollo y laboratorios de seguridad.

Cada componente importante tiene su propio README con instrucciones y detalles de configuración. Empieza por el componente que quieras instalar en lugar de enlazar todo el repositorio de una vez.

## Instalación

Estos archivos están adaptados a mi equipo y pueden contener rutas, interfaces, fuentes y comandos específicos. Revisa la configuración antes de utilizarla.

```bash
git clone https://github.com/RafaxWolf/dotfiles.git "$HOME/dotfiles"
cd "$HOME/dotfiles"
```

Haz una copia de seguridad de tu configuración actual antes de crear enlaces:

```bash
mkdir -p "$HOME/dotfiles-backup"
cp -a "$HOME/.config" "$HOME/dotfiles-backup/config-$(date +%Y%m%d-%H%M%S)"
```

Después sigue el README del componente que quieras configurar. Se recomienda crear enlaces simbólicos de forma selectiva:

```bash
mkdir -p "$HOME/.config"
ln -sfn "$PWD/.config/bspwm" "$HOME/.config/bspwm"
ln -sfn "$PWD/.config/sxhkd" "$HOME/.config/sxhkd"
```

No enlaces todos los directorios sin revisarlos. Algunas configuraciones incluyen rutas como `/home/RafaxWolf` o `/opt/...` que debes cambiar primero.

## Estructura del repositorio

| Directorio | Documentación |
| --- | --- |
| `.config/bspwm/` | [README de BSPWM](./.config/bspwm/README.es.md) |
| `.config/sxhkd/` | [README de SXHKD](./.config/sxhkd/README.es.md) |
| `.config/polybar/` | [README de Polybar](./.config/polybar/README.es.md) |
| `.config/qtile/` | [README de Qtile](./.config/qtile/README.es.md) |
| `.config/kitty/` | [README de Kitty](./.config/kitty/README.es.md) |
| `.config/nvim/` | [README de Neovim](./.config/nvim/README.es.md) |
| `.config/fish/` | [README de Fish](./.config/fish/README.es.md) |
| `.config/ranger/` | [README de Ranger](./.config/ranger/README.es.md) |
| `.config/rofi/` | [README de Rofi](./.config/rofi/README.es.md) |
| `.config/picom/` | [README de Picom](./.config/picom/README.es.md) |
| `.config/ghidra/` | [README de Ghidra](./.config/ghidra/README.es.md) |

## Notas importantes

- Son dotfiles personales, no un instalador universal.
- Revisa las rutas absolutas, nombres de monitores, interfaces de red y distribución del teclado.
- No subas credenciales, tokens, claves privadas ni datos sensibles.
- Instala únicamente las dependencias del componente que estés configurando.

## Licencia

Este proyecto se distribuye bajo la [Licencia MIT](./LICENSE).

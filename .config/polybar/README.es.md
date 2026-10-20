# Polybar

Configuración de la barra de estado utilizada por la sesión de BSPWM.

***Idioma***
- [🇺🇸 English](./README.md)
- 🇪🇸 Español

## Archivos

- `current.ini`: configuración activa de la barra y sus módulos.
- `workspace.ini`: configuración de la barra de espacios de trabajo.
- `launch.sh`: detiene procesos existentes de Polybar e inicia las barras.
- `colors*.ini`: paletas de colores.
- `scripts/`: helpers para el lanzador, menú de energía y temas de Rofi.
- `fonts/`: fuentes incluidas en la configuración.

## Inicio

El archivo de inicio de BSPWM ejecuta:

```bash
~/.config/polybar/launch.sh
```

El script inicia barras para logs, Ethernet, VPN, seguimiento de objetivos, información del sistema y espacios de trabajo.

## Personalización

Revisa los monitores, interfaces de red, fuentes y comandos de los módulos antes de utilizar esta configuración en otro equipo.

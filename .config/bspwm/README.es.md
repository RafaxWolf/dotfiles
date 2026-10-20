# BSPWM

Este directorio contiene la sesión principal de [BSPWM](https://github.com/baskerville/bspwm).

***Idioma***
- [🇺🇸 English](./README.md)
- 🇪🇸 Español

## Archivos

- `bspwmrc`: inicia la sesión, define escritorios, reglas de ventanas, variables de entorno, fondo, Polybar, Picom y distribución del teclado.
- `scripts/bspwm_resize`: ayuda para redimensionar ventanas.
- `scripts/ethernet_status.sh`: estado de Ethernet utilizado por la barra.
- `scripts/vpn_status.sh`: estado de la VPN utilizado por la barra.
- `scripts/target_to_hack.sh`: ayuda para mostrar objetivos de laboratorios de seguridad.

## Detalles de la sesión

La configuración crea diez escritorios, utiliza un espacio de 12 píxeles entre ventanas, habilita optimizaciones del modo monocle, inicia `sxhkd` y lanza Polybar y Picom.

El inicio también configura el teclado `latam`, utiliza `nvim` como editor y carga un fondo desde `/home/RafaxWolf/Wallpapers/bg.jpeg`.

Actualiza las rutas específicas del equipo antes de utilizarla.

## Dependencias

Instala las herramientas necesarias:

```bash
bspwm sxhkd polybar picom feh kitty rofi
```

Los nombres de los paquetes dependen de la distribución.

## Documentación relacionada

- [Atajos de SXHKD](../sxhkd/README.es.md)
- [Polybar](../polybar/README.es.md)
- [Picom](../picom/README.es.md)

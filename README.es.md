# Dotfiles de RafaxWolf

> Configuración personal de Linux enfocada en gestores de ventanas en mosaico, productividad en la terminal, desarrollo y herramientas de seguridad.

***Idioma***
- [🇺🇸 English](./README.md)
- 🇪🇸 Español

***Enlaces rápidos***
- [BSPWM](./.config/bspwm)
- [Atajos de SXHKD](./.config/sxhkd/sxhkdrc)
- [Qtile](./.config/qtile/config.py)
- [Polybar](./.config/polybar)
- [Kitty](./.config/kitty)
- [Neovim](./.config/nvim)
- [Fish](./.config/fish)
- [Zsh](./.zshrc)
- [Ranger](./.config/ranger)
- [Licencia](./LICENSE)

## Descripción general

Este repositorio contiene mis dotfiles y configuraciones personales para el escritorio. Está pensado como referencia y punto de partida para construir un entorno Linux ligero y controlado principalmente mediante el teclado. La configuración está organizada sobre todo alrededor de **BSPWM**, e incluye también una configuración de **Qtile** para experimentar o usar sesiones alternativas.

La configuración combina:

- BSPWM y SXHKD para el mosaico de ventanas y el control mediante teclado.
- Polybar, Rofi, Picom y Feh para la interfaz del escritorio.
- Kitty, Zsh, Fish y prompts basados en Tide/Powerlevel para la terminal.
- Neovim con Vim-Plug, soporte de lenguajes, búsqueda difusa, navegación de archivos, formateo y temas.
- Scripts de estado para red, VPN, Ethernet y seguimiento de objetivos, orientados a laboratorios de seguridad y CTF.
- Ghidra, Ranger y utilidades de línea de comandos para desarrollo e ingeniería inversa.

> Estas son configuraciones personales, no un instalador universal. Revisa cada archivo antes de utilizarlo, especialmente los scripts que contienen rutas absolutas o comandos que cambian el estado del sistema.

## Estructura del repositorio

| Ruta | Propósito |
| --- | --- |
| `.config/bspwm/` | Inicio de BSPWM, reglas de escritorios, variables de entorno, fondo, compositor y scripts auxiliares. |
| `.config/sxhkd/` | Atajos de teclado para abrir aplicaciones y controlar BSPWM. |
| `.config/polybar/` | Barras de estado, colores, fuentes, script de inicio, temas y módulos. |
| `.config/qtile/` | Configuración alternativa de Qtile con layouts, grupos, widgets y atajos. |
| `.config/kitty/` | Configuración de Kitty, colores, fuente, shell y atajos para ventanas y pestañas. |
| `.config/nvim/` | Ajustes, atajos, temas, plugins y configuración específica de Neovim. |
| `.config/fish/` | Alias, configuración del prompt Tide y funciones auxiliares de Fish. |
| `.config/ranger/` | Configuración de Ranger y script auxiliar para instalar plugins. |
| `.config/rofi/` | Configuración del lanzador de aplicaciones Rofi. |
| `.config/picom/` | Configuración del compositor para X11. |
| `.config/ghidra/` | Preferencias y ajustes del espacio de trabajo de Ghidra. |
| `.bashrc`, `.zshrc` | Alias, historial, autocompletado, prompts y funciones auxiliares de shell. |

## Instalación

### 1. Haz una copia de seguridad

No reemplaces tus archivos actuales sin crear antes una copia de seguridad:

```bash
mkdir -p "$HOME/dotfiles-backup"
cp -a "$HOME/.config" "$HOME/dotfiles-backup/config-$(date +%Y%m%d-%H%M%S)"
cp -a "$HOME/.zshrc" "$HOME/.bashrc" "$HOME/dotfiles-backup/" 2>/dev/null || true
```

### 2. Clona el repositorio

```bash
git clone https://github.com/RafaxWolf/dotfiles.git "$HOME/dotfiles"
cd "$HOME/dotfiles"
```

### 3. Revisa y enlaza los archivos necesarios

Se recomienda utilizar enlaces simbólicos de forma selectiva para conservar tu configuración actual:

```bash
mkdir -p "$HOME/.config"
ln -sfn "$PWD/.config/bspwm" "$HOME/.config/bspwm"
ln -sfn "$PWD/.config/sxhkd" "$HOME/.config/sxhkd"
ln -sfn "$PWD/.config/polybar" "$HOME/.config/polybar"
ln -sfn "$PWD/.config/kitty" "$HOME/.config/kitty"
ln -sfn "$PWD/.config/nvim" "$HOME/.config/nvim"
ln -sfn "$PWD/.config/rofi" "$HOME/.config/rofi"
ln -sfn "$PWD/.config/picom" "$HOME/.config/picom"
```

Enlaza únicamente las shells que realmente utilices. Antes de activar la configuración de Zsh o Fish, revisa los alias y actualiza las rutas específicas de este equipo.

## Sesiones principales del escritorio

### BSPWM

BSPWM es la configuración principal del gestor de ventanas. `.config/bspwm/bspwmrc`:

- Inicia `sxhkd` si todavía no está ejecutándose.
- Crea diez escritorios.
- Configura bordes, espacios, proporción de división y reglas de ventanas.
- Inicia Polybar, Picom, la integración de VMware y el fondo de pantalla.
- Configura la distribución de teclado `latam`.
- Define `nvim` como editor predeterminado.

Inicia BSPWM desde tu gestor de inicio de sesión o sesión de X. Antes asegúrate de tener instalados `bspwm`, `sxhkd`, `polybar`, `picom`, `feh`, `kitty` y `rofi`.

### Qtile

`.config/qtile/config.py` contiene una sesión alternativa de Qtile con:

- `mod4`/Super como tecla modificadora.
- Layouts Columns y Max.
- Nueve grupos o espacios de trabajo.
- Una barra inferior con layout, grupos, prompt, título de ventana, systray, reloj y salida rápida.
- Atajos para enfocar, mover, redimensionar, hacer flotantes, poner en pantalla completa, recargar y cerrar Qtile.

El archivo de Qtile parte de la plantilla de configuración predeterminada, por lo que debes adaptar el terminal y los widgets a tu sistema.

## Atajos de teclado

### BSPWM y SXHKD

Estos son algunos de los atajos más utilizados:

| Atajo | Acción |
| --- | --- |
| `Super + Enter` | Abrir Kitty |
| `Super + D` | Abrir Rofi |
| `Super + W` | Cerrar la ventana enfocada |
| `Super + Shift + W` | Forzar el cierre de la ventana enfocada |
| `Super + M` | Alternar layout tiled/monocle |
| `Super + Q` | Salir de BSPWM |
| `Super + Shift + R` | Reiniciar BSPWM |
| `Super + Flechas` | Enfocar una ventana en una dirección |
| `Super + Shift + Flechas` | Intercambiar o mover una ventana |
| `Super + 1..9, 0` | Enfocar los escritorios 1–10 |
| `Super + Shift + 1..9, 0` | Enviar la ventana enfocada a un escritorio |
| `Super + T` | Estado tiled |
| `Super + Shift + T` | Estado pseudo-tiled |
| `Super + S` | Estado flotante |
| `Super + F` | Estado de pantalla completa |
| `Super + Alt + Flechas` | Redimensionar con el script personalizado de BSPWM |
| `Super + Escape` | Recargar SXHKD |

Consulta [`.config/sxhkd/sxhkdrc`](./.config/sxhkd/sxhkdrc) para ver la lista completa.

### Qtile

Qtile utiliza la misma convención con Super. Algunos atajos importantes son:

| Atajo | Acción |
| --- | --- |
| `Super + Enter` | Abrir el terminal detectado |
| `Super + H/J/K/L` | Mover el foco |
| `Super + Shift + H/J/K/L` | Mover ventanas |
| `Super + Ctrl + H/J/K/L` | Redimensionar ventanas |
| `Super + Tab` | Cambiar de layout |
| `Super + W` | Cerrar la ventana enfocada |
| `Super + F` | Alternar pantalla completa |
| `Super + T` | Alternar modo flotante |
| `Super + Ctrl + R` | Recargar Qtile |
| `Super + Ctrl + Q` | Salir de Qtile |
| `Super + 1..9` | Cambiar de grupo |
| `Super + Shift + 1..9` | Mover una ventana a un grupo |

## Configuración de la terminal

### Kitty

Kitty está configurado con Hack Nerd Font, un esquema de colores personalizado, 95 % de opacidad, Zsh como shell predeterminada y atajos para ventanas adyacentes, pestañas y nuevas ventanas.

### Zsh

`.zshrc` incluye:

- Alias de `batcat` y `lsd` para mostrar archivos y directorios de forma legible.
- Previsualizaciones de FZF utilizando `batcat`.
- Alias para Impacket y herramientas de seguridad.
- Funciones auxiliares `settarget` y `cleartarget`.
- Autocompletado, búsqueda de historial, resaltado de sintaxis y un prompt personalizado.

Algunos alias apuntan a instalaciones locales como `/opt/Responder` y `/opt/Wolf`; elimínalos o actualízalos si no tienes esas herramientas.

### Fish

Fish incluye alias modernos para `bat` y `lsd`, configuración del prompt Tide, atajos para `ncat` y `netexec`, y funciones para gestionar objetivos. Las funciones de objetivos escriben actualmente en una ruta específica del equipo, así que debes cambiarla antes de usarlas en otro ordenador.

## Neovim

La configuración de Neovim está separada en archivos de ajustes, atajos, plugins, temas y configuración específica de cada plugin. Los plugins se gestionan con [Vim-Plug](https://github.com/junegunn/vim-plug).

Instala Vim-Plug si es necesario, abre Neovim y ejecuta:

```vim
:PlugInstall
```

La configuración incluye soporte para:

- Autocompletado y herramientas de lenguajes mediante CoC.
- NERDTree e integración con Ranger.
- Búsqueda con FZF.
- Indicadores de cambios de Git mediante Signify.
- Comentarios, guías de indentación, cierre de etiquetas y formateo.
- Varios temas, entre ellos TokyoNight, Dracula, Ayu, Material, Monokai y OneDark.

## Polybar y scripts auxiliares

El lanzador de Polybar termina las barras existentes e inicia barras separadas para logs, Ethernet, estado de VPN, seguimiento de objetivos, espacios de trabajo e información principal del sistema. Los scripts de BSPWM también incluyen:

- Redimensionamiento dinámico de ventanas.
- Indicadores de Ethernet y VPN.
- Visualización del objetivo de un laboratorio.
- Scripts para el lanzador y el menú de energía.

Lee los scripts antes de ejecutarlos y sustituye rutas como `/home/RafaxWolf` por `$HOME` o por la ruta correcta de tu usuario.

## Dependencias

Los nombres exactos de los paquetes dependen de tu distribución. Esta configuración suele utilizar:

- **Gestor de ventanas:** `bspwm`, `sxhkd`, `qtile`
- **Herramientas del escritorio:** `polybar`, `rofi`, `picom`, `feh`
- **Terminal y shell:** `kitty`, `zsh`, `fish`, `lsd`, `bat`, `fzf`
- **Editor:** `neovim`, Vim-Plug y los runtimes necesarios para tus plugins
- **Utilidades:** `ranger`, `git`, Nerd Fonts y utilidades de X11
- **Seguridad e investigación:** `Ghidra`, Impacket, Responder, NetExec y otras herramientas según sea necesario

Instala únicamente lo que necesites y consulta la documentación de tu distribución para conocer los nombres actuales de los paquetes.

## Notas

- Este repositorio está adaptado a mi hardware, distribución de pantallas, teclado y herramientas instaladas.
- Varias configuraciones contienen rutas absolutas e interfaces específicas; actualízalas antes de reutilizarlas.
- La configuración de Polybar contiene secciones antiguas y experimentales. Verifica los módulos y las interfaces de red en tu sistema.
- Nunca subas credenciales, tokens, claves privadas ni datos personales sensibles a un repositorio de dotfiles.

## Licencia

Este proyecto se distribuye bajo la [Licencia MIT](./LICENSE).

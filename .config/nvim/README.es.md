# Neovim

Configuración personal de Neovim organizada en archivos de ajustes, atajos, plugins, temas y configuración específica de cada plugin.

***Idioma***
- [🇺🇸 English](./README.md)
- 🇪🇸 Español

## Características

- Gestión de plugins mediante Vim-Plug.
- Autocompletado y herramientas de lenguajes con CoC.
- Integración con NERDTree, Ranger y FZF.
- Indicadores de cambios de Git con Signify.
- Comentarios, guías de indentación, cierre de etiquetas y formateo.
- Varios temas, como TokyoNight, Dracula, Ayu, Material, Monokai y OneDark.
- Comportamiento separado para Neovim independiente e integración con VS Code.

## Instalación

### 1) Instalar paquetes base (Arch Linux)

Para esta configuración, instala al menos estas herramientas:

```bash
pacman -S neovim git curl nodejs npm ripgrep fzf ranger
```

> Algunos plugins pueden requerir dependencias extra según tu stack de lenguajes.

### 2) Instalar Vim-Plug

El nombre del paquete de Vim-Plug puede variar según la distribución.

#### Opción A (Arch Linux / AUR, preferida cuando esté disponible)

```bash
paru -S vim-plug
```

#### Opción B (alternativa oficial, funciona en cualquier sistema)

```bash
mkdir -p ~/.local/share/nvim/site/autoload
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Esta ruta corresponde a **Neovim** (`~/.local/share/nvim/site/autoload/plug.vim`).

### 3) Instalar plugins

Abre Neovim:

```bash
nvim
```

Ejecuta:

```vim
:PlugInstall
```

Luego reinicia Neovim.

Comandos útiles de Vim-Plug:

- `:PlugUpdate` actualiza plugins.
- `:PlugClean` elimina plugins que ya no están declarados.
- `:PlugStatus` muestra el estado de los plugins.

El punto de entrada principal es [`init.vim`](./init.vim). Las declaraciones de plugins están en [`vim-plug/plugins.vim`](./vim-plug/plugins.vim).

## Atajos

`<Leader>` es `\\` por defecto en Vim/Neovim, salvo que otra configuración lo cambie.
En este repositorio, Neovim independiente define `mapleader` como `<Space>` (`general/settings.vim`), mientras que en modo VS Code puede comportarse distinto.

### Mappings globales/básicos

| Modo | Atajo | Acción | Notas |
| --- | --- | --- | --- |
| Normal | `Ctrl+C` (`<C-c>`) | Escape (`<Esc>`) | Cancelación rápida |
| Inserción | `j luego k` / `k luego j` / `j luego j` / `k luego k` (`jk`, `kj`, `jj`, `kk`) | Salir de inserción | Alternativas rápidas a Escape |
| Normal | `Ctrl+S` (`<C-s>`) | Guardar (`:w`) | |
| Normal | `Ctrl+Q` (`<C-q>`) | Guardar y salir (`:wq!`) | |
| Normal | `Ctrl+B` (`<C-b>`) | Cerrar buffer actual (`:bd`) | |
| Normal | `Alt+J` / `Alt+K` (`<M-j>`, `<M-k>`) | Redimensionar alto de ventana | `-2` / `+2` |
| Normal | `Alt+H` / `Alt+L` (`<M-h>`, `<M-l>`) | Redimensionar ancho de ventana | `-2` / `+2` |
| Normal | `Ctrl+H` / `Ctrl+J` / `Ctrl+K` / `Ctrl+L` (`<C-h>`, `<C-j>`, `<C-k>`, `<C-l>`) | Navegar entre ventanas | |
| Normal *(no VS Code)* | `Tab` / `Shift+Tab` (`<Tab>`, `<S-Tab>`) | Siguiente/anterior buffer | Solo cuando `!exists('g:vscode')` |
| Visual | `J` / `K` | Mover líneas seleccionadas abajo/arriba | Conserva selección |
| Visual | `<` / `>` (`<`, `>`) | Reindentar conservando selección | `gv` |

### Mappings de plugins (Neovim independiente)

| Modo | Atajo | Acción | Plugin/Origen |
| --- | --- | --- | --- |
| Normal | `Espacio, luego n` (`<Leader>n`) | Alternar NERDTree | NERDTree |
| Normal | `Espacio, luego e` (`<Leader>e`) | `:CocCommand explorer` | CoC explorer |
| Normal | `Espacio, luego r` (`<Space>r`) | Alternar Ranger (`:RnvimrToggle`) | rnvimr |
| Normal | `Espacio, luego b` (`<Leader>b`) | `:Buffers` | FZF |
| Normal | `Espacio, luego g` (`<Leader>g`) | `:Rg` | FZF |
| Normal | `Espacio, luego t` (`<Leader>t`) | `:Tags` | FZF |
| Normal | `Espacio, luego m` (`<Leader>m`) | `:Marks` | FZF |
| Normal | `Espacio, luego p` (`<Leader>p`) | `:Prettier` | mapping de prettier.vim |
| Normal/Visual | `Espacio, luego /` (`<Space>/`) | Alternar comentario (`:Commentary`) | vim-commentary |
| Normal | `Espacio, luego g, luego j` / `Espacio, luego g, luego k` (`<Leader>gj`, `<Leader>gk`) | Siguiente/anterior hunk de git | vim-signify |

### Mappings de CoC (Neovim independiente)

| Modo | Atajo | Acción |
| --- | --- | --- |
| Normal | `[ luego g` / `] luego g` (`[g`, `]g`) | Diagnóstico anterior/siguiente |
| Normal | `g luego d` / `g luego y` / `g luego i` / `g luego r` (`gd`, `gy`, `gi`, `gr`) | Ir a definición/tipo/implementación/referencias |
| Normal | `K` | Mostrar documentación/hover |
| Normal | `Espacio, luego r, luego n` (`<Leader>rn`) | Renombrar símbolo |
| Normal/Visual | `Espacio, luego a` (`<Leader>a`) | Code action (selección/actual) |
| Normal | `Espacio, luego a, luego c` (`<Leader>ac`) | Code action para el buffer actual |
| Normal | `Espacio, luego q, luego f` (`<Leader>qf`) | Auto-fix en la línea actual |
| Visual + Operador-pendiente | `i luego f` / `a luego f` (`if`, `af`) | Text objects de función (inner/around) |
| Visual + Operador-pendiente | `i luego c` / `a luego c` (`ic`, `ac`) | Text objects de clase (inner/around) |

### Colisión de `<Leader>f`

`<Leader>f` está mapeado en dos lugares:

- CoC: formatear selección/actual (`nmap/xmap <leader>f`)
- FZF: buscador de archivos (`map <Leader>f :Files<CR>`)

Como existen ambos mappings, el comportamiento puede variar según modo y precedencia/orden de carga.
Si necesitas confirmarlo, revisa `:verbose map <Leader>f` y `:verbose xmap <Leader>f`.

### Modo VS Code

| Modo | Atajo | Acción |
| --- | --- | --- |
| Normal (integración VS Code Neovim) | `s` (`s`) | Salto EasyMotion de dos caracteres |

Revisa los requisitos de cada plugin antes de instalar herramientas de lenguajes.

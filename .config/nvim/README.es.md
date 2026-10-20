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

Instala [Vim-Plug](https://github.com/junegunn/vim-plug), abre Neovim y ejecuta:

```vim
:PlugInstall
```

El punto de entrada principal es [`init.vim`](./init.vim). Las declaraciones de plugins están en [`vim-plug/plugins.vim`](./vim-plug/plugins.vim).

Revisa los requisitos de cada plugin antes de instalar herramientas de lenguajes.

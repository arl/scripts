# Vim Cheatsheet

Leader key = `,`

---

## fzf — fuzzy finder

| Key | Mnemonic | Action |
|-----|----------|--------|
| `,f` | **f**iles | Find files from project root |
| `,F` | **F**older (current file's) | Find files in current file's directory |
| `,b` | **b**uffers | Switch between open buffers |
| `,m` | **m**ost recent | History / most-recently-used files |
| `,/` | **/** search | Live grep with ripgrep (`:Rg`) |
| `,t` | **t**ags (project) | Search ctags across project |
| `,T` | **T**ags (buffer) | Search tags in current buffer |
| `,l` | **l**ines | Fuzzy-search lines in current buffer |

**Inside any fzf window:**

| Key | Action |
|-----|--------|
| `<Enter>` | Open in current window |
| `<C-t>` | Open in new **t**ab |
| `<C-v>` | Open in **v**ertical split |
| `<C-x>` | Open in horizontal split |
| `<C-j>` / `<C-k>` | Navigate list |
| `<Tab>` | Multi-select (where supported) |

---

## vim-surround — quote/unquote

Repeatable with `.` (via vim-repeat).

| Key | Mnemonic | Action |
|-----|----------|--------|
| `ysiw"` | **y**ank **s**urround **i**nner **w**ord | Surround word with `"` |
| `ysiW'` | … inner **W**ORD | Surround WORD with `'` |
| `yss(` | **s**urround **s**entence (line) | Surround whole line with `()` |
| `ds"` | **d**elete **s**urround | Remove surrounding `"` |
| `cs"'` | **c**hange **s**urround | Change `"` → `'` |
| `cs([` | **c**hange **s**urround | Change `(` → `[` |
| `S"` | **S**urround (visual) | Surround visual selection with `"` |

**Surround pairs:** `"` `'` `` ` `` `(` `)` `[` `]` `{` `}` `<` `>`  
Use opening char `(` for `( padded )`, closing `)` for `(tight)`.

---

## vim-go — Go development

| Key | Mnemonic | Action |
|-----|----------|--------|
| `,o` | **o**ther file | Toggle between file and `_test.go` |
| `<C-LeftMouse>` | click | Go to definition (mouse) |
| `:GoTest` | | Run tests for current package |
| `:GoCoverage` | | Show test coverage |
| `:GoDoc` | | Show docs for symbol under cursor |
| `:GoRename` | | Rename symbol across project |
| `:GoImpl` | | Generate interface method stubs |
| `:GoFillStruct` | | Fill struct literal with fields |
| `:GoKeyify` | | Convert positional struct fields to keyed |
| `:GoAddTags` | | Add struct tags |
| `:GoRemoveTags` | | Remove struct tags |

---

## coc.nvim — LSP / completion

| Key | Mnemonic | Action |
|-----|----------|--------|
| `gd` | **g**o to **d**efinition | Jump to definition |
| `gy` | **g**o to t**y**pe | Jump to type definition |
| `gi` | **g**o to **i**mplementation | Jump to implementation |
| `gr` | **g**o to **r**eferences | List all references |
| `<Tab>` | | Next completion item |
| `<S-Tab>` | | Previous completion item |
| `:CocList outline` | | Symbols in current file |
| `:CocList diagnostics` | | All errors/warnings |
| `:CocAction` | | Code actions (fix, refactor…) |

---

## vim-easymotion — fast jumps

All commands start with `<leader><leader>` (i.e. `,,`).

| Key | Mnemonic | Action |
|-----|----------|--------|
| `,,w` | **w**ord | Jump to word start forward |
| `,,b` | **b**ack | Jump to word start backward |
| `,,f{c}` | **f**ind char | Jump to character forward |
| `,,F{c}` | **F**ind char back | Jump to character backward |
| `,,j` | **j** (down) | Jump to line below |
| `,,k` | **k** (up) | Jump to line above |

---

## quick-scope — f/t highlight helper

Automatically highlights the best target character when you press `f`, `F`, `t`, `T`. No extra keys needed — just use normal `f`/`t` motions and follow the highlights.

---

## argtextobj — function argument text object

| Key | Action |
|-----|--------|
| `via` | Select **a**rgument (inner, no comma) |
| `vaa` | Select **a**rgument (with comma) |
| `cia` | Change argument |
| `daa` | Delete argument (with comma) |

Works with any motion: `yaa`, `daa`, `caa`, etc.

---

## nerdcommenter — commenting

| Key | Mnemonic | Action |
|-----|----------|--------|
| `,cc` | **c**omment | Comment line/selection |
| `,cu` | **u**ncomment | Uncomment line/selection |
| `,ci` | **i**nvert | Toggle comment state |
| `,cs` | **s**exy | Block comment with decorations |
| `,c<Space>` | | Toggle comment (smart) |

---

## vim-fugitive — Git

| Key / Command | Mnemonic | Action |
|---------------|----------|--------|
| `:G` or `:Git` | | Git status (interactive) |
| `:Gdiff` | | Diff current file against index |
| `:Gblame` | | Inline git blame |
| `:GBrowse` | | Open file on GitHub (vim-rhubarb) |
| `:Gclog` | | Commit log for current file |
| `<C-LeftMouse>` in blame | | Jump to commit |

**In `:G` (status window):**

| Key | Action |
|-----|--------|
| `s` | Stage file/hunk |
| `u` | Unstage file/hunk |
| `=` | Toggle inline diff |
| `cc` | Commit |
| `ca` | Amend |
| `dd` | Diff |

---

## gv.vim — Git log browser

| Command | Action |
|---------|--------|
| `:GV` | Full repo commit log |
| `:GV!` | Commits touching current file |
| `:GV?` | Log as location list |

**Inside GV:** `o` / `Enter` to open commit diff, `q` to quit.

---

## vim-gitgutter — Git signs in gutter

| Key | Mnemonic | Action |
|-----|----------|--------|
| `]c` | next **c**hange | Jump to next hunk |
| `[c` | prev **c**hange | Jump to previous hunk |
| `,hp` | hunk **p**review | Preview hunk diff inline |
| `,hs` | hunk **s**tage | Stage hunk |
| `,hu` | hunk **u**ndo | Undo hunk |
| `ic` / `ac` | inner/all **c**hange | Text object for hunk |

---

## NERDTree — file browser

| Key | Action |
|-----|--------|
| `<F2>` | Toggle NERDTree panel |
| `o` / `Enter` | Open file or expand dir |
| `s` | Open in vertical split |
| `i` | Open in horizontal split |
| `t` | Open in new tab |
| `m` | Filesystem menu (create, rename, delete…) |
| `R` | Refresh tree |
| `I` | Toggle hidden files |
| `q` | Close NERDTree |

---

## Navigation (built-in + config)

| Key | Action |
|-----|--------|
| `<Alt-Left>` | Jump back (`<C-O>`) |
| `<Alt-Right>` | Jump forward (`<C-I>`) |
| `<C-Left>` | Pop tag stack |
| `<C-Right>` | Jump to tag under cursor |
| `<C-\>` | Open tag in vertical split |
| `<Space>` | Toggle fold |
| `gd` | Go to definition (coc) |
| `,<C-Left>` | Previous tab |
| `,<C-Right>` | Next tab |

---

## Folding

| Key | Action |
|-----|--------|
| `<Space>` | Toggle fold under cursor |
| `zR` | Open all folds |
| `zM` | Close all folds |
| `zv` (visual) | Create fold from selection |

---

## Windows & splits

| Key | Action |
|-----|--------|
| `<C-w>v` | Vertical split |
| `<C-w>s` | Horizontal split |
| `<C-w>h/j/k/l` | Navigate splits |
| `<C-w>=` | Equalize split sizes |
| `<C-w>o` | Close all splits but current |

---

## Clipboard (visual mode)

| Key | Action |
|-----|--------|
| `<C-c>` | Copy selection to system clipboard |
| `<C-x>` | Cut selection to system clipboard |
| `<C-v>` | Paste from system clipboard |

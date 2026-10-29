# Neovim Cheatsheet

Leader key = `,` — config: `~/.config/nvim/init.lua` (Neovim 0.11, native LSP + gopls)

---

## Go — what you can do now

gopls does the work (via Neovim's built-in LSP client). Formatting (gofumpt) and
import organizing run **automatically on save**.

### Navigation & info

| Key               | Mnemonic                  | Action                                                      |
| ----------------- | ------------------------- | ----------------------------------------------------------- |
| `gd`              | **g**o **d**efinition     | Jump to definition                                          |
| `<C-LeftMouse>`   | click                     | Jump to definition (mouse)                                  |
| `<C-]>` / `<C-t>` |                           | Jump to definition / pop back (tag stack, powered by gopls) |
| `grr`             | **g**o **r**eferences     | References → quickfix list                                  |
| `gri`             | **g**o **i**mplementation | Implementations of interface / method                       |
| `grt`             | **g**o **t**ype           | Type definition                                             |
| `gO`              |                           | Outline of current file (quickfix)                          |
| `K`               |                           | Hover: signature + docs (replaces `:GoDoc`)                 |
| `<C-s>` (insert)  |                           | Signature help while typing arguments                       |
| `,o`              | **o**ther file            | Toggle `foo.go` ⇄ `foo_test.go`                             |
| `,i`              | **i**nlay hints           | Toggle inline parameter names / inferred types              |

### Editing & refactoring

| Key                         | Mnemonic        | Action                                                       |
| --------------------------- | --------------- | ------------------------------------------------------------ |
| `grn`                       | **r**e**n**ame  | Rename symbol across the whole module (replaces `:GoRename`) |
| `gra`                       | code **a**ction | List gopls code actions at cursor (normal or visual)         |
| `:lua vim.lsp.buf.format()` |                 | Format manually (already done on save)                       |

`gra` is the Swiss-army key. Depending on where the cursor is and your gopls
version, it offers things like:

- **Fill struct** — populates a struct literal with all fields (replaces `:GoFillStruct`)
- **Extract function / method / variable** — select code in visual mode, then `gra`
- **Inline call / variable**
- **Declare missing method / Implement interface stubs** — put the cursor on a
  compile error like "does not implement …" (replaces `:GoImpl`)
- **Remove unused parameter**, **move parameter**, **organize imports**
- **Add / remove struct tags** and **add test for function** in recent gopls versions

If an action is missing, your gopls is older: `go install golang.org/x/tools/gopls@latest`.

### Running tests & builds

`:make` is wired to `go test` in Go buffers and parses failures into the **quickfix** list.

| Key / Command                         | Action                                                                 |
| ------------------------------------- | ---------------------------------------------------------------------- |
| `,r`                                  | Run `go test ./...`, open quickfix on failures                         |
| `:make! ./%:h`                        | Test only the current file's package (`!` = don't jump to first error) |
| `:make! -run TestName ./%:h`          | Run a single test                                                      |
| `:make! -race ./...`                  | Pass any extra `go test` flag                                          |
| `:!go test -cover ./%:h`              | Quick coverage percentage (no gutter display)                          |
| `:!go build ./...` / `:!go vet ./...` | Build / vet (output shown, not parsed)                                 |
| `:terminal`                           | Open a shell inside Neovim (`<C-\><C-n>` to leave terminal mode)       |

### Diagnostics

| Key / Command                     | Action                                 |
| --------------------------------- | -------------------------------------- |
| `]d` / `[d`                       | Next / previous diagnostic             |
| `<C-w>d`                          | Show full diagnostic in a float        |
| `,x`                              | Fuzzy list of diagnostics in this file |
| `:lua vim.diagnostic.setqflist()` | All diagnostics in the quickfix list   |

### Symbol search (replaces ctags)

| Key                           | Action                                             |
| ----------------------------- | -------------------------------------------------- |
| `,t`                          | Search symbols across the whole workspace (live)   |
| `,T`                          | Search symbols in the current file                 |
| `:FzfLua lsp_references`      | References in a fuzzy picker (instead of quickfix) |
| `:FzfLua lsp_implementations` | Same for implementations                           |
| `:FzfLua lsp_code_actions`    | Code actions in a fuzzy picker                     |

### Old vim-go command → new equivalent

| Old                            | New                                                                  |
| ------------------------------ | -------------------------------------------------------------------- |
| `:GoTest`                      | `,r` or `:make! ./%:h`                                               |
| `:GoDoc`                       | `K`                                                                  |
| `:GoRename`                    | `grn`                                                                |
| `:GoImpl`                      | `gra` on the "missing method" error                                  |
| `:GoFillStruct`                | `gra` inside the struct literal                                      |
| `:GoAddTags` / `:GoRemoveTags` | `gra` on the struct (recent gopls), otherwise the `gomodifytags` CLI |
| `:GoAlternate`                 | `,o`                                                                 |
| `:GoCoverage`                  | `:!go test -cover ./%:h` — no in-buffer highlighting                 |
| `:GoKeyify`                    | no direct equivalent                                                 |

### Debugging the setup

| Command                                                        | Action                            |
| -------------------------------------------------------------- | --------------------------------- |
| `:checkhealth vim.lsp`                                         | Is gopls attached? Right version? |
| `:lua vim.cmd.edit(vim.lsp.log.get_filename())`                | Open the LSP log                  |
| `:lua vim.lsp.stop_client(vim.lsp.get_clients())` then `:edit` | Restart gopls                     |

---

## Completion (native LSP)

Completion appears automatically as you type.

| Key                 | Action                                                                |
| ------------------- | --------------------------------------------------------------------- |
| `<Tab>` / `<S-Tab>` | Next / previous item — or jump to next / previous snippet placeholder |
| `<C-n>` / `<C-p>`   | Same, without the snippet logic                                       |
| `<C-y>`             | Accept the selected item                                              |
| `<C-e>`             | Close the popup                                                       |
| `<C-x><C-o>`        | Trigger completion manually                                           |

With `usePlaceholders` on, completing a function inserts its parameters as
placeholders; `<Tab>` jumps through them.

---

## fzf-lua — fuzzy finder

Needs the `fzf` and `rg` binaries.

| Key  | Mnemonic                    | Action                                     |
| ---- | --------------------------- | ------------------------------------------ |
| `,f` | **f**iles                   | Find files from project root               |
| `,F` | **F**older (current file's) | Find files in the current file's directory |
| `,b` | **b**uffers                 | Switch between open buffers                |
| `,m` | **m**ost recent             | Recently opened files                      |
| `,/` | **/** search                | Live grep (ripgrep)                        |
| `,l` | **l**ines                   | Fuzzy-search lines in current buffer       |
| `,t` | **t**ags → symbols          | Workspace symbols (gopls)                  |
| `,T` | **T**ags → symbols          | Symbols in current file                    |
| `,x` | diagnostics                 | Diagnostics in current file                |

**Inside any fzf window:**

| Key               | Action                                                     |
| ----------------- | ---------------------------------------------------------- |
| `<Enter>`         | Open in current window                                     |
| `<C-t>`           | Open in new **t**ab                                        |
| `<C-v>`           | Open in **v**ertical split                                 |
| `<C-s>`           | Open in horizontal split (was `<C-x>` in fzf.vim)          |
| `<C-j>` / `<C-k>` | Navigate list                                              |
| `<Tab>`           | Select / unselect item (multi-select)                      |
| `<A-q>`           | Send selected items (or all, if `<A-a>` first) to quickfix |

---

## Quickfix (grep results, test failures, references)

| Key / Command               | Action                                             |
| --------------------------- | -------------------------------------------------- |
| `:copen` / `:cclose`        | Open / close the list                              |
| `]q` / `[q`                 | Next / previous entry                              |
| `:cdo s/old/new/ \| update` | Run a substitute on every entry (replaces far.vim) |

Project-wide replace: `,/` → grep for the text → `<A-a>` then `<A-q>` →
`:cdo s/old/new/ | update`.

**Heads-up:** `gdefault` is on, so `:s/a/b/` is already global on the line.
Adding `g` turns it **off** (first match only).

---

## Commenting (built in)

| Key           | Action                      |
| ------------- | --------------------------- |
| `gcc`         | Toggle comment on line      |
| `gc` (visual) | Toggle comment on selection |
| `gcip`        | Toggle comment on paragraph |
| `3gcc`        | Toggle comment on 3 lines   |

---

## vim-surround — quote/unquote

Repeatable with `.` (via vim-repeat).

| Key     | Mnemonic                                 | Action                             |
| ------- | ---------------------------------------- | ---------------------------------- |
| `ysiw"` | **y**ank **s**urround **i**nner **w**ord | Surround word with `"`             |
| `ysiW'` | … inner **W**ORD                         | Surround WORD with `'`             |
| `yss(`  | **s**urround **s**entence (line)         | Surround whole line with `()`      |
| `ds"`   | **d**elete **s**urround                  | Remove surrounding `"`             |
| `cs"'`  | **c**hange **s**urround                  | Change `"` → `'`                   |
| `cs([`  | **c**hange **s**urround                  | Change `(` → `[`                   |
| `S"`    | **S**urround (visual)                    | Surround visual selection with `"` |

**Surround pairs:** `"` `'` `` ` `` `(` `)` `[` `]` `{` `}` `<` `>`
Use opening char `(` for `( padded )`, closing `)` for `(tight)`.

---

## quick-scope — f/t highlight helper

Automatically highlights the best target character when you press `f`, `F`, `t`, `T`.
No extra keys needed — just use normal `f`/`t` motions and follow the highlights.

---

## argtextobj — function argument text object

| Key   | Action                                |
| ----- | ------------------------------------- |
| `via` | Select **a**rgument (inner, no comma) |
| `vaa` | Select **a**rgument (with comma)      |
| `cia` | Change argument                       |
| `daa` | Delete argument (with comma)          |

Works with any motion: `yaa`, `daa`, `caa`, etc.

---

## vim-fugitive — Git

| Key / Command   | Mnemonic | Action                                         |
| --------------- | -------- | ---------------------------------------------- |
| `:G` or `:Git`  |          | Git status (interactive)                       |
| `:Gdiffsplit`   |          | Diff current file against index (was `:Gdiff`) |
| `:Git blame`    |          | Blame sidebar (was `:Gblame`)                  |
| `:GBrowse`      |          | Open file on GitHub (vim-rhubarb)              |
| `:Gclog`        |          | Commit log for current file (quickfix)         |
| `<CR>` in blame |          | Open the commit under cursor                   |

**In `:G` (status window):**

| Key         | Action                       |
| ----------- | ---------------------------- |
| `s` / `u`   | Stage / unstage file or hunk |
| `-`         | Toggle stage / unstage       |
| `=`         | Toggle inline diff           |
| `cc`        | Commit                       |
| `ca`        | Amend                        |
| `dd` / `dv` | Diff (horizontal / vertical) |

---

## diffview.nvim — Git diffs & history (replaces gv.vim)

| Command                     | Action                                |
| --------------------------- | ------------------------------------- |
| `:DiffviewOpen`             | All working-tree changes side by side |
| `:DiffviewOpen HEAD~3`      | Changes since 3 commits ago           |
| `:DiffviewOpen main...HEAD` | Everything on this branch vs main     |
| `:DiffviewFileHistory`      | Commit history of the repo            |
| `:DiffviewFileHistory %`    | Commit history of the current file    |
| `:DiffviewClose`            | Close it                              |

**Inside:** `<Tab>` / `<S-Tab>` next / previous file, `-` stage / unstage, `g?` full help.

---

## gitsigns — Git signs in gutter

| Key   | Mnemonic             | Action                            |
| ----- | -------------------- | --------------------------------- |
| `]c`  | next **c**hange      | Jump to next hunk                 |
| `[c`  | prev **c**hange      | Jump to previous hunk             |
| `,hp` | **h**unk **p**review | Preview hunk diff in a float      |
| `,hs` | **h**unk **s**tage   | Stage hunk                        |
| `,hu` | **h**unk **u**ndo    | Reset (discard) hunk              |
| `,hb` | **h**unk **b**lame   | Blame the current line            |
| `ih`  | inner **h**unk       | Text object for hunk (e.g. `dih`) |

---

## nvim-tree — file browser

| Key             | Action                                          |
| --------------- | ----------------------------------------------- |
| `<F2>`          | Toggle tree panel                               |
| `<Enter>` / `o` | Open file or expand dir                         |
| `<C-v>`         | Open in vertical split                          |
| `<C-x>`         | Open in horizontal split                        |
| `<C-t>`         | Open in new tab                                 |
| `a`             | Create file (end name with `/` for a directory) |
| `r` / `d`       | Rename / delete                                 |
| `c` / `x` / `p` | Copy / cut / paste                              |
| `R`             | Refresh tree                                    |
| `H`             | Toggle dotfiles                                 |
| `-`             | Go up to parent directory                       |
| `g?`            | Show all keys                                   |
| `q`             | Close                                           |

---

## Navigation

| Key               | Action                        |
| ----------------- | ----------------------------- |
| `<A-Left>`        | Jump back (`<C-o>`)           |
| `<A-Right>`       | Jump forward (`<C-i>`)        |
| `<C-]>` / `<C-t>` | Definition / back (via gopls) |
| `gd`              | Go to definition              |
| `,<C-Left>`       | Previous tab                  |
| `,<C-Right>`      | Next tab                      |
| `<Esc>`           | Clear search highlight        |

---

## Folding

Folds come from gopls (functions, blocks, imports…). Everything starts open.

| Key         | Action                   |
| ----------- | ------------------------ |
| `<Space>`   | Toggle fold under cursor |
| `zR`        | Open all folds           |
| `zM`        | Close all folds          |
| `zo` / `zc` | Open / close fold        |

Manual folds (`zf`) don't work while a fold expression is active.

---

## Windows & splits

| Key            | Action                       |
| -------------- | ---------------------------- |
| `<C-w>v`       | Vertical split               |
| `<C-w>s`       | Horizontal split             |
| `<C-w>h/j/k/l` | Navigate splits              |
| `<C-w>=`       | Equalize split sizes         |
| `<C-w>o`       | Close all splits but current |

---

## Clipboard

`clipboard=unnamedplus` is on: the system clipboard **is** the default register.

| Key               | Action                                               |
| ----------------- | ---------------------------------------------------- |
| `y` / `d` / `c`   | Also copy to the system clipboard                    |
| `p` / `P`         | Paste from the system clipboard                      |
| `<C-r>+` (insert) | Paste from clipboard (or `<C-S-v>` in your terminal) |
| `"_d`             | Delete **without** touching the clipboard            |

The old `<C-c>` / `<C-x>` / `<C-v>` mappings were removed.

---

## Housekeeping

| Command        | Action                                                          |
| -------------- | --------------------------------------------------------------- |
| `:Lazy`        | Plugin manager UI (`U` update all, `S` sync)                    |
| `:checkhealth` | Diagnose Neovim, LSP, clipboard, providers                      |
| `:trust`       | Allow a project-local `.nvim.lua` (needed because `exrc` is on) |

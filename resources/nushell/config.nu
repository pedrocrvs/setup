# This configuration file was written to match the order of sections in `config nu --doc` as of version 0.103.0.

# History-related settings
$env.config.history.file_format = "sqlite"
$env.config.history.isolation = true
$env.config.history.max_size = 5_000_000


# Miscellaneous settings
$env.config.recursion_limit = 50
$env.config.rm.always_trash = true
$env.config.show_banner = false


# Command editor settings
$env.config.buffer_editor = "/mnt/c/Program Files/Microsoft VS Code/bin/code"
$env.config.cursor_shape.emacs = "inherit"
$env.config.edit_mode = "emacs"


# Completions behavior
$env.config.completions.algorithm = "prefix"
$env.config.completions.case_sensitive = false
$env.config.completions.partial = true
$env.config.completions.quick = true
$env.config.completions.sort = "smart"
$env.config.completions.use_ls_colors = false


# External completions
$env.config.completions.external.completer = {|spans: list<string>| carapace $spans.0 nushell ...$spans | from json | if ($in | default [] | where value =~ '^-.*ERR$' | is-empty) { $in } else { null }}
$env.config.completions.external.enable = true
$env.config.completions.external.max_results = 10


# Terminal integration
$env.config.bracketed_paste = true
$env.config.shell_integration.osc133 = false
$env.config.shell_integration.osc2 = false
$env.config.shell_integration.osc633 = true
$env.config.shell_integration.osc7 = false
$env.config.shell_integration.osc8 = false
$env.config.shell_integration.osc9_9 = false
$env.config.shell_integration.reset_application_mode = false
$env.config.use_ansi_coloring = true
$env.config.use_kitty_protocol = false


# Error display settings
$env.config.display_errors.exit_code = false
$env.config.display_errors.termination_signal = true
$env.config.error_style = "fancy"


# Table display
$env.config.footer_mode = 25
$env.config.table.abbreviated_row_count = null
$env.config.table.footer_inheritance = false
$env.config.table.header_on_separator = false
$env.config.table.index_mode = "always"
$env.config.table.mode = "rounded"
$env.config.table.padding.left = 1
$env.config.table.padding.right = 1
$env.config.table.show_empty = true
$env.config.table.trim = { methodology: "truncating" truncating_suffix: "..." }


# Datetime display
$env.config.datetime_format.normal = "%Y-%m-%d %H:%M:%S"
$env.config.datetime_format.table = "%Y-%m-%d %H:%M:%S"


# Filesize display
$env.config.filesize.precision = 2
$env.config.filesize.show_unit = true
$env.config.filesize.unit = 'metric'


# Miscellaneous display
$env.config.float_precision = 2
$env.config.ls.use_ls_colors = true
$env.config.render_right_prompt_on_last_line = false


# Hooks


# Keybindings


# Menus


# Plugin behavior


# Themes/colors and syntax highlighting
## Structures
$env.config.color_config.shape_keyword = null # Not current used
$env.config.color_config.shape_literal = null # Not currently used

$env.config.color_config.shape_block = "white" # if true { echo "This is true" }
$env.config.color_config.shape_closure = "white" # let add = { |x, y| $x + $y }
$env.config.color_config.shape_list = "white" # ["Gold", "Red", "Blue", "Purple"]
$env.config.color_config.shape_record = "white" # { joker: "Baseball Card", effect: "Uncommon Jokers each give x1.5 mult" }
$env.config.color_config.shape_signature = "white" # def multiply [x: int y: int] { $x * $y }
$env.config.color_config.shape_table = "white" # [["Edition", "Effect"]; ["Foil", "+50 chips"] ["Holographic", "+10 mult"] ["Polychrome", "x1.5 mult"]]

$env.config.color_config.shape_vardecl = "light_cyan" # let hand = "Flush"
$env.config.color_config.shape_variable = "light_cyan" # let voucher = "Money Tree"; $voucher

$env.config.color_config.shape_operator = "light_magenta" # true and false
$env.config.color_config.shape_pipe = "light_magenta" # "Planet cards level up their associated poker hand type" | echo
$env.config.color_config.shape_redirection = "light_magenta_italic" # cat planet-card.txt out+err> output-or-error.txt

$env.config.color_config.hints = "white_dimmed"
$env.config.color_config.search_result = "green_underline" # "Planet cards, spectral cards and tarot cards" | find "cards"
$env.config.color_config.shape_garbage = "light_red" # def add_one [number: int] { number + 1 }; add_one "Definitely not an integer. This is garbage"
$env.config.color_config.shape_match_pattern = "light_green_italic" # match 4 { 1 => "One" 2 => "Two" 3 => "Three" _ => "I do not know" }
$env.config.color_config.shape_matching_brackets = "light_yellow" # [["B"] ["a"] ["l"] ["a"] ["t"] ["r"] ["o"]]

$env.config.color_config.shape_flag = "bright_white"
$env.config.color_config.shape_internalcall = "bright_white"

$env.config.highlight_resolved_externals = true
$env.config.color_config.shape_external = "light_red"
$env.config.color_config.shape_external_resolved = "bright_white"
$env.config.color_config.shape_externalarg = "bright_white"

## Tables
$env.config.color_config.header = "green_bold"  # When I tested with Nushell 0.102.0 and Visual Studio Code 1.98.2, both the header and row index appear in the light version of the color
$env.config.color_config.leading_trailing_space_bg = "light_red_underline" # [["Edition", "Effect"]; ["Polychrome  ", "x1.5 mult   "]]
$env.config.color_config.row_index = "green_bold"
$env.config.color_config.separator = "white"

## Data types
$env.config.color_config.shape_nothing = "light_green_dimmed" # null

$env.config.color_config.shape_string = "green" # "Choose 1 of up to 3 playing cards"
$env.config.color_config.shape_string_interpolation = "green_italic" # $"Choose (random int 1..5) of up to (random int 1..10) playing cards"
$env.config.color_config.shape_raw_string = "green_bold" # r#"\d+\.\d{2}"#

$env.config.color_config.shape_directory = "green_underline"
$env.config.color_config.shape_filepath = "green_underline"
$env.config.color_config.shape_globpattern = "green_underline"

$env.config.color_config.shape_binary = "light_green" # 0b[10101010101]
$env.config.color_config.shape_bool = "light_green" # true
$env.config.color_config.shape_custom = "light_green"
$env.config.color_config.shape_datetime = "light_green" # 2000-01-26T14:27:40-03:00
$env.config.color_config.shape_float = "light_green" # 2.225
$env.config.color_config.shape_int = "light_green" # 58
$env.config.color_config.shape_range = "light_green" # 1..10

## Data types inside structures
$env.config.color_config.string = "white"
$env.config.color_config.date = "white"

$env.config.color_config.bool = {|| if $in { "light_green" } else { "light_green_dimmed" }}

$env.config.color_config.binary = "light_green"
$env.config.color_config.custom = "light_green"
$env.config.color_config.duration = "light_green"
$env.config.color_config.filesize = "light_green"
$env.config.color_config.float = "light_green"
$env.config.color_config.glob = "light_green"
$env.config.color_config.int = "light_green"
$env.config.color_config.range = "light_green"


# `explore` command colors


# Environment variables
$env.LESSHISTFILE = "/dev/null"

$env.HOMEBREW_PREFIX = "/home/linuxbrew/.linuxbrew"
$env.HOMEBREW_CELLAR = "/home/linuxbrew/.linuxbrew/Cellar"
$env.HOMEBREW_REPOSITORY =  "/home/linuxbrew/.linuxbrew/Homebrew"
$env.PATH = [ "/home/linuxbrew/.linuxbrew/bin", "/home/linuxbrew/.linuxbrew/sbin" ] ++ $env.PATH

$env.PROMPT_COMMAND = { || starship prompt }
$env.PROMPT_COMMAND_RIGHT = ""
$env.PROMPT_INDICATOR = ""

$env.LS_COLORS = "bd=97:cd=97:di=97:ex=97:fi=97:ln=4;97:mi=4;91:or=4;91:ow=97:pi=97:sg=97:so=97:st=97:su=97:tw=97"

$env.BROWSER = "/mnt/c/Program Files/Google/Chrome/Application/chrome.exe"


# Aliases and custom commands

alias code = ^"/mnt/c/Program Files/Microsoft VS Code/bin/code"

def ll [glob: glob = "." ] {
    ls --all --long $glob
    | upsert "name" {|row| if $row.type == "dir" { $"($row.name)/" } else { $row.name } }
    | insert "extension" { |row| $row.name | split row "." | last }
    | sort-by "type" "extension" "name"
    | select "name" "mode" "modified"
}

alias pp = echo $env.PATH

alias rr = rm --force --recursive --trash --verbose

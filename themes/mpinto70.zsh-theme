# MPINTO70 - created from CRUNCH theme.
# * time is shown with seconds
# * no RVM
# * current directory
# * git branch with ahead/behind flag
#
# Colors are at the top so you can mess with those separately if you like.
# For the most part I stuck with Dallas's.

MPINTO70_BRACKET_COLOR="%{$fg[white]%}"
MPINTO70_TIME_COLOR="%{$fg[yellow]%}"
MPINTO70_RVM_COLOR="%{$fg[magenta]%}"
MPINTO70_DIR_COLOR="%{$fg_bold[white]%}"
MPINTO70_HOST_COLOR="%{$fg_bold[cyan]%}"
MPINTO70_GIT_BRANCH_COLOR="%F{135}"
MPINTO70_GIT_CLEAN_COLOR="%{$fg_bold[green]%}"
MPINTO70_GIT_DIRTY_COLOR="%{$fg_bold[red]%}"
MPINTO70_GIT_AHEAD_COLOR="%{$fg_bold[green]%}"
MPINTO70_GIT_BEHIND_COLOR="%{$fg_bold[yellow]%}"
MPINTO70_GIT_DIVERGED_COLOR="%F{166}"

# These Git variables are used by the oh-my-zsh git_prompt_info helper:
ZSH_THEME_GIT_PROMPT_PREFIX="$MPINTO70_GIT_BRANCH_COLOR"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_CLEAN=" $MPINTO70_GIT_CLEAN_COLOR✓"
ZSH_THEME_GIT_PROMPT_DIRTY=" $MPINTO70_GIT_DIRTY_COLOR✗"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="$MPINTO70_GIT_AHEAD_COLOR▶"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="$MPINTO70_GIT_BEHIND_COLOR◀"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="$MPINTO70_GIT_DIVERGED_COLOR◀ ▶"

# Our elements:
MPINTO70_TIME_="$MPINTO70_BRACKET_COLOR$MPINTO70_TIME_COLOR%*$MPINTO70_BRACKET_COLOR%{$reset_color%}"
MPINTO70_HOST_="$MPINTO70_BRACKET_COLOR$MPINTO70_HOST_COLOR%M$MPINTO70_BRACKET_COLOR%{$reset_color%}"
MPINTO70_DIR_="$MPINTO70_DIR_COLOR%~"
MPINTO70_SEPARATOR="$MPINTO70_BRACKET_COLOR-"
MPINTO70_PROMPT=$'\n'" $MPINTO70_GIT_CLEAN_COLOR$ "

function mpinto70_prompt() {
    local preamble="$MPINTO70_TIME_%{$reset_color%} $MPINTO70_HOST_ $MPINTO70_DIR_%{$reset_color%}"
    local epilogue="$MPINTO70_PROMPT%{$reset_color%}"
    local name="$(git_current_branch)"
    if [[ -z $name ]]; then
        echo "$preamble $epilogue"
    else
        local git_prmpt="$(git_prompt_info)"
        local git_remot="$(git_remote_status)"
        echo "$preamble $MPINTO70_SEPARATOR $git_prmpt $git_remot $epilogue"
    fi
}

# Put it all together!
PROMPT="\$(mpinto70_prompt)"

# More symbols to choose from:
# ☀ ✹ ☄ ♆ ♀ ♁ ♐ ♇ ♈ ♉ ♚ ♛ ♜ ♝ ♞ ♟ ♠ ♣ ⚢ ⚲ ⚳ ⚴ ⚥ ⚤ ⚦ ⚒ ⚑ ⚐ ♺ ♻ ♼ ☰ ☱ ☲ ☳ ☴ ☵ ☶ ☷
# ✡ ✔ ✖ ✚ ✱ ✤ ✦ ❤ ➜ ➟ ➼ ✂ ✎ ✐ ⨀ ⨁ ⨂ ⨍ ⨎ ⨏ ⨷ ⩚ ⩛ ⩡ ⩱ ⩲ ⩵  ⩶ ⨠
# ⬅ ⬆ ⬇ ⬈ ⬉ ⬊ ⬋ ⬒ ⬓ ⬔ ⬕ ⬖ ⬗ ⬘ ⬙ ⬟  ⬤ 〒 ǀ ǁ ǂ ĭ Ť Ŧ
# ♥ ❮ ✈ ✭ ✗ ➦
# ◀ ▶ ≪≫

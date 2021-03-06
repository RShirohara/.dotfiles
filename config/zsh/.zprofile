# Executes commands at login pre-zshrc.

## Paths
### Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

### Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

### Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  ~/.local/bin
  $path
)

## Editors
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

## Language
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

## Less

### Set the default Less options.
export LESS='-g -i -M -R -S -w -z-4'

### Set the Less input preprocessor.
### Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

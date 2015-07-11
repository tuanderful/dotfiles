PROMPT_FILE="$HOME/.dotfiles_prompt"
DEFAULT_THEME="powerline"
THEME="$DEFAULT_THEME"

if [ -e $PROMPT_FILE ] ; then
  THEME=`cat $PROMPT_FILE`
fi

if [ ! -e $DOTFILES/prompts/$THEME.sh ] ; then
  THEME="$DEFAULT_THEME"
fi

source $DOTFILES/prompts/$THEME.sh

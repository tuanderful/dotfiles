USE_PROMPT="$HOME/.oh-my-git/prompt.sh"
PROMPT_FILE="$HOME/.dotfiles_prompt"

if [ -e $PROMPT_FILE ] ; then
  USE_PROMPT=`cat $PROMPT_FILE`
fi

if [ ! -e $USE_PROMPT ] ; then
  USE_PROMPT="$DOTFILES/prompts/$USE_PROMPT.sh"
fi

if [ ! -e $USE_PROMPT ] ; then
  error "Couldn't set a prompt."
fi

source $USE_PROMPT

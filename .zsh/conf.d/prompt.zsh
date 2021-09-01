# ==========================================
#               Prompt
# ==========================================
if [ -f ~/.zsh/prompt.sh ]; then
  source ~/.zsh/prompt.sh
else
  PROMPT="%m:./ LOGNAME$ "
  RPROMPT="~/.zsh/prompt.sh not found"
fi

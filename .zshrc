#
# ______     ______     __  __     ______     ______    
#/\___  \   /\  ___\   /\ \_\ \   /\  == \   /\  ___\   
#\/_/  /__  \ \___  \  \ \  __ \  \ \  __<   \ \ \____  
#  /\_____\  \/\_____\  \ \_\ \_\  \ \_\ \_\  \ \_____\ 
#  \/_____/   \/_____/   \/_/\/_/   \/_/ /_/   \/_____/ 
#                                                       
# .zshrc 2011-



#echo Welcome to Darwin!  # Oldschool mac style


for conf in `ls -1d .zsh/conf.d/*` 
do
  source $conf
done

if [ -f $HOME/.zshrc.local ]; then
      source $HOME/.zshrc.local
fi

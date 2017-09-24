# Defined in /Users/ayu/.config/fish/functions/fish_user_key_bindings.fish @ line 2
function fish_user_key_bindings
	bind -M insert \cu 'echo;set_color red; echo (pwd); set_color normal;cd .. ; commandline -f repaint'
    bind -M insert \ci accept-autosuggestion
end

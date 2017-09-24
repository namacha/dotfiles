# ============================
#      Color Settings
# ============================
set ROOTUESRCOLOR green
set USERCOLOR red
set DIRCOLOR green
set SUCCESSCOLOR cyan
set FAILCOLOR red
set SUCCESS "✖╹◡╹✖"
set FAIL "✖>_<✖"

function fish_prompt

  set -l last_status $status

  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end

  if [ $last_status -eq 0 ]
    set face $SUCCESS
  else
    set face $FAIL
  end

  if test "$fish_key_bindings" = "fish_vi_key_bindings"
      switch $fish_bind_mode
          case default
              set color white
          case insert
              set color cyan
          case visual
              set color yellow
      end
  end

  printf "%s%s%s %s:%s%s %s%s%s\$ " (set_color $color) $face (set_color normal) $__fish_prompt_hostname (set_color green) (prompt_pwd) (set_color red) $USER (set_color normal)

end



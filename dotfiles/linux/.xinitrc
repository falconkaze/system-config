#setleds -D +num
# 在图形界面设置英文
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_CTYPE=zh_CN.UTF-8

# 全中文设置
#export LANG=en_US.UTF-8
#export LANGUAGE=en_US.UTF-8
#export LC_CTYPE=en_US.UTF-8

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
#export SDL_IM_MODULE=fcitx
#export INPUT_METHOD  DEFAULT=fcitx

[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

xset -b
# 禁用pc喇叭 https://wiki.archlinux.org/index.php/Disable_PC_speaker_beep_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)
#xrdb -load ~/.Xresources
fcitx5 &
exec i3
#exec sawfish

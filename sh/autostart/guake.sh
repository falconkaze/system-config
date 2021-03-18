
#!/usr/bin/env bash

#guake &

guake -r git -e "tmux new -s work"
# 下面这两个命令不能合并为一行，如果合在一起会导致两条命令都在同一层shell中执行，得不到预期的结果。涉及到切换shell的命令（比如tmux就是创建一个子shell），不要把命令合并在一起。同理，要使用shell脚本切换当前目录，必须使用source命令，因为默认情况下，shell脚本是在当前shell的子shell中执行的，影响不到当前目录。
guake -n 1 -r ydcv -e "tmux new -s ydcv"
guake -e "tmux split-window -h;ydcv"
guake -e "note;vim + english.md"

guake -n 1 -r note -e "tmux new -s note"
guake -e 'note'

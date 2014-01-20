
" Enable this if you mistype :w as :W or :q as :Q.
nmap :W :w
nmap :W! :w!
nmap :Q :q
nmap :Q! :q!
nmap :WQ :wq
nmap :Wq! :wq!
nmap :WQ! :wq!

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif


" Use brighter colors if has a dark background.
set background=dark

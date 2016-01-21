
" Enable this if you mistype :w as :W or :q as :Q.
nmap :W :w
nmap :W! :w!
nmap :Q :q
nmap :Q! :q!
nmap :WQ :wq
nmap :Wq! :wq!
nmap :WQ! :wq!

map q gq}

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif



" autocorrect
iab teh the
iab hte the


" set statusline=%F%m%r%h%w\ %=%y\ POS=%v,%l\/%L\ \ %p%%
set statusline=%{&ff}\ \%{&fenc}\ \b%1.3n\ \%#StatusFTP#\%Y\ \%#StatusRO#\%R\ \%#StatusHLP#\%H\ \%#StatusPRV#\%W\ \%#StatusModFlag#\%M\ \%#StatusLine#\%f\%=\%1.7c\ \%1.7l/%L\ \%p%%
set laststatus=2

" set showmode        " show mode in status line
" set showcmd         " show partial commands in status line
" colorscheme getfresh
colorscheme vividchalk

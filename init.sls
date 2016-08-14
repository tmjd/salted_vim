vim:
  pkg.installed

vim-syntastic:
  pkg.installed

vim_config:
  file.managed:
    - name: /home/erik/.vimrc
    - user: erik
    - group: erik
    - source: salt://vim/vimrc.template
    - template: jinja

vim_dir:
  file.directory:
    - name: /home/erik/.vim/bundle/
    - dir_mode: 0755
    - file_mode: 0644
    - user: erik
    - group: erik

vundle:
  file.recurse:
    - name: /home/erik/.vim/bundle/Vundle.vim
    - source: salt://vim/vundle_vim
    - dir_mode: 0755
    - file_mode: 0644
    - user: erik
    - group: erik


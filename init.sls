
{% set username = pillar['local_user']['name'] %}

vim:
  pkg.installed

vim-syntastic:
  pkg.installed

vim_config:
  file.managed:
    - name: /home/{{username}}/.vimrc
    - user: {{username}}
    - group: {{username}}
    - source: salt://vim/vimrc.template
    - template: jinja

vim_dir:
  file.directory:
    - name: /home/{{username}}/.vim/bundle/
    - dir_mode: 0755
    - file_mode: 0644
    - user: {{username}}
    - group: {{username}}

vundle:
  file.recurse:
    - name: /home/{{username}}/.vim/bundle/Vundle.vim
    - source: salt://vim/vundle_vim
    - dir_mode: 0755
    - file_mode: 0644
    - user: {{username}}
    - group: {{username}}


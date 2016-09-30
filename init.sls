
{% set username = pillar['local_user']['name'] %}

vim:
  pkg.installed

vim-syntastic:
  pkg.installed

# Required to pull down the vim Plugins
git:
  pkg.installed

vim_dir:
  file.directory:
    - name: /home/{{username}}/.vim
    - dir_mode: 0755
    - file_mode: 0644
    - user: {{username}}
    - group: {{username}}
    - require:
      - user: user_{{username}}

vim_bundle_dir:
  file.directory:
    - name: /home/{{username}}/.vim/bundle/
    - dir_mode: 0755
    - file_mode: 0644
    - user: {{username}}
    - group: {{username}}
    - require:
      - file: vim_dir

vim_config:
  file.managed:
    - name: /home/{{username}}/.vimrc
    - user: {{username}}
    - group: {{username}}
    - source: salt://vim/vimrc.template
    - template: jinja
    - require:
      - file: vim_dir
      - user: user_{{username}}

vundle:
  file.recurse:
    - name: /home/{{username}}/.vim/bundle/Vundle.vim
    - source: salt://vim/vundle_vim
    - dir_mode: 0755
    - file_mode: 0644
    - user: {{username}}
    - group: {{username}}
    - require:
      - file: vim_bundle_dir

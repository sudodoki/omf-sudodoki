## Sudodoki

![Screenshot of prompt](http://sudodoki.github.io/sudodoki-public-assets/omf-sudodoki/Screenshot.png)

#### Prerequisites
+ [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish)
+ [zsh](http://www.zsh.org/)

#### Left prompt
User @ Machine, path, git info, dollar sign that turns red if last command failed

#### Right prompt
Ruby version - result of execution of [script to figure ruby-version](scripts/ruby-version) if corresponding ruby files detected in the folder, Node version - result of execution of [script to figure node-version](scripts/node-version) if corresponding js files detected in the folder

#### Acknowledgments
This theme is based on Scorphish theme, many thanks to their authors!

#### Installation
```
cd ~/.oh-my-fish/themes
git clone git@github.com:sudodoki/omf-sudodoki sudodoki
```
Edit `~/.config/fish/config.fish` & set
```
Theme 'sudodoki'
```
Be sure to have `scripts/ruby-version` in your $PATH (maybe, copied to `usr/bin/ruby-version)
Be sure to have `scripts/node-version` in your $PATH (maybe, copied to `usr/bin/node-version)
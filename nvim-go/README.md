# Setup
## Install neovim
```sh
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv ./nvim.appimage /usr/local/bin/nvim
```

Add aliases to .profile, if desired
```sh
alias vi="nvim"
alias vim="nvim"
```

Create config path: `~/.config/nvim/init.vim`

## Install vim-plug
```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```


## Install node and yarn
- Download latest binary from [nodejs.org](https://nodejs.org/en/download)
- Move the node bin directory to `/opt/`
- Add to Path in `.profile`
```sh
export NODEJS_HOME=/opt/<nodepath>/bin
export PATH=$NODEJS_HOME:$PATH
```
- Install yarn with `npm instal --global yarn`


## Install go
- Get go from [golang.org](https://golang.org/dl/)
- Set GOBIN (and GOHOME, if desired)
```sh
export GOBIN=$HOME/go/bin/
export PATH=$GOBIN:$PATH
```

## Configure vim-go
- Add the following to the nvim config:
```
call plug#begin('~/.vim/plugged')

" < Other Plugins, if they exist >

Plug 'fatih/vim-go'
call plug#end()
```
- Run the following commands in nvim
	-`vim +PlugInstall`
	-`vim +GoInstallBinaries`

## Configure coc.nvim
- Add coc.nvim plugin install to nvim config
```
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
```
- Add coc config to nvim config as per [this guide](https://octetz.com/docs/2019/2019-04-24-vim-as-a-go-ide/) and as specified in baseCocConfig.vim
- Run `vim +PlugInstall`
- Config coc in vim with `:CocConfig` and add:
```json
{
  "languageserver": {
    "golang": {
      "command": "$GOBIN/gopls",
      "rootPatterns": ["go.mod", ".vim/", ".git/", ".hg/"],
      "filetypes": ["go"]
    }
  }
}
```
- Optionally, run `:CocInstall coc-tsserver` 



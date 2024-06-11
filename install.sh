
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "installing dotfiles, backups under ORIGINALNAME_TIMESTAMP.DOTBAK"
timestamp=$(date +%d-%m-%y_%H:%M:%S).DOTBAK

mv $HOME/.vimrc $HOME/.vimrc_${timestamp}
ln -s $SCRIPT_DIR/.vimrc $HOME/.vimrc

mv $HOME/.vim $HOME/.vim_${timestamp}
ln -s $SCRIPT_DIR/.vim $HOME/.vim

mv $HOME/.config $HOME/.config_${timestamp}
ln -s $SCRIPT_DIR/.config $HOME/.config

mv $HOME/.zshrc $HOME/.config_${timestamp}
ln -s $SCRIPT_DIR/.zshrc $HOME/.zshrc

mv $HOME/.alias $HOME/.alias ${timestamp}
ln -s $SCRIPT_DIR/.alias $HOME/.alias

mv $HOME/.profile $HOME/.profile_${timestamp}
ln -s $SCRIPT_DIR/.profile $HOME/.profile

mv $HOME/.xinitrc $HOME/.xinitrc_${timestamp}
ln -s $SCRIPT_DIR/.xinitrc $HOME/.xinitrc

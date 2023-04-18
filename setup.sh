DOTFILES=$HOME/.dotfiles
ln -sf "$DOTFILES/.colordiffrc" "$HOME/."
ln -sf "$DOTFILES/.curlrc" "$HOME/."
ln -sf "$DOTFILES/.dir_colors" "$HOME/."
ln -sf "$DOTFILES/.gitconfig" "$HOME/."
ln -sf "$DOTFILES/.gitignore" "$HOME/."
ln -sf "$DOTFILES/.hgrc" "$HOME/."
ln -sf "$DOTFILES/.inputrc" "$HOME/."
ln -sf "$DOTFILES/.riplrc" "$HOME/."
ln -sf "$DOTFILES/.tmux.conf" "$HOME/."
ln -sf "$DOTFILES/.zshenv" "$HOME/."
ln -sf "$DOTFILES/.zshrc" "$HOME/."
ln -sf "$DOTFILES/.zsh_plugins.txt" "$HOME/."
ln -sf "$DOTFILES/.psqlrc" "$HOME/."
if [ ! -d "$HOME/.config/nvim" ]; then
  ln -sf "$DOTFILES/nvim/" "$HOME/.config/nvim"
fi

sudo apt install tmux zsh shellcheck
sudo snap install --classic nvim

if ! which rustup; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  cargo install fre
  cargo install difft
fi

if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if [ "$SHELL" != "/usr/bin/zsh" ]; then
  chsh -s /usr/bin/zsh
fi

brew install antibody
pip3 install neovim

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
ln -sf "$DOTFILES/.zsh_plugins" "$HOME/."
if [ ! -d "$HOME/.config/nvim" ]; then
  ln -sf "$DOTFILES/nvim/" "$HOME/config/nvim"
fi

sudo apt install tmux zsh shellcheck
sudo snap install --classic nvim

if [ "$(which rustup)" = "rustup not found" ]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  cargo install fre
fi

if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if [ "$SHELL" != "/usr/bin/zsh" ]; then
  chsh -s /usr/bin/zsh
fi

brew install antibody

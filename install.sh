sudo apt install ripgrep
pip install jupyter ipykernel

sudo apt update
sudo apt install zsh
sudo dnf install -y lsd
sudo dnf install -y neovim
sudo dnf install -y ranger
sudo dnf install -y ulauncher

git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rf ~/.config/nvim/.git
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/wintermi/zsh-lsd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-lsd
cp -r Hermit ~/.local/share/fonts/
./set_dots.sh

cp -r .wallpapers ~/.wallpapers 
git clone https://github.com/LGFae/swww
cd swww
sudo dnf install cargo
cargo build --release
echo 'export PATH=$PATH:$HOME/.P/swww/target/release' >> ~/.zshrc

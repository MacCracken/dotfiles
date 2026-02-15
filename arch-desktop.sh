```bash
#!/bin/bash
# hyprland-workstation-setup.sh
# Fresh Arch Linux → Secure Hyprland Workstation with Display Manager

set -euo pipefail
trap 'echo "❌ Setup failed at line $LINENO"' ERR

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

log() { echo -e "${GREEN}[$(date +'%H:%M:%S')] $1${NC}"; }
warn() { echo -e "${YELLOW}⚠️  $1${NC}"; }
error() { echo -e "${RED}❌ $1${NC}"; exit 1; }

# Validate environment
[[ -f /etc/arch-release ]] || error "This script requires Arch Linux"
[[ $EUID -eq 0 ]] && error "Don't run as root - we'll use sudo when needed"

log "🚀 Starting Hyprland Workstation Setup"
log "📍 Current user: $(whoami)"
log "📍 Home directory: $HOME"

# Update system first
log "📦 Updating system packages..."
sudo pacman -Syu --noconfirm

# Install base packages
CORE_PACKAGES=(
    # System essentials
    "base-devel" "git" "curl" "wget" "unzip" "vim"
    
    # Shell environment
    "zsh" "zsh-completions" "zsh-syntax-highlighting" "zsh-autosuggestions"
    
    # Hyprland desktop environment
    "hyprland" "waybar" "wofi" "kitty" "swww" "grim" "slurp" "wl-clipboard"
    "xdg-desktop-portal-hyprland" "polkit-kde-agent" "qt5-wayland" "qt6-wayland"
    
    # Display manager and session management
    "sddm" "qt5-graphicaleffects" "qt5-quickcontrols2" "qt5-svg"
    
    # Development tools
    "docker" "docker-compose" "nodejs" "npm" "python" "python-pip"
    
    # Network & Security
    "openssh" "ufw" "fail2ban" "networkmanager"
    
    # File management & utilities
    "dolphin" "thunar" "ranger" "tree" "htop" "neofetch"
    
    # Fonts & Media
    "ttf-dejavu" "ttf-liberation" "noto-fonts" "noto-fonts-emoji"
    "pipewire" "pipewire-pulse" "pipewire-jack" "pavucontrol"
    
    # Archive support
    "unrar" "p7zip" "zip"
)

log "📦 Installing core packages..."
sudo pacman -S --needed --noconfirm "${CORE_PACKAGES[@]}"

# Setup display manager for graphical login
log "🖥️  Configuring SDDM display manager..."

# Configure SDDM for Wayland
sudo mkdir -p /etc/sddm.conf.d/
sudo tee /etc/sddm.conf.d/10-wayland.conf << EOF
[General]
DisplayServer=wayland
GreeterEnvironment=QT_WAYLAND_SHELL_INTEGRATION=layer-shell

[Wayland]
SessionDir=/usr/share/wayland-sessions

[Theme]
Current=breeze
EOF

# Ensure Hyprland session is available
sudo mkdir -p /usr/share/wayland-sessions
sudo tee /usr/share/wayland-sessions/hyprland.desktop << EOF
[Desktop Entry]
Name=Hyprland
Comment=Hyprland compositor
Exec=Hyprland
Type=Application
EOF

# Install yay AUR helper
if ! command -v yay &> /dev/null; then
    log "🔧 Installing yay AUR helper..."
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd "$HOME"
fi

# AUR packages
AUR_PACKAGES=(
    "zen-browser-bin"
    "protonmail-bridge"
    "obsidian"
    "visual-studio-code-bin"
)

log "📦 Installing AUR packages..."
yay -S --needed --noconfirm "${AUR_PACKAGES[@]}"

# Setup ZSH as default shell
log "🐚 Configuring ZSH environment..."
if [[ $SHELL != */zsh ]]; then
    chsh -s $(which zsh)
    warn "Shell changed to ZSH - you'll need to logout/login"
fi

# Install Starship prompt
log "✨ Installing Starship prompt..."
curl -sS https://starship.rs/install.sh | sh -s -- --yes

# Create basic .zshrc with Starship
log "⚙️  Configuring ZSH with Starship..."
cat > "$HOME/.zshrc" << 'EOF'
# Enable Starship prompt
eval "$(starship init zsh)"

# ZSH options
setopt AUTO_CD
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# History settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Load syntax highlighting and autosuggestions
[[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Docker aliases
alias dps='docker ps'
alias dimg='docker images'
alias dlog='docker logs'
alias dexec='docker exec -it'

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline'
alias gd='git diff'

# System aliases
alias grep='grep --color=auto'
alias df='df -h'
alias free='free -h'
alias ps='ps aux'
EOF

# Security hardening
log "🔒 Applying security hardening..."

# UFW firewall setup
sudo ufw --force reset
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow 22/tcp  # SSH
sudo ufw allow 80/tcp  # HTTP (for development)
sudo ufw allow 443/tcp # HTTPS (for development)
sudo ufw --force enable

# SSH hardening
log "🔐 Hardening SSH configuration..."
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup
sudo tee -a /etc/ssh/sshd_config << EOF

# Security hardening
PermitRootLogin no
PasswordAuthentication yes
PubkeyAuthentication yes
MaxAuthTries 3
ClientAliveInterval 300
ClientAliveCountMax 2
X11Forwarding no
AllowTcpForwarding yes
EOF

# Fail2ban for SSH protection
sudo systemctl enable fail2ban
sudo tee /etc/fail2ban/jail.local << EOF
[DEFAULT]
bantime = 3600
findtime = 600
maxretry = 3

[sshd]
enabled = true
port = ssh
logpath = /var/log/auth.log
maxretry = 3
EOF

# Docker setup with security
log "🐳 Configuring Docker..."
sudo systemctl enable docker
sudo usermod -aG docker $USER
warn "Added to docker group - logout/login required for changes"

# Docker daemon security
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json << EOF
{
  "live-restore": true,
  "userland-proxy": false,
  "no-new-privileges": true,
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "3"
  }
}
EOF

# Clone and setup dotfiles
log "⚙️  Setting up dotfiles..."
if [[ ! -d "$HOME/dotfiles" ]]; then
    log "📥 Cloning dotfiles repository..."
    git clone https://github.com/MacCracken/dotfiles.git "$HOME/dotfiles"
else
    log "📂 Dotfiles already exist, pulling latest..."
    cd "$HOME/dotfiles"
    git pull
fi

# Let dotfiles handle their own linking
cd "$HOME/dotfiles"
if [[ -f "install.sh" ]]; then
    log "🔗 Running dotfiles install script..."
    bash install.sh
elif [[ -f "setup.sh" ]]; then
    log "🔗 Running dotfiles setup script..."
    bash setup.sh
else
    warn "No install script found in dotfiles - manual linking may be needed"
fi

# Enable essential services (INCLUDING SDDM!)
log "🔄 Enabling system services..."
sudo systemctl enable sddm          # Critical: graphical login
sudo systemctl enable sshd
sudo systemctl enable NetworkManager
sudo systemctl enable docker
sudo systemctl start NetworkManager
sudo systemctl start fail2ban

# Create common directories
log "📁 Creating common directories..."
mkdir -p "$HOME/Projects"
mkdir -p "$HOME/Scripts"
mkdir -p "$HOME/Downloads"
mkdir -p "$HOME/.config"

# Final setup completion
log "✅ Setup complete!"
echo ""
echo "🎉 Your secure Hyprland workstation is ready!"
echo ""
warn "🔑 POST-INSTALL CHECKLIST:"
echo "   1. 🔐 Restore SSH keys to ~/.ssh/ and set permissions (chmod 600)"
echo "   2. 🔑 Restore .api_keys file"
echo "   3. 🚪 Logout/login for group changes (docker, etc.)"
echo "   4. 🔧 Test SSH access before closing current session"
echo "   5. 🌟 Customize Starship config if needed (~/.config/starship.toml)"
echo "   6. 🐳 Test Docker: docker run hello-world"
echo "   7. 🌐 Configure ProtonMail Bridge if needed"
echo "   8. 🖥️  Reboot to test SDDM graphical login"
echo ""
echo "🔒 Security features enabled:"
echo "   ✓ UFW firewall active"
echo "   ✓ SSH hardened"
echo "   ✓ Fail2ban protecting SSH"
echo "   ✓ Docker security configured"
echo "   ✓ SDDM display manager enabled"
echo ""
echo "🚀 Ready to rock! No more TTY prison - you'll get a proper login screen!"

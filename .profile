# .profile: sh configuration file
# Wentao Han (wentao.han@gmail.com)

if [ -n "$BASH" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

export ANDROID_HOME="/Users/spadin/Library/Android/sdk"
export ANDROID_NDK_HOME="/opt/homebrew/share/android-ndk"

path_add() {
    PATH=:$PATH
    PATH=$1${PATH//:$1:/:}
}
path_add "$ANDROID_HOME/platform-tools"
path_add "$ANDROID_HOME/tools"
path_add "$ANDROID_HOME/cmdline-tools/latest/bin"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH

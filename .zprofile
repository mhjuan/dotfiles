if [ "$(arch)" = "arm64" ]
then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    echo "arm64"
else
    eval "$(/usr/local/bin/brew shellenv)"
    echo "x86"
fi
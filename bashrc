source ~/.aliases

# added by travis gem
[ -f /Users/craig.hills/.travis/travis.sh ] && source /Users/craig.hills/.travis/travis.sh

export PATH="$HOME/.cargo/bin:$PATH"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# allow locally installed npm binaries to be executed;
# added by `npm i -g add-local-binaries-to-path`
export PATH="$PATH:./node_modules/.bin"
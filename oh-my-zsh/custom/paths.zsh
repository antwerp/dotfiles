# Configuring `$PATH`

# Homebrew brews (such as Vim 7.4) 
export PATH="/usr/local/bin"

# MacPorts ports
export PATH="$PATH:/opt/local/bin:/opt/local/sbin"

# Added by the Heroku Toolbelt
export PATH="$PATH:/usr/local/heroku/bin"

# Enthought Python Distribution -- note different style of string interpolation
export PATH="${PATH}:/Library/Frameworks/EPD64.framework/Versions/Current/bin"
export MKL_NUM_THREADS=1

# Ruby Version Manager (RVM)
export PATH="$PATH:$HOME/.rvm/bin" 

# User packages
export PATH="$PATH:$HOME/bin"

# System packages
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin
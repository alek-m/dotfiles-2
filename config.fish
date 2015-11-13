# Path to Oh My Fish install.
set -gx OMF_PATH /Users/shaond/.local/share/omf

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG /Users/shaond/.config/omf

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

function gc
  git commit --verbose
end

function gs
  git status
end

function ga
  git add .
end

function gd
  git diff
end

function gpA
  git push --all
end

function gpl
  git pull
end

function gr
  git reset --hard HEAD
end

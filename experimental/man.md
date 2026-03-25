# chroctl source code & config guide (v1)
## config: 
as of writing this, my config looks like this: 
```bash
##################
# chroctl config #
##################
term="footclient"
editor="nvim"
mplayer="cmus"
volc=5
wallpath="$HOME/walls"
srcpath="/usr/local/bin/chroctl"
browser="firefox"

tweak_source() {
  notify-send "opening system editor in $srcpath.."
  sudoedit "$srcpath" && notify-send "success!" 
  # for confirmation reasons, this opens inside your current terminal
} # sudoedit uses your system editor 

tweak_config() {
  notify-send "opening $editor in $conf"
  "$term" -e "$editor" "$conf" &
}

open_editor() {
  notify-send "opening $editor.."
  "$term" -e "$editor" . & # this opens in your current path
} # change this if you use a gui editor

open_music() {
  notify-send "launch music player.."
  "$term" -e "$mplayer" &
}

open_note() {
  local note_dir="$HOME/notes"
  local timestamp=$(date +%Y-%m-%d_%H%M)
  local filename="${note_dir}/${timestamp}.md"

  mkdir -p "$note_dir"
  "$term" -e "$editor" "$filename"
}

custom_browser() {
   "$browser" --fork --new-tab https://www.youtube.com --new-tab https://github.com
}
```
which can seem like a lot, but its dead easy. ill walk u through. 
## VARIABLES: 
```bash
term="footclient"
editor="nvim"
mplayer="cmus"
volc=5
wallpath="$HOME/walls"
srcpath="/usr/local/bin/chroctl"
browser="firefox"
```
so basically, these are used in the functions & source, they define what to use for what.
"$term" -e "$editor" "$srcpath" would literally just translate to: footclient -e nvim /usr/local/bin/chroctl 
be careful when editing these tho it can like sometimes not work because of specific flags but it should be okay.
## FUNCTIONS: 
this is just bash.
```bash
tweak_source() { # this just opens sudoedit ( uses your sys editor ) inside your binary path defined $srcpath. very simple. 
  notify-send "opening system editor in $srcpath.."
  sudoedit "$srcpath" && notify-send "success!" 
  # for confirmation reasons, this opens inside your current terminal
} # sudoedit uses your system editor 

tweak_config() { # same thing, but config and opens a terminal w/o sudoedit using your editor, because you dont need sudo 
  notify-send "opening $editor in $conf"
  "$term" -e "$editor" "$conf" &
}

open_editor() { # opens your editor, with your terminal. if you use vs code or any gui editor, change this.
  notify-send "opening $editor.."
  "$term" -e "$editor" . & # this opens in your current path
} # change this if you use a gui editor

open_music() { # also simple, launches your music player.
  notify-send "launch music player.."
  "$term" -e "$mplayer" &
}

open_note() { # a little more complex, more variables defined that are instead local because you dont need them anywhere else.
  local note_dir="$HOME/notes" # dir 
  local timestamp=$(date +%Y-%m-%d_%H%M) # timestamp 
  local filename="${note_dir}/${timestamp}.md" # filename is the dir/timestamp.md 

  mkdir -p "$note_dir" # makes a dir just in case its not there 
  "$term" -e "$editor" "$filename"
}

custom_browser() { # also very simple, the syntax should remain the same across browsers.
   "$browser" --fork --new-tab https://www.youtube.com --new-tab https://github.com
}
```
# SOURCE 
## W.I.P 




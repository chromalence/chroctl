# chroctl 
## CURRENT RECOMMENDED VERSION: STABLE 1.3
why stable 1.3?? 
well, stable 1.3 still has the new modules feature, but it has been tested more rigorously.
experimental is SICK but use with caution because its loads of new features that are not as well tested.
use at ur own risk but if you all about that experimental rolling release, go for it it is awesome dawg.
it has cool uis and extra features that are pretty dang useful. also the install script is more integrated which is nice.
## short overview
a monolithic cli generalist tool made by a dev that cares ( i think? )
## nct
a tiny C workflow tool (init, run, check, etc.) rarely updated, plugin modular thingy
# dependencies 
( you might not need all of them as some are only for experimental builds )
libnotify
cmus 
foot 
nvim
swww
firefox
fzf
# stable 1.3 install 
```bash
git clone https://github.com/chromalence/chroctl && 
cd chroctl/stable/1.3/ &&
chmod +x install.sh install_nct.sh &&
./install_nct.sh
./install.sh 
```
# experimental install ( use at your own risk )
```bash
git clone https://github.com/chromalence/chroctl &&
cd chroctl/experimental &&
chmod +x install.sh &&
./install.sh 
```
## QUICK DISCLAIMER
ok so you might have installed everything and done your ui-nav-setup, but you check your .config/hyprqconf or .config/chroctl, and see some HIDDEN files like .status or .nav.db, which i PROMISE YOU.. are NOT tracking you. go cat them for yourselves, ill explain what both are.
### .STATUS INSIDE .CONFIG/HYPRQCONF
so what this file holds, is what blur+opacity+corner preset you are using. literally just it. so it can be A: std B: heavy C: light or D: opaque
and if you dont use hyprqconf, you likely will not have it.
### .NAV.DB INSIDE .CONFIG/CHROCTL
all this holds, are the paths to your chroctl stuff. it should contain something like this:
/usr/local/bin/chroctl
/usr/local/lib/chroctl/modules
/home/youruser/chroctl

and you CAN edit these, because in order for ui-nav to work, it has to SEE where to look, and to show you.
hope this clears the water!!

## CONTRIBUTING
so, you want to contribute to chroctl, huh?! well idk how it works i think you fork my project and submit a pull request,
i review it and see if its good, and maybe accept it. if you do, here are my criteria:

1. if you dont need to, dont directly implement what you put inside the source. what i mean by that?
   basically, if you want to add a new cool command into chroctl, you dont need to implement it inside
   of the source code directly, you can just add it into modules/ and in the source code, add a 'hook' or
   whatever its called for it, such as:
   your_awesome_command)
     chroctl mod your_awesome_module
     ;;
  instead of directly hard-coding it.
2. add it to chroctl help!!! pls bro this is 100% required.
3. dont add COMPLETELY useless features, only i can do that. for example, chroctl run foot ( well, exec does exist, but atleast it sends notifications!! ) is USELESS. you can just go for example: foot. tjat easy.

# have a PHANTASTIC day, friend. u are cool & awesome <3



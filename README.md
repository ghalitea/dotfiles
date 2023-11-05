# dotfiles
These are the config files required to setup a PC in my usual SetUp.\
Note that my current SetUp is using Fedora with Xfce as a desktop manager.

## About dotdrop
To track my config files i am using dotdrop. 

The most important commands in dotdrop are:\
`dotdrop -cfg ~/dotfiles/config.yaml -p >>profile name<< install`\
`dotdrop -p >>profile name<< import >>filepath<<`

If you wanna change or look up something about the current dotrop setup, open the config.yaml file in the dotdrop folder.

You can find some more information about dotdrop 
[here](https://dotdrop.readthedocs.io/en/latest/usage/)

## How to set up a PC using these dotfiles
### Installations
At first, all of the required software has to be installed.\
\
I suggest starting with RPM Fusion, since some of the other software, mainly Telegram, relies on it.\
The command to do so goes as following:\
`sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm`\
\
After that, the basic software like a window manager is required.\
This is all the basic software used in this SetUp:
- i3
- polybar
- kitty
- rofi
- sddm
- flatpak
- git
- pip
- xrandr
- xinput
- picom
- xautolock
- jetbrains-mono-fonts
- qt5-qtquickcontrols2
- qt5-qtquickcontrols
- qt5-qtgraphicaleffects
- dotdrop\

All of these can be installed using the following commands:\
`sudo dnf install i3 polybar kitty rofi sddm flatpak git pip xrandr xinput picom xautolock jetbrains-mono-fonts qt5-qtquickcontrols2 qt5-qtquickcontrols qt5-qtgraphicaleffects`\
`flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo`\
`pip install dotdrop`

Some software you also might wanna have in the beginning is the following:
- neovim
- brave-browser
- telegram

To install, use the following commands:\
`sudo dnf install neovim telegram-desktop`\
`sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo`\
`sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc`\
`sudo dnf install brave-browser`\

A full list of usefull software is on the bottom of this file


### Config Files
Now onto getting all the config files using git dotdrop.

Initially this repo needs to be cloned. Since this is a private repoitory, and the git login via https doesnt work anymore, to clone the repository, ssh has to be used.

To do that, generate a ssh key, using the following command:\
`ssh-keygen -t ed25519`\
The following text block should, amongst other things, spit out the location of the public key.\
With that information, execute this:\
`cat >>location of the public key<<`

I assume you've already got a browser with githup open.\
Click on your 'Profile' > 'Settings' > 'SSH and GPG Keys' and then select 'New SSH Key'.\
Give your SSH Key a name, preferably the same Name as the PC your generated it on, and copy all that cat has just printed out in the terminal into the secion below.\
Select a password and save your changes.

Having set up the access via SSH, the git repo can be cloned now.\
To do this, go in the ´Documents´ folder and use this command:\
`clone git@github.com:ghalitea/dotfiles.git`

The files are on the local drive now, they just need to be distributed to the right locations.\
Thsi is done using dotdrop:\
`dotdrop -cfg ~/dotfiles/config.yaml -p >>profile name<< install`

It might also be usefull to give the just installed scriplets some rights.\
`chmod +x ~/.config/rofi/bin/launcher_colorful`\
`chmod +x ~/.config/i3/scripts/lock.sh`\
`chmod +x ~/.config/i3/scripts/startAutoLocker`

Press 'Mod Shift R' to reload the i3 config.

### I3
You might be at a point, where you´d wanna restart to get i3 to work. But to that, the Xfce window manager needs to be disabled first.

Go to the 'Settings Manager' > 'Session and Startup' > 'Current Session'\
Here you wanna set the restart style of some applications to 'Never'\
These Applications are 'Xfce Window Manager', 'Xfce Panel' and a third one i can´t remember right now, but there should only be the Xfce Settings Daemon, Thunar and the Power Manager left.\
If you've done that, save the session.\
Then, switch the Tab to Application Autostart. Here you need to add a new program to autostart. The Name should be i3, and the command is also i3.

Now the PC can be restarted. To do so, kill all the programms currently still running. Press 'Mod Shift E' to shut the Laptop down, and uncheck the option saying 'save current session'. Press restart.

When the PC restarts, and you log in again, i3 should be running.

It might be usefull, to try to use all the different programs, and fix some bugs popping up by changing things in the config, such as the name of the monitors or the background pickture location.\
Another possible problem might be missing or not executable scripts. Scripts can be made executable by using `chmod +x >>script location<<`.

### sddm
sddm is the login screen i am using.

Since the files for sddm are saved in a root directory it is kinda hard to add them using dotdrop. The solution i've used so far is simply copying them from a PC with the setup currently intact and pasting them to the right location in the PC being set up.\
I've been using the sugar dark theme. The file diretory, where the sugar dark theme folder needs to be pasted, is /usr/share/sddm/themes/.\
Also, in /etc/sddm.config.yaml the theme needs to be changed to sugar dark. 

Finally, sddm needs to actually be enabled. To do so, execute the following commands:\
`sudo systemctl disable lightdm`\
`sudo systemctl enable sddm`

For this to actually take effect, the PC needs to be restarted.

### final things
Last but not least, here are a few things i usually also change:

- Switch the Theme in the Xfce appearance settings to Adwaita Dark
- Change Fonts everywhere to JetBrains Mono Regular size 12 or 11
- Set every possible application into dark mode
- Swich on the tap on touch in the touchpad settings

## List of Applications
Here is a full list of all the applications installed on one or multiple of my setups
### primary functions
| Aplication              | Usage |
| -----------             | ----------- |
| i3                      | window manager |
| polybar                 | bar |
| kitty                   | terminal |
| rofi                    | application launcher |
| sddm                    | login screen |
| flatpak                 | package manager for closed source applications |
| git                     | code management system |
| pip                     | python package manager |
| xrandr                  | window configuration software |
| xinput                  | input device managment software |
| picom                   | compositor for xorg |
| xautolock               | lockscreen |
| jetbrains-mono-fonts    | font |
| qt5-qtquickcontrols2    | a set of controls, needed in programms using qtquick |
| qt5-qtquickcontrols     | a set of controls, needed in programms using qtquick |
| qt5-qtgraphicaleffects  | additional graphical effects, needed in programms using qtqucik |
| dotdrop                 | configuration files management software |
### secondary functions
| Aplication              | Usage |
| -----------             | ----------- |
| feh                     | image edditing software |
| brave browser           | the browser i usually use |
| telegram-desktop        | messaging software |
| neovim                  | text editing software |
| thefuck                 | software to help with bash errors |
### mentioned in config
| Aplication              | Usage |
| -----------             | ----------- |
| Minecraft               | videogame |
| krita                   | drawing software |
| Xournalpp               | software used for taking notes |`flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo`\
| Signal                  | messaging software |
| Discord                 | voice chat |
| Spotify                 | music player |
### etc
| Aplication              | Usage |
| -----------             | ----------- |
| VS code                 | IDE |

## TlDr
`sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm`\
`flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo`\
`sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo`\
`sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc`\
`sudo dnf install i3 polybar kitty rofi sddm flatpak git pip xrandr xinput picom xautolock jetbrains-mono-fonts qt5-qtquickcontrols2 qt5-qtquickcontrols qt5-qtgraphicaleffects neovim telegram-desktop brave-browser`\
`pip install dotdrop`

`ssh-keygen -t ed25519`\
`cat >>location of the public key<<`\
Copy the public key into a new key in your git profile.\
`clone git@github.com:ghalitea/dotfiles.git`\
`dotdrop -cfg ~/dotfiles/config.yaml -p >>profile name<< install`\
`chmod +x ~/.config/rofi/bin/launcher_colorful`\
`chmod +x ~/.config/i3/scripts/lock.sh`\
`chmod +x ~/.config/i3/scripts/startAutoLocker`\
Kick the Xfce Applications out of the session and put i3 in the autostart\
Restart the PC without saving the session

Paste the sugar-dark theme into the sddm theme folder\
`sudo systemctl disable lightdm`\
`sudo systemctl enable sddm`\
Restart the PC

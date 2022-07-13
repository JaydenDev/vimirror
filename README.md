# vimirror
Simple 'visudo' like utility to change mirrors and test them.
# installation
On Arch-Based distros to install without the AUR:
```bash
curl https://dl.jaydendev.repl.co/vimirror-1.0.0.tar.gz
tar -xf vimirror-1.0.0.tar.gz
cd vimirror-1.0.0
sudo make install
```
On Arch/Arch-Based distros to install with the AUR:
```bash
# if you use yay
yay -S vimirror
# if you use yaourt
yaourt -S vimirror
# manually
git clone https://aur.archlinux.org/vimirror.git
cd vimirror
makepkg -si
```
# contributing
To contribute, you'll obviously need the sources. Make sure your on an Arch-Based distro, as the utility won't work otherwise. \
To get the code, fork the repo then run:
```bash
git clone https://github.com/YourUsername/vimirror
cd vimirror
```
Then to start working on new features run the following:
```bash
git switch -c new-branch-name
```
Then after your finished run:
```bash
git add -A
git commit -m "commit msg"
git push
```
Then go into GitHub, make a PR, then wait for me to review it! The reason I ask that you make a new branch, is because it allows me to test the PR easier.

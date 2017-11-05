#!/bin/bash
############################
# .dot.sh
############################


dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc bash_local bash_profile bash_prompt exports aliases functions vimrc vim bin tmux.conf tmux icons colors fluxbox gimp-2.8 wallpapers Xresources urxvt xinitrc conky gitconfig"

# crear el directorio dotfiles_old en home
echo "Creando el directorio $olddir para la copia de seguridad de los archivos de configuracion en ~"
mkdir -p $olddir
echo "...listo"
echo "   "

# cambiando el directorio
echo "cambiando al directorio $dir"
cd $dir
echo "...Listo"
echo "   "

# moviendo los archivos a home y guardando una copia en dotfiles_old 
for file in $files; do
    echo "Moviendo todos los archivos de configuracion de ~ a $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creand symlink a $file en el directorio raiz."
    ln -s $dir/$file ~/.$file
done

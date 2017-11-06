#!/bin/bash
############################
# .dot.sh
############################


dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc bash_local bash_profile bash_prompt exports aliases functions vimrc tmux.conf Xresources xinitrc gitconfig"
directories="vim bin tmux colors fluxbox wallpapers gimp-2.8 urxvt conky"

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
echo "copiando los directorios"
for directory in $directories; do
    mv ~/.$directory ~/dotfiles_old/
    rm -rf ~/.$directory
    ln -s $dir/$directory ~/.$directory
done

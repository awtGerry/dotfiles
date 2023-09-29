# DWM
Para poder usar dwm se tiene que instalar con `sudo make install` (se debe
realizar este paso cada que se haga un cambio).

# Requisitos
- Xlib header files
- git

# Como iniciar con sddm
Crear archivo `/usr/share/xsessions/dwm.desktop` dentro de el agregar las siguientes lineas:
```sh
[Desktop Entry]
Name=DWM
Comment=Minimalist dynamic window manager for the X Window System developed by Suckless
TryExec=dwm
Exec=dwm
Type=Application
```
Ya sea reiniciando sddm o el ordenador la opcion para entrar con DWM deberia estar lista.

# Iniciar programas en inicio
Tengo una manera un poco rara para realizar esto, asi que prefiero simplicarlo diciendo
que crees un archivo llamado `dwm.sh` (en donde sea) y dentro del `dwm.desktop` llamar
el path de ese archivo en `TryExec` y `Exec`, dentro de dwm.sh puedes poner los programas
o comandos que quieres realizar antes de iniciar dwm, por ejemplo:
```sh
#!/bin/sh
# Inicializar programas
setxkbmap es & # Teclado en espanol
picom & # compositor
dunst & # notificaciones
pipewire & # audio

exec dwm
```

# Patches
- [sticky](https://dwm.suckless.org/patches/sticky): Cliente visible en todas las 'tags'.
- [restratsig](https://dwm.suckless.org/patches/restartsig/): Permite a dwm reinciarse sin necesidad de salir.
- [colorbar](https://dwm.suckless.org/patches/colorbar/): Agregar un color diferente (fg & bg) por cada elemento
    en la barra de estado.
- [vanitygaps](https://dwm.suckless.org/patches/vanitygaps/): Gaps!.
- [stacker](https://dwm.suckless.org/patches/stacker/): Mejor utilidad usando multiples stacks.
- [systray](https://dwm.suckless.org/patches/systray/): Muestra iconos de programas.
- [hide_vacant_tags](https://dwm.suckless.org/patches/hide_vacant_tags/): Esconde las 'tags' que no estan en uso.
- [swallow](https://dwm.suckless.org/patches/swallow/): Para cuando se corren programas desde la terminal.

Recomiendo [dwmc](https://dwm.suckless.org/patches/dwmc/): Si se va a jugar mucho con la configuracion.

# Keymaps
Trabajare en un mini programa para ver todas las keymaps desde un shortcut pronto :).

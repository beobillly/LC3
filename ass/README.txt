les fichiers finaux sont affichage.asm, strcpy_2.asm, strncpy_2.asm et strtrn.asm

compilation en 32 bits(PRIORITE)     

nasm -f elf affichage.asm ; ld -m elf_i386 -s affichage.o -o affichage

si 64 bits supportée (ce qui n'est pas le cas de l'affichage):

nasm -f elf64 affichage.asm ; ld -s affichage.o -o affichage

execution : ./affichage
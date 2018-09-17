LOADERADR		equ $60000
APP_ADDR		equ $70000
APP_SIZE		equ 20416
APP_FIRSTSECTOR	equ 2					; bootloader takes 2 sectors. so 2 is a good start
;APP_SECTORS		equ (APP_SIZE/512)+1
APP_SECTORS		equ 1

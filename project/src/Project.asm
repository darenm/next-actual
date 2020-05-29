;;
;; Sample code
;;

        ; Allow the Next paging and instructions
        DEVICE ZXSPECTRUMNEXT

        ; Generate a map file for use with Cspect
        CSPECTMAP "project.map"

        org  $8000

TVFLAG: equ $5C3C

Start:
        ;break   ; this will cause cspect to open the debugger on the launch
        xor a
        ld (TVFLAG), a
        call SPrint
        defm 'Environment is working!'
        defb 0
        jr      $ ; infinite loop
SPrint:
        pop hl
        ld a,(hl)
        inc hl
        push hl
        and a
        ret z
        rst $10
        jr SPrint

;;
;; Set up the Nex output
;;

        ; This sets the name of the project, the start address, 
        ; and the initial stack pointer.
        SAVENEX OPEN "project.nex", Start, $ff40

        ; This asserts the minimum core version.  Set it to the core version 
        ; you are developing on.
        SAVENEX CORE 2,0,0

        ; This sets the border colour while loading (in this case white),
        ; what to do with the file handle of the nex file when starting (0 = 
        ; close file handle as we're not going to access the project.nex 
        ; file after starting.  See sjasmplus documentation), whether
        ; we preserve the next registers (0 = no, we set to default), and 
        ; whether we require the full 2MB expansion (0 = no we don't).
        SAVENEX CFG 7,0,0,0

        ; Generate the Nex file automatically based on which pages you use.
        SAVENEX AUTO

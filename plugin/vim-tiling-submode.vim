
" Tiling submode
fun! TilingSubmode()
    while 1
        " ask for a single char
        redraw
        let s = getchar()
        let s = nr2char(s)

        " characters to quit
        if "\<space>\<cr>q" =~ s
            return

        " commands that are mapped to themselves
        elseif "whjklHJKLorRc=+-<>_|svT" =~ s
            exec "normal! " . s

        " splitting with empty buffers
        elseif s == "S"
            new
        elseif s == "V"
            vert new

        " tabs gestion
        elseif s == "t"
            tabnew
        elseif s == "\<right>"
            normal! gt
        elseif s == "\<left>"
            normal! gT

        " zooming windows
        elseif s == "z"
            " zoomwin plugin
            if exists(':ZoomToggle')
                ZoomToggle
            endif
        elseif s == "m"
            " maximize current window
            normal! |_

        " files and buffers
        elseif s == "f"
            " ranger
            if exists(':RangerCurrentFile')
                normal " f"
            endif
        elseif s == "b"
            Buffers
            return
        " display buffer info in a popup
        elseif s == "i"
            redir =>output
            silent ls
            redir END
            call popup_notification(split(output, '\n'), #{padding: [0, 10, 0, 1]})
        elseif s == "B"
            let buffnum = input("select buffer >")
            exec "b " . buffnum
        elseif s == "n"
            bn
        elseif s == "p"
            bp

        " start a terminal on current window
        elseif s == "!"
            term ++curwin
        else
            echo "key [" . s . "] not mapped"
        endif

    endwhile
endfun

command! TilingSubmode call TilingSubmode()



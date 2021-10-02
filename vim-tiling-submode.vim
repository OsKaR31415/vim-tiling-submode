
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

        elseif "whjklHJKLorRc=+-<>_|sv" =~ s
            " commands that are mapped to themselves
            exec "normal! " . s

        " splitting with empty buffers
        elseif s == "S"
            new
        elseif s == "V"
            vert new

        " tabs gestion
        elseif s == "t"
            tabnew
        elseif s == "T"
            normal! T

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
        elseif s == "i"
            " buffer Info
            redir =>output
            silent ls
            redir END
            call popup_notification(split(output, '\n'), #{padding: [0, 10, 0, 1]})
        elseif s == "B"
            let buffnum = input("select buffer >")
            exec "b " . buffnum
        elseif s == "n"
            next
        elseif s == "p"
            previous
        elseif s == "!"
            term ++curwin
        else
            echo "key [" . s . "] not mapped"
        endif
    endwhile
endfun

command! TilingSubmode call TilingSubmode()



" Tiling submode
fun! TilingSubmode()
    while 1
        redraw
        let s = getchar()
        let s = nr2char(s)

        if "\<space>\<cr>q" =~ s
            return
        elseif "whjklHJKLorRc=+-<>_|sv" =~ s
            exec "normal! " . s
        elseif s == "S"
            new
        elseif s == "V"
            vert new

        elseif s == "z"
            if exists(':ZommToggle')
                ZoomToggle
            endif
        elseif s == "m"
            " maximize current window
            normal! |_
        elseif s == "f"
            " ranger
            normal " f"
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

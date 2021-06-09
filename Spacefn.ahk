;SpaceFn
#inputlevel,2
Space::
    StartTime := A_TickCount

    Send {Blind}{Space DownR}

    while GetKeyState("Space","p")
    if ((A_TickCount - StartTime) > 250)
    {
        ; TODO: Dont send backspace if not in a text field
        Send {Blind}{backspace DownR}
        Send {F24 Down}
        keywait, space
        Send {F24 Up}
        return
    }
    Return

#inputlevel,1
F24 & k::Up
F24 & j::Down
F24 & h::Left
F24 & l::Right
F24 & u::Home
F24 & o::End
F24 & n::PgUp
F24 & m::PgDn
 
F24 & 1::F1
F24 & 2::F2
F24 & 3::F3
F24 & 4::F4
F24 & 5::F5
F24 & 6::F6
F24 & 7::F7
F24 & 8::F8
F24 & 9::F9
F24 & 0::F10
F24 & -::F11
F24 & =::F12

F24 & Enter::^Enter
 return

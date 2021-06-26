;SpaceFn


mouseMode := 0
keepHolding := false


isEditable() {
    clipsave := ClipboardAll

    clipboard =
    sendinput |
    sendinput +{left}
    sendinput ^x
    ClipWait, 1

    Clipvar := Clipboard
    Clipboard := clipsave

    If (Clipvar = "|" )
        Editable := 1
    Else
        Editable := 0

    return Editable
}


isInTerminal()
{
    ; Check if Mintty terminal is focus
    WinGetClass, vCtlClassNN, A
    if (vCtlClassNN = "mintty")
        return 1
}


sendWithCtrl(key){
    if (GetKeyState("capslock", "P"))
        send ^{%key%}
    else
        send {%key%}
    return
}


visualSelectMode()
{
    while GetKeyState("Space","p")
        send {shift down}
    send {shift up}{right}
}


toggleVar(var)
{
    if (var) 
        return 0
    else
        return 1
}


#inputlevel,2
Space::
    StartTime := A_TickCount

    Sendinput {Blind}{Space DownR}

    while GetKeyState("Space","p")
    if ((A_TickCount - StartTime) > 200)
    {
        if (isInTerminal())
            Sendinput {Blind}{backspace DownR}
        else if (isEditable())
            Sendinput {Blind}{backspace DownR}

        Send {F24 Down}
        keywait, space
        if !(keepHolding)
            Send {F24 Up}
        return
    }
    return


#inputlevel,1
#if mouseMode = 0
F24 & h::sendWithCtrl("Left")
F24 & l::sendWithCtrl("Right")
F24 & k::Up
F24 & j::Down
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
F24 & v::visualSelectMode()
F24 & g::
    mouseMode := toggleVar(mouseMode)
    #include noMouse.ahk

F24 & Enter::^Enter
 return

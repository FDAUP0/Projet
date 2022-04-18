%{Browse {AtomToString 'a'}}
%{Browse {AtomToString 'abc'}}
%{Browse {AtomToString '2'}}
%{Browse {AtomToString 'a2'}}















local X Y in 
    X = state(1:a 2:b 3:c)
    {Browse {Label X}}
    Y = state(name:'name' sharp:true duration:1)
    {Browse {Label Y}}
    %Z = 2
    %{Browse {Label Z}}
end

local T in
    T = a#2
    {Browse {Label T}}
end

local Atom Record Tuple Tuple2 in
    Atom = a
    case Atom
    of Atom then 
        {Browse 'ok sur 20'}
    end
    Tuple = state(1 a 2)
    {Browse{IsRecord Atom}}

    Tuple2 = a#2
    {Browse{Label Tuple2}}
    Record = state(a:1 2:a b:2)


    if ({Label Tuple} == "#") then 
        {Browse 'record considéré comme tuple'}
    else
        {Browse 'tout va bien'}
    end
end

local Atom Record Tuple TupleWrongInit R_note in
    Atom = a
    Tuple = a#2
    TupleWrongInit = state(1 a 2)
    R_note = note(name:'a' octave:3)
    {Browse{Oz_isRecord Atom}}
    {Browse{Oz_isRecord Tuple}}
    {Browse{Oz_isRecord TupleWrongInit}}
    {Browse{Oz_isRecord R_note}}
end



local Stretch in
    Stretch  = stretch(factor:0.5 [b c5])
    {Browse Stretch.factor}
    {Browse Stretch.1}
end

{Label "sdf"}



⟨note⟩ ::=
    silence             %*OK
    | ⟨name⟩            %*OK
    | ⟨name⟩⟨octave⟩    %*OK
    | ⟨name⟩#⟨octave⟩   %*OK


⟨extended note⟩ : := 
    silence(duration:⟨duration⟩) %*OK
    | note(             %*OK
        name:⟨name⟩
        octave:⟨octave⟩ 
        sharp:⟨boolean⟩ 
        duration:⟨duration⟩ 
        instrument:⟨atom⟩)




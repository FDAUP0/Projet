local
   % See project statement for API details.
   % !!! Please remove CWD identifier when submitting your project !!!
   CWD = '/Users/aymericpeten/Library/CloudStorage/OneDrive-UCL/Cours/INFO1123/Projet/project_template/' % Put here the **absolute** path to the project files
   [Project] = {Link [CWD#'Project2022.ozf']}
   Time = {Link ['x-oz://boot/Time']}.1.getReferenceTime

   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   % Translate a note to the extended notation.
   fun {NoteToExtended Note}
      case Note
      of Name#Octave then
         note(name:Name octave:Octave sharp:true duration:1.0 instrument:none)
      [] Atom then
         case {AtomToString Atom}
         of [_] then
            note(name:Atom octave:4 sharp:false duration:1.0 instrument:none)
         [] [N O] then
            note(name:{StringToAtom [N]}
                 octave:{StringToInt [O]}
                 sharp:false
                 duration:1.0
                 instrument: none)
         end
      end
   end

   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   fun {PartitionToTimedList Partition}
      Flatpartition := {NewCell nil}

      for PartitionItem in Partition : 
         case PartitionItem 
         of nil then Flatpartition 
         %TODO identify what type of partitionItem
         
         %TODO if note -> extNote 
         [] H|T then  %* List? -> Cord || ExtCord 
            if isrecord(H)
            do 
               Flatpartition :=  (H|T) |@Flatpartition
            else
               Flatpartition :=  {Chord_to_extChord H|T} |@Flatpartition
            end         

            % traitement de la liste
         

         [] ({IsRecord FalseAtom} \= 0) then %TODO  traiter les records : 
            case {Label PartitionItem}
            of silence then 
               Flatpartition := PartitionItem| @Flatpartition
            [] '#' then  %*Tuples-> (Note: ⟨name⟩#⟨octave⟩)
               Flatpartition := {NoteToExtended PartitionItem}| @Flatpartition
            [] note then 
               Flatpartition := PartitionItem| @Flatpartition
            []duration then
               Flatpartition := {Tduration duration.seconds.factor duration.seconds.1}| @Flatpartition
            [] stretch then 
               Flatpartition := {Tstretch duration.seconds.factor duration.seconds.1}| @Flatpartition
            [] drone then
               ...
            [] transpose then
               ... 
            else then 
               {Browse "case not taken ni consideration"}
            
            
            



            end
         [] Atom then 
            %*  traiter les atomes :
            Flatpartition := {NoteToExtended PartitionItem}| @Flatpartition
         end
      end
   end
   
   fun{Tduration Factor Partition}
      local Flatpartition in 
         Flatpartition = {PartitionToTimedList Partition}
         for Extended in Flatpartition :
            case Extended
            of H|T then
               for ExtNote in Extended :
                  EXtNote.duration = 
               



      

      EN
   end

   fun{Tstretch Factor Partition}

      

      EN
   end

   fun{Chord_to_extChord L}
   local EL in
      for C in L do
         EL = EL | {NoteToExtended C}
      end
      EL
   end
   



   
   %added test
   {Browse note(name:'do' octave:4 sharp:true duration:1.0 instrument:none).name}
   {Browse 2#"D"}

   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   fun {Mix P2T Music}
      % TODO
      {Project.readFile CWD#'wave/animals/cow.wav'}
   end

   fun {Merge }

   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   Music = {Project.load CWD#'joy.dj.oz'}
   Start

   % Uncomment next line to insert your tests.
   % \insert '/full/absolute/path/to/your/tests.oz'
   % !!! Remove this before submitting.
in
   Start = {Time}

   % Uncomment next line to run your tests.
   % {Test Mix PartitionToTimedList}

   % Add variables to this list to avoid "local variable used only once"
   % warnings.
   {ForAll [NoteToExtended Music] Wait}
   
   % Calls your code, prints the result and outputs the result to `out.wav`.
   % You don't need to modify this.
   {Browse {Project.run Mix PartitionToTimedList Music 'out.wav'}}
   
   % Shows the total time to run your code.
   {Browse {IntToFloat {Time}-Start} / 1000.0}
end

with Ada.Text_IO; use Ada.Text_IO;


package body three is

   procedure Easy is
      F         : File_Type;
      File_Name : constant String := "C:\Code\advent-of-code-2021\one\input\three.txt";
   begin
      declare
         type Bit is range 0..1;

         type Index is range 0..11;
         type Counts is array (Index) of Integer;
         type Rate is array (Index) of Bit;
         
         package Bit_Text_IO is new Ada.Text_IO.Integer_IO (Bit);
         
         Value : Bit;
         Zeroes : Counts;
         Ones : Counts;
         
         Gamma : Rate;
         Epsilon : Rate;
         
         GammaValue: Integer;
         EpsilonValue: Integer;
         
         LoopCounter: Integer;
      begin
         Value := 0;
         Zeroes := (0,0,0,0,
                    0,0,0,0,
                    0,0,0,0);
         Ones := (0,0,0,0,
                  0,0,0,0,
                  0,0,0,0);
      
         Open (F, In_File, File_Name);
         while not End_Of_File (F) loop

            for I in Index loop
               Bit_Text_IO.Get (F, Value);

               case Value is
               when 0 =>
                  Zeroes (I) := Zeroes (I) + 1;
               when 1 =>
                  Ones (I) := Ones (I) + 1;
               end case;

               exit when End_Of_File(F);
            end loop;

         end loop;
         Close (F);
         
         Gamma := (0,0,0,0,
                   0,0,0,0,
                   0,0,0,0);
         Epsilon := (0,0,0,0,
                     0,0,0,0,
                     0,0,0,0);
         
         for I in Index loop
            if Zeroes (I) > Ones (I) then
               Gamma (I) := 0;
               Epsilon (I) := 1;
            else
               Gamma (I) := 1;
               Epsilon (I) := 0;
            end if;
         end loop;         
         
         GammaValue := 0;
         EpsilonValue := 0;
         LoopCounter := 0;
         for I in reverse Index loop
            GammaValue := GammaValue + Integer(Gamma (I)) + (2*LoopCounter);
            EpsilonValue := EpsilonValue + Integer(Epsilon (I)) + (2*LoopCounter);
            LoopCounter := LoopCounter + 1;
         end loop;
         
         Ada.Text_IO.Put_Line (Integer'Image (LoopCounter));
         Ada.Text_IO.Put_Line (Integer'Image (LoopCounter));

      end;
   end Easy;

end three;

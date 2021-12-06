with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body one is

   procedure Easy is
      F         : File_Type;
      File_Name : constant String := "input\one.txt";
   begin
      declare
         Value : Integer;
         Last: Integer;
         Counter: Integer;
         First: Boolean;
      begin
         Last := 0;
         Counter := 0;
         First := True;

         Open (F, In_File, File_Name);
         while not End_Of_File (F) loop
            Get (F, Value);

            if First /= True then
               if Value > Last then
                  Counter := Counter + 1;
               end if;
            else
               First := False;
            end if;
            Last := Value;
         end loop;
         Close (F);

         Ada.Text_IO.Put_Line (Integer'Image (Counter));
      end;
   end Easy;

   procedure Hard is
      F         : File_Type;
      File_Name : constant String := "input\one.txt";
   begin
      declare
         type Measurement is array(0..2) of Integer;
         LastMeasurement: Measurement;
         ThisMeasurement: Measurement;
         Counter: Integer;

         function Sum(arr: Measurement) return Integer
         is
         begin
            return arr (0) + arr (1) + arr (2);
         end Sum;
      begin
         ThisMeasurement := (0,0,0);
         Counter := 0;
         Open (F, In_File, File_Name);

         Get(F, ThisMeasurement (0));
         Get(F, ThisMeasurement (1));
         Get(F, ThisMeasurement (2));


         while not End_Of_File (F) loop
            LastMeasurement := ThisMeasurement;
            ThisMeasurement := (LastMeasurement (1), LastMeasurement (2), 0);

            Get (F, ThisMeasurement (2));

            if Sum (ThisMeasurement) > Sum (LastMeasurement) then
               Counter := Counter + 1;
            end if;
         end loop;
         Close (F);
         Ada.Text_IO.Put_Line (Integer'Image (Counter));
      end;



   end Hard;
end one;

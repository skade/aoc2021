with Ada.Text_IO; use Ada.Text_IO;

package body two is

   procedure Easy is
      F : File_Type;
      File_Name : constant String := "input\two.txt";

      type Commands is (forward, up, down);
      
      package Command_Text_IO is new Ada.Text_IO.Enumeration_IO (Commands);
      package Value_Text_IO is new Ada.Text_IO.Integer_IO (Integer);
      
      Command: Commands;
      Value: Integer;
      
      Depth: Integer;
      Horizontal: Integer;
   begin
      Depth := 0;
      Horizontal := 0;
      
      Open (F, In_File, File_Name);
      while not End_Of_File (F) loop
         Command_Text_IO.Get (F, Command);
         Value_Text_IO.Get (F, Value);

         case Command is
            when forward =>
               Horizontal := Horizontal + Value;
            when down =>
               Depth := Depth + Value;
            when up =>
               Depth := Depth - Value;
         end case;
      end loop;
      Close (F);

      Ada.Text_IO.Put_Line (Integer'Image (Depth * Horizontal));
   end Easy;
   
   procedure Hard is
      F : File_Type;
      File_Name : constant String := "input\two.txt";

      type Commands is (forward, up, down);
      
      package Command_Text_IO is new Ada.Text_IO.Enumeration_IO (Commands);
      package Value_Text_IO is new Ada.Text_IO.Integer_IO (Integer);
      
      Command: Commands;
      Value: Integer;
      
      Depth: Integer;
      Horizontal: Integer;
      Aim: Integer;
   begin
      Depth := 0;
      Horizontal := 0;
      Aim := 0;
      
      Open (F, In_File, File_Name);
      while not End_Of_File (F) loop
         Command_Text_IO.Get (F, Command);
         Value_Text_IO.Get (F, Value);

         case Command is
            when forward =>
               Horizontal := Horizontal + Value;
               Depth := Depth + (Aim * Value);
            when down =>
               Aim := Aim + Value;
            when up =>
               Aim := Aim - Value;
         end case;
      end loop;
      Close (F);

      Ada.Text_IO.Put_Line (Integer'Image (Depth * Horizontal));
   end Hard;
   
   
   

end two;

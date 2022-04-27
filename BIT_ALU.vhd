----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/27/2022 06:08:58 PM
-- Design Name: 
-- Module Name: BIT_ALU - arch_ALU
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BIT_ALU is
    Port (
        a   : IN std_logic;
        b   : IN std_logic;
        cin : IN std_logic;
        operation : IN std_logic_vector(3 downto 0);
        result   : OUT std_logic;
        cout: OUT std_logic
    );
end BIT_ALU;

architecture arch_ALU of BIT_ALU is
begin
process(a,b,result,cin,cout)
    begin
    case operation is
        when "0000" => 
            result <= a and b;
        when "0001" => 
            result <= a or b;
        when "0010" => 
            result <= (((not a)and(not b)and cin) OR
                      (a and (not b)and(not cin)) OR
                      ((not a)and b and(not cin)) OR
                      (a and b and cin));
            cout <= ((a and b) OR (a and cin) OR (b and cin));
     end case;
end process;                      
end arch_ALU;

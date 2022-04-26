----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/26/2022 11:23:20 AM
-- Design Name: 
-- Module Name: FULL_ADDER - Behavioral_FULL_ADDER
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

entity FULL_ADDER is
  Port (
        a   : IN std_logic;
        b   : IN std_logic;
        cin : IN std_logic;
        y   : OUT std_logic;
        cout: OUT std_logic
   );
end FULL_ADDER;

architecture Behavioral_FULL_ADDER of FULL_ADDER is

begin
        y <= a XOR b XOR cin;
        cout <= (a AND b) OR
                (b AND cin) OR
                (a AND cin);
end Behavioral_FULL_ADDER;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/27/2022 06:50:40 PM
-- Design Name: 
-- Module Name: top_ALU - arch_top
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

entity top_ALU is
  Port (clk : IN std_logic;
        reset: IN std_logic;
        a, b : IN std_logic_vector(31 downto 0);
        operation : IN std_logic_vector(3 downto 0);
        result : out std_logic_vector(31 downto 0)
        );
end top_ALU;

architecture arch_top of top_ALU is
component ALU
    Port (a   : IN std_logic_vector(31 downto 0);
        b   : IN std_logic_vector(31 downto 0);
        cin : IN std_logic;
        operation : IN std_logic_vector(3 downto 0);
        result   : OUT std_logic_vector(31 downto 0);
        cout: OUT std_logic;
        overflow: OUT std_logic
   );
end component;

signal B_INV : std_logic_vector(31 downto 0);
signal 
begin


end arch_top;

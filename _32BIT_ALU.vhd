----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/27/2022 06:25:02 PM
-- Design Name: 
-- Module Name: _32BIT_ALU - arch_32ALU
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

entity ALU is
  Port (a   : IN std_logic_vector(31 downto 0);
        b   : IN std_logic_vector(31 downto 0);
        cin : IN std_logic;
        operation : IN std_logic_vector(3 downto 0);
        result   : OUT std_logic_vector(31 downto 0);
        cout: OUT std_logic;
        overflow: OUT std_logic
   );
end ALU;

architecture arch_32ALU of ALU is

signal carry : std_logic_vector(32 downto 0);
signal temp  : std_logic_vector(31 downto 0);

component BIT_ALU is
   Port(a   : IN std_logic;
        b   : IN std_logic;
        cin : IN std_logic;
        operation : IN std_logic_vector(3 downto 0);
        result   : OUT std_logic;
        cout: OUT std_logic
        );
end component;
begin
--standard 1 bit units
    N_BIT_ALU_GENERATE : for N in 0 to 31 generate
    N_BIT_ALU : BIT_ALU
        port map(a => a(N),
                 b => b(N),
                 cin => carry(N),
                 result => result(N),
                 cout => carry(N+1),
                 operation => operation
                 );
    end generate;
--MSB unit
    carry(0) <= cin;
    overflow <= carry(32);
    result <= result;
end arch_32ALU;

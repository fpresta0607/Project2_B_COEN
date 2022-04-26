----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/26/2022 11:16:06 AM
-- Design Name: 
-- Module Name: ripple_adder - Behavioral_ripple_adder
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

entity ripple_adder is
      GENERIC(WIDTH : NATURAL := 32);
      Port (a, b : IN std_logic_vector(WIDTH-1 downto 0);
            cin  : IN std_logic := '0';
            y    : OUT std_logic_vector(WIDTH-1 downto 0);
            cout : OUT std_logic
       );
end ripple_adder;

architecture Behavioral_ripple_adder of ripple_adder is
        
    signal carry    : std_logic_vector(WIDTH downto 0);
    signal y_temp   : std_logic_vector(WIDTH-1 downto 0);
    
    component FULL_ADDER is
       Port(a   : IN std_logic;
            b   : IN std_logic;
            cin : IN std_logic;
            y   : OUT std_logic;
            cout: OUT std_logic);
    end component;
begin
    
       N_bit_adder_generate : FOR N IN 0 TO WIDTH-1 GENERATE
       N_bit_adder : FULL_ADDER
            port map(a => a(N),
                     b => b(N),
                     cin => carry(N),
                     y => y_temp(N),
                     cout => carry(N+1));
       end generate; 
       
       carry(0) <= cin;
       cout <= carry(WIDTH);
       y <= y_temp;

end Behavioral_ripple_adder;

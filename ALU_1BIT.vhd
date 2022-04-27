----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/26/2022 10:46:04 AM
-- Design Name: 
-- Module Name: ALU_1BIT - Behavioral
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

entity ALU_1BIT is
  GENERIC(WIDTH : NATURAL := 32);
  Port (clk : IN std_logic := '0';
        reset: IN std_logic := '0';
        a, b : IN std_logic_vector(WIDTH-1 downto 0) := (OTHERS => '0');
        control : IN std_logic_vector(3 downto 0) := (OTHERS => '0');
        result : out std_logic_vector(WIDTH-1 downto 0) 
   );
end ALU_1BIT;

architecture Behavioral of ALU_1BIT is
    component ripple_adder
    port(a  : IN std_logic_vector(WIDTH-1 downto 0);
         b  : IN std_logic_vector(WIDTH-1 downto 0);
         cin: IN std_logic := '0';
         y  : OUT std_logic_vector(WIDTH-1 downto 0);
         cout: OUT std_logic);
    end component;
    
    signal RCA_output   : std_logic_vector(WIDTH-1 downto 0) := (OTHERS => '0');
    signal B_neg        : std_logic_vector(WIDTH-1 downto 0) := (OTHERS => '0');
    signal c_flag       : std_logic := '0';
    signal c_reg        : std_logic := '0';
    signal cin          : std_logic := '0';
begin
RCA_comp : ripple_adder
    port map(a => A,
             b => B_neg,
             cin => cin,
             y => RCA_output,
             cout => c_flag);
    
    WITH control SELECT
        B_neg <= NOT(B) when "1000",
                     B  when OTHERS;
    
    WITH control SELECT
        cin <= '1'      when "0110", --sub
               '0'       when OTHERS;--ADD
    
    ALU_Process:
    process(clk, reset)
    begin
        if reset = '0' THEN
            result <= (OTHERS => '0');
            c_reg  <= '0';
        elsif rising_edge(clk) then
            CASE control is
                when "0000" => result <= A and B;
                when "0001" => result <= A or B;
                when "0010" => result <= RCA_output; --ADD
                when "0110" => result <= RCA_output; --SUB
                when "0111" => result <= ;
                when "1100" => result <= A nor B
             end case;
        end if;
end Behavioral;

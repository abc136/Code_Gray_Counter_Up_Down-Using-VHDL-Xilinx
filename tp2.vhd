----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:02:24 04/25/2012 
-- Design Name: 
-- Module Name:    tp2 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tp2 is
    Port ( H : in  STD_LOGIC;
           CE : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           DIR : in  STD_LOGIC;
           DIN : in  STD_LOGIC_VECTOR (3 downto 0);
           DOUT : inout  STD_LOGIC_VECTOR (3 downto 0));
end tp2;

architecture Behavioral of tp2 is

begin
process (H, RESET) 
begin
   if RESET='0' then 
      DOUT <= "0011";
   elsif H='1' and H'event then
      if CE='1' then                 
            if DIR='1' then 
				   if DOUT < "1100" then
               DOUT <= DOUT + 1;
					else 
					DOUT <= "0011";
					end if;
            else
				   if DOUT > "0011" then
               DOUT <= DOUT - 1;
					else 
					DOUT <= "1100";
					end if;               
            end if;
         end if;
   end if;
end process;
end Behavioral;
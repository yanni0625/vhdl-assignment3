library ieee;
use ieee.std_logic_1164.all;

entity dlatch is
    port (
        d  : in  std_logic;
        en : in  std_logic;
        q  : out std_logic;
        qn : out std_logic
    );
end entity dlatch;

architecture behavioral of dlatch is
    signal q_i : std_logic := '0';
begin
    process (d, en)
    begin
        if en = '1' then
            q_i <= d;
        end if;
        -- en = '0': hold (no assignment)
    end process;

    q  <= q_i;
    qn <= not q_i;
end architecture behavioral;

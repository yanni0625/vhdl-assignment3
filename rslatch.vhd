library ieee;
use ieee.std_logic_1164.all;

entity rslatch is
    port (
        s  : in  std_logic;
        r  : in  std_logic;
        q  : out std_logic;
        qn : out std_logic
    );
end entity rslatch;

architecture behavioral of rslatch is
    signal q_i  : std_logic := '0';
    signal qn_i : std_logic := '1';
begin
    process (s, r)
    begin
        if s = '1' and r = '0' then
            q_i  <= '1';
            qn_i <= '0';
        elsif s = '0' and r = '1' then
            q_i  <= '0';
            qn_i <= '1';
        elsif s = '1' and r = '1' then
            q_i  <= '0';   -- forbidden: NOR latch gives 0, 0
            qn_i <= '0';
        end if;
        -- s = '0' and r = '0': hold (no assignment)
    end process;

    q  <= q_i;
    qn <= qn_i;
end architecture behavioral;
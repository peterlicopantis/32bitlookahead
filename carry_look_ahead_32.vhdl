library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity Carry_Look_Ahead_32 is
Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
B : in STD_LOGIC_VECTOR (31 downto 0);
Cin : in STD_LOGIC;
S : out STD_LOGIC_VECTOR (31 downto 0);
Cout : out STD_LOGIC);
end Carry_Look_Ahead_32;
 
architecture Behavioral of Carry_Look_Ahead_32 is
 
component Partial_Full_Adder
Port ( A : in STD_LOGIC;
B : in STD_LOGIC;
Cin : in STD_LOGIC;
S : out STD_LOGIC;
P : out STD_LOGIC;
G : out STD_LOGIC);
end component;
 
signal c : std_logic_vector(0 to 31);
signal P,G: STD_LOGIC_VECTOR(31 downto 0);
begin
 
    PFA1: Partial_Full_Adder port map( A(0), B(0), Cin, S(0), P(0), G(0));
    PFA2: Partial_Full_Adder port map( A(1), B(1), c(1), S(1), P(1), G(1));
    PFA3: Partial_Full_Adder port map( A(2), B(2), c(2), S(2), P(2), G(2));
    PFA4: Partial_Full_Adder port map( A(3), B(3), c(3), S(3), P(3), G(3));
    PFA5: Partial_Full_Adder port map( A(4), B(4), c(4), S(4), P(4), G(4));
    PFA6: Partial_Full_Adder port map( A(5), B(5), c(5), S(5), P(5), G(5));
    PFA7: Partial_Full_Adder port map( A(6), B(6), c(6), S(6), P(6), G(6));
    PFA8: Partial_Full_Adder port map( A(7), B(7), c(7), S(7), P(7), G(7));
    PFA9: Partial_Full_Adder port map( A(8), B(8), c(8), S(8), P(8), G(8));
    PFA10: Partial_Full_Adder port map( A(9), B(9), c(9), S(9), P(9), G(9));
    PFA11: Partial_Full_Adder port map( A(10), B(10), c(10), S(10), P(10), G(10));
    PFA12: Partial_Full_Adder port map( A(11), B(11), c(11), S(11), P(11), G(11));
    PFA13: Partial_Full_Adder port map( A(12), B(12), c(12), S(12), P(12), G(12));
    PFA14: Partial_Full_Adder port map( A(13), B(13), c(13), S(13), P(13), G(13));
    PFA15: Partial_Full_Adder port map( A(14), B(14), c(14), S(14), P(14), G(14));
    PFA16: Partial_Full_Adder port map( A(15), B(15), c(15), S(15), P(15), G(15));
    PFA17: Partial_Full_Adder port map( A(16), B(16), c(16), S(16), P(16), G(16));
    PFA18: Partial_Full_Adder port map( A(17), B(17), c(17), S(17), P(17), G(17));
    PFA19: Partial_Full_Adder port map( A(18), B(18), c(18), S(18), P(18), G(18));
    PFA20: Partial_Full_Adder port map( A(19), B(19), c(19), S(19), P(19), G(19));
    PFA21: Partial_Full_Adder port map( A(20), B(20), c(20), S(20), P(20), G(20));
    PFA22: Partial_Full_Adder port map( A(21), B(21), c(21), S(21), P(21), G(21));
    PFA23: Partial_Full_Adder port map( A(22), B(22), c(22), S(22), P(22), G(22));
    PFA24: Partial_Full_Adder port map( A(23), B(23), c(23), S(23), P(23), G(23));
    PFA25: Partial_Full_Adder port map( A(24), B(24), c(24), S(24), P(24), G(24));
    PFA26: Partial_Full_Adder port map( A(25), B(25), c(25), S(25), P(25), G(25));
    PFA27: Partial_Full_Adder port map( A(26), B(26), c(26), S(26), P(26), G(26));
    PFA28: Partial_Full_Adder port map( A(27), B(27), c(27), S(27), P(27), G(27));
    PFA29: Partial_Full_Adder port map( A(28), B(28), c(28), S(28), P(28), G(28));
    PFA30: Partial_Full_Adder port map( A(29), B(29), c(29), S(29), P(29), G(29));
    PFA31: Partial_Full_Adder port map( A(30), B(30), c(30), S(30), P(30), G(30));
    PFA32: Partial_Full_Adder port map( A(31), B(31), c(31), S(31), P(31), G(31));
    
    arch1: process 
    begin
        c(0) <= G(0) or (P(0) and Cin);
        for i in 1 to 31 loop
            c(i) <= G(i) or (P(i) and c(i));
        end loop;

        for i in 0 to 31 loop
            S(i) <= (A(i) xor B(i)) xor c(i);
        end loop;
        wait;

        Cout <= c(31);
    end process arch1;

end Behavioral;

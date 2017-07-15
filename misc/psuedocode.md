https://codepoints.net/miscellaneous_symbols_and_pictographs?page=2
^ list of unicode characters w encoding

EXAMPLE
print explosion in cmd line
echo -e "\xF0\x9F\x92\xA5"
print explosion through cmd line with ruby
`echo -e "\xF0\x9F\x92\xA5"`.strip
wave
echo -e "\xF0\x9F\x8C\x8A"
fire
echo -e	"\xF0\x9F\x94\xA5"
explosion
echo -e "\xF0\x9F\x92\xA5"

ship
echo -e "\xF0\x9F\x8E\xAB"




Basic plan

Battleship runner class

Ship object
ship health
ship max health
ship length
ship orientation

Board object
create a grid of space objects
A1-A12   B1-B12 etc.

allow player to set ships

Space object
ship = ship object(if on space)
player_hit = false
player_miss = false
computer_hit = false
computr_miss = false

REPL - cmd line interaction


read, evaluate, print, loop

lib/battleship.rb

allow users to quit at any time


two ship locations validate_location
first letter == second letter && first_number == second_number - 1 && first_number < 4
first letter == second letter && second_number == first_number - 1 && second_number < 4

first letter == 'A' && second letter == 'B' && first number == second_number && first_number < 5
first letter == 'B' && second letter == 'C' && first number == second_number && first_number < 5
first letter == 'C' && second letter == 'D' && first number == second_number && first_number < 5
C4  D4
B4 D4

C3 D3      D3 C3    

INVALID

A1 A3        A1 B3      A2 D2

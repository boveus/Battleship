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

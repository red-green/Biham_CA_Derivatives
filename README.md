# Biham CA Derivatives
Several self-organizing cellular automatons inspired by the Biham-Middleton-Levin Traffic Model

#### All in processing

I wrote an implementation of the Biham-Middleton-Levine traffic model cellular automaton in Processing, and then made several modifications to make it different:

* `biham_middleton_levine` - original implementation
* `biham_fail` - early version that would always jam up for some reason
* `biham_diagonal` - experiment to make the cells move diagonally
* `biham_4direction` - 4 different colors that move in all 4 directions... not super interesting

Then I wondered if a similar rule could be applied to two colors going in opposite directions. If they hit eachother, one cell moves off to the side. I decided to call this rule the "Hallway traffic model", and it is self-organizing because the cells naturally migrate to their respective sides of the hallway. The left and right sides are connected in a loop, but the top and bottom are not.

* `hallway_traffic_CA` - original, not very interesting
* `hallway_traffic_CA_2` - slightly better, still not very interesting
* `hallway_traffic_CA_3` - the best, creates interesting jams and organizes the fastest
* `hallway_4direction` - yet again, 4 directional movement. not very interesting
* `hallway_4direction_2` - cells can move to *both* sides and creates very interesting jams

The controls for all programs are the same:

* <kbd>space</kbd> - random fill with the current precentage
* <kbd>-</kbd> - slows down the simulation
* <kbd>=</kbd> - speeds up the simulation
* <kbd>[</kbd> - increases fill precentage
* <kbd>]</kbd> - decreases fill precentage


All programs lisences under GNU GPL v2

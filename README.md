# Final Project: LABS: The Platform Experiment
A basic 2D platformer game by Andrew Stafford.
Continued from a previous project: [P2-SciFi-Platformer](https://github.com/bsu-cs315/P2-SciFi-Platformer)

### How to Play:
#### Keyboard:
- Left/Right or A/D to move player left or right
- Up or W to jump
- Space to attack
- Tab to pause game, space to unpause
#### Controller:
- Left stick to move left or right
- Cross/A/B to jump
- Square/X/Y to attack
- Options/Start/+ to pause
- Circle/B/A to unpause

### GitHub Pages Web Release
[LABS: The Platform Experiment](https://bsu-cs315.github.io/FP-LABS/)

## Project Report
### Layers and Masks Documentation:
I used layers and masks to add collectibles into my platformer. I created a collectible scene as an <code>Area2D</code> and a sprite for texture, then instanced a few of this scene in each level to give it collectibles. I put the collectibles in a second layer, then set only the player mask to detect collisions in that layer so that only the player would "collide" with the collectible Area2D and be able to pick it up.

### Planning Process Reflection:
I decided to continue using the same planning process as Iteration 1 for my other two iterations as well. Because I was working alone on this final project and not on a team, using GitHub to set up projects, issues, and milestones didn't make too much of an impact on my overall process throughout the project, but it was still helpful nonetheless. It was helpful for the times when I wanted to plan out specific work to focus on for the iteration, when I had to take a break for a day or two to work on other schoolwork, or even when I simply got stuck going down the rabbit hole of bug fixes/small, popup, somewhat random features and lost my main focus for the iteration. It was a very nice reference to go back to to make sure I got key, planned features finished no matter what else I decided to put into the current iteration.

### Reflection:


### Self-Evaluation:
- [x] D-1: The repository link is submitted to Canvas before the project deadline.
- [x] D-2: The repository contains a <code>README.md</code> file in its top-level directory.
- [x] D-3: The project content is eligible for an <a href="https://www.esrb.org/ratings-guide/">ESRB Rating</a> of M or less.
- [x] C-1: Your repository is well-formed, with an appropriate <code>.gitignore</code> file and no unnecessary files tracked.
- [x] C-2: Your release is tagged using <a href="https://semver.org/">semantic versioning</a> where the major version is zero, the minor version is the iteration number, and the patch version is incremented as usual for each change made to the minor version, and the release name matches the release tag.
- [x] C-3: You have a clear legal right to use all incorporated assets, and the licenses for all third-party assets are tracked in the <code>README.md</code> file.
- [x] C-4: The <code>README.md</code> contains instructions for how to play the game or such instructions are incorporated into the game itself.
- [x] C-5: The project content is eligible for an <a href="https://www.esrb.org/ratings-guide/">ESRB Rating</a> of T or less.
- [x] C-6: The release demonstrates the core gameplay loop: the player can take action that moves them toward a goal.
- [x] B-1: The <code>README.md</code> file contains a personal reflection on the iteration and self-evaluation, as defined above.
- [x] B-2: The game runs without errors or warnings.
- [x] B-3: The playable game is published to GitHub Pages and linked from the <code>README.md</code> file, or executable builds are provided for download as part of the GitHub release.
- [x] B-4: The source code and project structure comply with our adopted style guides.
- [x] B-5: Clear progress has been made on the game with respect to the project plan.
- [x] A-1: The source code contains no warnings: all warnings are properly addressed, not just ignored.
- [x] A-2: The game includes the conventional player experience loop of title, gameplay, and ending.
- [x] A-3: Earn <em>N</em>*&lceil;<em>P</em>/2&rceil; stars, where <em>N</em> is the iteration number and <em>P</em> is the number of people on the team.
- [x] ⭐ Include a dynamic (non-static) camera
- [x] ⭐ Incorporate parallax background scrolling
- [ ] ⭐ Use paper doll animations
- [ ] ⭐ Incorporate smooth transitions between title, game, and end states, rather than jumping between states via <code>change_scene</code>
- [ ] ⭐ Support both touch and mouse/keyboard input in the Web build
- [ ] ⭐ Allow the user to control the volume of music and sound effects independently.
- [ ] ⭐ Incorporate juiciness and document it in the <code>README.md</code>
- [ ] ⭐ Incorporate another kind of juiciness and document it in the <code>README.md</code>
- [x] ⭐ Use particle effects
- [x] ⭐ Use different layers and masks to manage collisions and document this in the <code>README.md</code>
- [x] ⭐ Incorporate pop into your HUD or title screen using <code>Tween</code> or <code>AnimationPlayer</code>
- [ ] ⭐ Include an AI-controlled characters
- [ ] ⭐ Include an AI-controlled character controlled with a different AI
- [x] ⭐ Add a pause menu that includes, at minimum, the ability to resume or return to the main menu
- [x] ⭐ Follow the planning process introduced in Iteration 1 for both Iterations 2 and 3, and mention the impact of this in your personal reflection.
- [ ] ⭐ The game is released publicly on <code>itch.io</code>, with all the recommended accompanying text, screenshots, gameplay videos, <i>etc.</i>


## Third-Party Assets
Sprites:

`The Robot` sprite set licensed under [Creative Common Zero (CCO)](https://creativecommons.org/publicdomain/zero/1.0/). Source: https://www.gameart2d.com/the-robot---free-sprites.html

`Ninja Adventure` sprite set licensed under [Creative Common Zero (CCO)](https://creativecommons.org/publicdomain/zero/1.0/). Source: https://www.gameart2d.com/ninja-adventure---free-sprites.html

`Sci-Fi Platformer Tileset` licensed under [Creative Common Zero (CCO)](https://creativecommons.org/publicdomain/zero/1.0/). Source: https://www.gameart2d.com/free-sci-fi-platformer-tileset.html

`Cogwheel` texture licensed under Freepik License, created by rawpixel.com. Source: https://www.freepik.com/free-vector/illustration-cogwheel_2609999.htm#page=1&query=gear&position=1
[Business vector created by rawpixel.com - www.freepik.com](https://www.freepik.com/vectors/business)

`The Boy` sprite set licensed under [Creative Common Zero (CCO)](https://creativecommons.org/publicdomain/zero/1.0/). Source: https://www.gameart2d.com/the-boy---free-sprites.html

<br>
Sounds:

`Chiptune Intro` licensed under [Attribution Noncommercial License](https://creativecommons.org/licenses/by-nc/3.0/). Source: https://freesound.org/people/zagi2/sounds/184413/

`2018-11-02` licensed under [Creative Common Zero (CCO)](https://creativecommons.org/publicdomain/zero/1.0/). Source: https://freesound.org/people/Doctor_Dreamchip/sounds/458087/

`Electric Zap` licensed under [Creative Common Zero (CCO)](https://creativecommons.org/publicdomain/zero/1.0/). Source: https://freesound.org/people/michael_grinnell/sounds/512471/

`8bit Jump` licensed under [Creative Common Zero (CCO)](https://creativecommons.org/publicdomain/zero/1.0/). Source: https://freesound.org/people/plasterbrain/sounds/399095/

<br>
Fonts:

`Fino` font licensed "Free for Personal Use". Source: https://www.dafont.com/fino.font

`Retro Computer` font licensed "Free for Personal Use". Source: https://www.dafont.com/retro-computer.font
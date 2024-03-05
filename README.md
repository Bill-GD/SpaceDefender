# SpaceDefender

# Description 
A simple 2D top-down shooter game.

# Goal
- Try to learn more through a more practical project and/or try apply some other things I know.
- The game idea may change as I develop it.

# General Gameplay Idea
- You control a small spaceship that have a simple cannon (you can shoot).
- There is a central core that simply needs you to protect it.
- There are enemies that want to destroy that thing you protect, so you'll have to take them down.
These enemies will come in various types.
- You may have a chance to salvage defeated enemies for upgrades (Dropped items).
Upgrades will hopefully spice up the game.
- If you die or the core is destroyed, it's game over and you can retry (start over).

# Mechanics

## Movement
- Simple WASD movement.
- Maybe Spacebar to boost/dash in mouse direction.
- Have momentum.

## Combat
- Aim with mouse.
- Shoot with LMB.
- Knocked back when hit.
- Shield takes damage when active, ship takes damage when shield's down, shield can regenerate.
- While dashing/boosting, gain iframes/reduced damage, can damage enemies.

## Enemies
Has several types:
- Normal enemy: Chase, shoot you. Single shot.
- Normal variants: Splitshot, multishot, other ammo.
- Speedy: Chase you faster, can overshoot.
- Sneaky: Slow, somewhat invisible, priorities the core, close range.
- Boss: Big, high damage, have more than 1 attack.
- Kiter (idk): Stay away from you, may run when you get close.

## Upgrades
Upgrades may include these:
- Splitshot
- Multishot
- Turret
- Homing projectile
- Dash/Boost (idk)
- Stats: damage, hp, speed, armor/shield, kb resist

## Weapons
There may be multiple weapons unlocked by collecting upgrades.
Maybe change weapon with wheel.
- Normal blaster
- Double blaster
- Missile launcher
- Laser
- Energy ball (maybe homing, slow)

# Visual
- When low on health, red vinette effect around screen.
- Simple sprites (I'm not good at that)
- Characters flash when hit.
- Maybe Particles when moving, projectiles trail.

# Implementation
- Basic Stats (Resource)
	- HP
	- Damage
	- Armor/Shield
	- Speed

- Character (Base class/scene)
	- Children
		- Sprite
		- Collision
		- Weapon
	- Signals
		- died
	- Methods
		- take_damage
		- move
		- die

- Player (Character)
	- 

- Enemy (Character, Base of enemies)
	- Children
		- Detect range
		- State Machine

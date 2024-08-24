# L4D2 ResolveCollisionPatch
 
Only for Left 4 Dead 2.  
Patches' 2 `if` statements in `ZombieBotLocomotion::ResolveCollision` function which are the cause of infected and witch stuck issues on low nb_update_frequency values. Especially on high tickrates.

## Compilation

If you don't know how to compile it into SourceMod plugin (.smx) see https://wiki.alliedmods.net/Compiling_SourceMod_Plugins
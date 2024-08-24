#include <sourcemod>

#pragma semicolon 1
#pragma newdecls required

#define VERSION "1.0.0"

public Plugin myinfo = {
	name = "L4D2 ResolveCollisionPatch",
	author = "Garamond",
	description = "",
	version = VERSION,
	url = "https://github.com/garamond13/L4D2-ResolveCollisionPatch"
};

public void OnPluginStart()
{	
	GameData game_data = new GameData("l4d2_resolve_collision_patch");

	// Get byte addresses.
	// We only need to change single byte in each if statment to change comparation from "< 1.0f" to "< -1.0f"
	// in order to prevent those if statments from ever being true.
	Address first_if = game_data.GetAddress("ResolveCollision") + view_as<Address>(game_data.GetOffset("first_if"));
	Address second_if = game_data.GetAddress("ResolveCollision") + view_as<Address>(game_data.GetOffset("second_if"));
	
	// First check do we have expected value (xB4) at those byte adresses.
	if (LoadFromAddress(first_if, NumberType_Int8) != 180 || LoadFromAddress(second_if, NumberType_Int8) != 180)
		SetFailState("At least one byte value at given adreesses wasnt xB4.");
	
	// Apply patch (set new value xB8).
	StoreToAddress(first_if, 184, NumberType_Int8);
	StoreToAddress(second_if, 184, NumberType_Int8);
	
	CloseHandle(game_data);
}
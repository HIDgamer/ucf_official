GLOBAL_LIST_EMPTY(crafting_recipes)
GLOBAL_LIST_EMPTY(crafting_recipes_by_ref)

/// A recipe made by hand from things within reach
/datum/crafting_recipe
	var/name
	var/desc
	/// Item typepaths or reagent ids and how many are consumed
	var/list/reqs = list()
	/// Item typepaths that cannot be used as ingredients
	var/list/blacklist = list()
	var/result
	/// Tool kinds that must be at hand but are not consumed
	var/list/tool_behaviors
	var/list/tool_paths
	var/time = 3 SECONDS
	/// Item typepaths that end up inside the result
	var/list/parts = list()
	var/category
	var/one_per_turf = FALSE
	var/list/steps
	var/non_craftable
	var/result_amount
	var/delete_contents = TRUE

/datum/crafting_recipe/New()
	if(!name && result)
		var/atom/atom_result = result
		name = initial(atom_result.name)
	if(!(result in reqs))
		blacklist += result
	if(tool_behaviors)
		tool_behaviors = string_list(tool_behaviors)
	if(tool_paths)
		tool_paths = string_list(tool_paths)

/// Extra checks before crafting, without feedback messages
/datum/crafting_recipe/proc/check_requirements(mob/user, list/collected_requirements)
	return TRUE

/datum/crafting_recipe/proc/on_craft_completion(mob/user, atom/result)
	return

/// Builds the recipe list the first time it is needed
/proc/get_crafting_recipes()
	if(length(GLOB.crafting_recipes))
		return GLOB.crafting_recipes
	for(var/path in subtypesof(/datum/crafting_recipe))
		var/datum/crafting_recipe/recipe = new path
		if(!recipe.result || !recipe.name)
			qdel(recipe)
			continue
		GLOB.crafting_recipes += recipe
		GLOB.crafting_recipes_by_ref["[REF(recipe)]"] = recipe
	return GLOB.crafting_recipes

/// Names of the tools a recipe needs
/proc/crafting_recipe_tool_names(datum/crafting_recipe/recipe)
	var/list/tool_names = list()
	for(var/behaviour in recipe.tool_behaviors)
		tool_names += capitalize(replacetext("[behaviour]", "_", " "))
	for(var/tool_path in recipe.tool_paths)
		tool_names += crafting_requirement_name(tool_path)
	return tool_names

/// Result and ingredient name for a typepath or reagent id
/proc/crafting_requirement_name(requirement)
	if(istext(requirement))
		var/datum/reagent/reagent = GLOB.chemical_reagents_list[requirement]
		return reagent ? reagent.name : requirement
	var/atom/atom_path = requirement
	return capitalize(initial(atom_path.name))

GLOBAL_VAR(cookbook_html)

/// Order the cookbook lists recipe categories in
GLOBAL_LIST_INIT(cookbook_category_order, list(CAT_BREAD, CAT_BURGER, CAT_SANDWICH, CAT_PIZZA, CAT_PIE, CAT_PASTRY, CAT_CAKE, CAT_EGG, CAT_MEAT, CAT_SEAFOOD, CAT_SPAGHETTI, CAT_SOUP, CAT_SALAD, CAT_MEXICAN, CAT_ICE, CAT_FOOD, CAT_MISCFOOD))

/// Food made without the Crafting Menu: result type (or null), name and how
GLOBAL_LIST_INIT(cookbook_basics, list(
	list(/obj/item/food/dough, "Dough", "15u flour and 10u water, mixed in any container."),
	list(/obj/item/food/bread/plain, "Bread", "Bake dough in the oven."),
	list(/obj/item/food/flatdough, "Flat dough", "Use a rolling pin on dough while it sits on a table or tray. Needed for pizzas and pies."),
	list(/obj/item/food/doughslice, "Dough slice", "Use a knife on flat dough on a table or tray to cut three."),
	list(/obj/item/food/bun, "Bun", "Bake a dough slice in the oven."),
	list(/obj/item/food/spaghetti/raw, "Spaghetti", "Use the food processor on a dough slice."),
	list(/obj/item/food/spaghetti/boiledspaghetti, "Boiled Spaghetti", "Put 25u water and a spaghetti in a soup pot on a lit stove. Takes 20 seconds."),
	list(/obj/item/food/uncooked_rice, "Soaked rice", "10u rice and 10u water."),
	list(/obj/item/food/boiledrice, "Boiled Rice", "Put 25u water and soaked rice in a soup pot on a lit stove. Takes 20 seconds."),
	list(/obj/item/food/cakebatter, "Cake batter", "18u egg, 15u flour and 5u sugar, or 15u soy milk, 15u flour and 5u sugar."),
	list(/obj/item/food/cheese/mozzarella, "Mozzarella", "10u milk and 10u cream."),
	list(/obj/item/food/cheese/curd_cheese, "Curd cheese", "15u milk, 5u vinegar and 5u cream."),
	list(/obj/item/food/chocolatebar, "Chocolate bar", "5u each of milk, cocoa and sugar."),
	list(null, "Vinegar", "5u each of wine, water and sugar."),
))

#define COOKBOOK_CSS "<style>h1 {font-size: 18px; margin: 15px 0px 5px;} h2 {font-size: 15px; margin: 15px 0px 5px;} h3 {font-size: 13px; margin: 15px 0px 5px;} li {margin: 4px 0px 4px 5px; list-style-type: none;} ul {margin: 5px; padding: 0px;} body {font-size: 13px; font-family: Verdana;} span\[class^='cooking'] {vertical-align: middle; margin-right: 6px;}</style>"

/// Picture from the cooking spritesheet, empty when it has none
/proc/cookbook_sprite(sprite_name)
	var/datum/asset/spritesheet/cooking/sheet = get_asset_datum(/datum/asset/spritesheet/cooking)
	return sheet.icon_tag(sprite_name) || ""

/// Ingredients of a hand crafted recipe, items as "2x Egg" and reagents as "5u Water"
/proc/cookbook_requirements(list/reqs)
	var/list/entries = list()
	for(var/requirement in reqs)
		entries += "[reqs[requirement]][istext(requirement) ? "u" : "x"] [html_encode(crafting_requirement_name(requirement))]"
	return english_list(entries)

/proc/cookbook_basics_section(list/nav)
	nav += "<a href='#basics'>Basics</a>"
	var/list/body = list("<h1 id='basics'>Basics</h1>These are not in the Crafting Menu. Mix the reagents in any container and the food appears.<ul>")
	for(var/list/entry in GLOB.cookbook_basics)
		var/picture = entry[1] ? cookbook_sprite(cooking_sprite_name(entry[1])) : ""
		body += "<li>[picture]<b>[html_encode(entry[2])]</b>: [html_encode(entry[3])]</li>"
	body += "</ul>"
	return jointext(body, "")

/proc/cookbook_soup_section(section_id)
	var/list/body = list("<h2 id='[section_id]'>[html_encode(CAT_SOUP)]</h2>Fill a soup pot with the water and ingredients, set it on a stove and turn the stove on. Ladle the finished soup into bowls.<ul>")
	var/index = 0
	for(var/datum/soup_recipe/recipe as anything in get_soup_recipes())
		index++
		if(recipe.category != CAT_SOUP)
			continue
		var/list/needs = list()
		for(var/reagent_id in recipe.required_reagents)
			needs += "[recipe.required_reagents[reagent_id]]u [html_encode(crafting_requirement_name(reagent_id))]"
		for(var/ingredient in recipe.required_ingredients)
			needs += "[recipe.required_ingredients[ingredient]]x [html_encode(crafting_requirement_name(ingredient))]"
		body += "<li>[cookbook_sprite("s[index]")]<b>[html_encode(recipe.name)]</b>: [english_list(needs)]. Cooks in [recipe.cook_time / 10] seconds.</li>"
	body += "</ul>"
	return jointext(body, "")

/proc/cookbook_crafting_section(list/nav)
	var/list/by_category = list()
	var/list/sprite_names = list()
	var/index = 0
	for(var/datum/crafting_recipe/recipe as anything in get_crafting_recipes())
		index++
		sprite_names[recipe] = "r[index]"
		if(recipe.non_craftable)
			continue
		LAZYADDASSOCLIST(by_category, recipe.category || CAT_MISCFOOD, recipe)
	var/list/order = GLOB.cookbook_category_order.Copy()
	for(var/category in sortList(by_category))
		order |= category
	var/list/body = list("<h1>Recipes</h1>Most of these are made from the Crafting Menu on the IC tab. Hold the ingredients or leave them on the floor or a table next to you, keep the tools within reach, and press Craft.")
	var/section = 0
	for(var/category in order)
		var/list/recipes = by_category[category]
		if(category != CAT_SOUP && !length(recipes))
			continue
		section++
		var/section_id = "section[section]"
		nav += "<a href='#[section_id]'>[html_encode(category)]</a>"
		if(category == CAT_SOUP)
			body += cookbook_soup_section(section_id)
			continue
		body += "<h2 id='[section_id]'>[html_encode(category)]</h2><ul>"
		for(var/datum/crafting_recipe/recipe as anything in recipes)
			var/line = "<li>[cookbook_sprite(sprite_names[recipe])]<b>[html_encode(recipe.name)]</b>: [cookbook_requirements(recipe.reqs)]."
			var/list/tools = crafting_recipe_tool_names(recipe)
			if(length(tools))
				line += " <i>Needs [html_encode(english_list(tools))].</i>"
			if(length(recipe.steps))
				line += " [html_encode(jointext(recipe.steps, " "))]"
			body += "[line]</li>"
		body += "</ul>"
	return jointext(body, "")

/proc/cookbook_processor_section(list/nav)
	nav += "<a href='#processor'>Food Processor</a>"
	var/list/recipes = list()
	var/list/inputs = get_food_processor_inputs()
	for(var/input_type in inputs)
		recipes |= inputs[input_type]
	var/list/body = list("<h1 id='processor'>Food Processor</h1>Put the food in, then use the processor to run it.<ul>")
	for(var/datum/bastion_processor_recipe/recipe as anything in recipes)
		if(!recipe.output)
			continue
		var/amount = max(1, recipe.food_multiplier)
		body += "<li>[cookbook_sprite(cooking_sprite_name(recipe.output))]<b>[html_encode(crafting_requirement_name(recipe.input))]</b> becomes [amount > 1 ? "[amount]x " : ""][html_encode(crafting_requirement_name(recipe.output))]</li>"
	body += "</ul>"
	return jointext(body, "")

/proc/cookbook_appliance_section(list/nav)
	nav += "<a href='#machines'>Kitchen Machines</a>"
	return {"<h1 id='machines'>Kitchen Machines</h1>
		<ul>
		<li><b>Griddle, griddle stand and grill</b>: put food that can be grilled on it, use it with an empty hand to turn it on, and take the food off before it burns.</li>
		<li><b>Oven</b>: use it with an empty hand to open the door, put food that can be baked inside, then close the door to start baking.</li>
		<li><b>Deep fryer</b>: fill the vat with at least 25u of cooking oil, put food in and turn it on. Food is fried after 15 seconds and burns after 90.</li>
		<li><b>Microwave oven</b>: open the door, put food in, close it and cook. Microwavable food comes out heated and anything else is ruined.</li>
		<li><b>Food processor</b>: see the list above.</li>
		<li><b>All-In-One Grinder</b>: put produce in and juice it or grind it into the beaker. With only the beaker loaded, mix turns every 25u of milk into butter and eggs into mayonnaise.</li>
		<li><b>Ice cream vat</b>: choose a flavour and click a cone with the vat to scoop. Making more stock uses 3u each of milk, ice and the flavouring (vanilla, cocoa, berry juice or singulo), which you can pour into the vat.</li>
		<li><b>Coffeemaker</b>: load a cartridge and a pot, brew, then pour into cups.</li>
		</ul>"}

/proc/get_cookbook_html()
	if(GLOB.cookbook_html)
		return GLOB.cookbook_html
	var/list/nav = list()
	var/basics = cookbook_basics_section(nav)
	var/recipes = cookbook_crafting_section(nav)
	var/processor = cookbook_processor_section(nav)
	var/machines = cookbook_appliance_section(nav)
	var/datum/asset/spritesheet/cooking/sheet = get_asset_datum(/datum/asset/spritesheet/cooking)
	GLOB.cookbook_html = "[COOKBOOK_CSS][sheet.css_tag()]<h1>Chef Recipes</h1>Contents: [jointext(nav, " | ")][basics][recipes][processor][machines]"
	return GLOB.cookbook_html

#undef COOKBOOK_CSS

#define MEAT (1<<0)
#define VEGETABLES (1<<1)
#define RAW (1<<2)
#define JUNKFOOD (1<<3)
#define GRAIN (1<<4)
#define FRUIT (1<<5)
#define DAIRY (1<<6)
#define FRIED (1<<7)
#define ALCOHOL (1<<8)
#define SUGAR (1<<9)
#define GROSS (1<<10)
#define TOXIC (1<<11)
#define PINEAPPLE (1<<12)
#define BREAKFAST (1<<13)
#define CLOTH (1<<14)
#define NUTS (1<<15)
#define SEAFOOD (1<<16)
#define ORANGES (1<<17)
#define BUGS (1<<18)
#define GORE (1<<19)

#define FOOD_IN_CONTAINER (1<<0)
#define FOOD_FINGER_FOOD (1<<1)

#define FOOD_TRASH_POPABLE (1<<0)
#define FOOD_TRASH_OPENABLE (1<<1)

#define FOOD_PRICE_WORTHLESS 0
#define FOOD_PRICE_TRASH 25
#define FOOD_PRICE_CHEAP 70
#define FOOD_PRICE_NORMAL 150
#define FOOD_PRICE_EXOTIC 450
#define FOOD_PRICE_LEGENDARY 1300

#define CRAFTED_FOOD_BASE_REAGENT_MODIFIER 0.7
#define CRAFTED_FOOD_INGREDIENT_REAGENT_MODIFIER 0.5

#define FOOD_GRILL_BURN_MIN (60 SECONDS)
#define FOOD_GRILL_BURN_MAX (90 SECONDS)
#define FOOD_OVEN_BURN_MIN (75 SECONDS)
#define FOOD_OVEN_BURN_MAX (120 SECONDS)
#define FOOD_FRYER_BURN_TIME (90 SECONDS)

#define TOOL_KNIFE "knife"
#define TOOL_ROLLINGPIN "rolling_pin"
#define TOOL_SAW "saw"
#define TOOL_SCALPEL "scalpel"

#define CAT_FOOD "Foods"
#define CAT_BREAD "Breads"
#define CAT_BURGER "Burgers"
#define CAT_CAKE "Cakes"
#define CAT_EGG "Egg-Based Food"
#define CAT_MEAT "Meats"
#define CAT_SEAFOOD "Seafood"
#define CAT_MISCFOOD "Misc. Food"
#define CAT_MEXICAN "Mexican Food"
#define CAT_PASTRY "Pastries"
#define CAT_PIE "Pies"
#define CAT_PIZZA "Pizzas"
#define CAT_SALAD "Salads"
#define CAT_SANDWICH "Sandwiches"
#define CAT_SOUP "Soups"
#define CAT_SPAGHETTI "Spaghettis"
#define CAT_ICE "Frozen"
#define CAT_DRINK "Drinks"

#define span_notice(text) SPAN_NOTICE(text)
#define span_warning(text) SPAN_WARNING(text)
#define span_danger(text) SPAN_DANGER(text)
#define span_bold(text) SPAN_BOLD(text)
#define span_hear(text) SPAN_NOTICE(text)

#define FOOD_MEAT_NORMAL 5
#define FOOD_MEAT_HUMAN 50
#define FOOD_MEAT_MUTANT 100
#define FOOD_MEAT_MUTANT_RARE 200

#define STATUS_EFFECT_FOOD_HEALTH_TINY null
#define STATUS_EFFECT_FOOD_HEALTH_SMALL null
#define STATUS_EFFECT_FOOD_HEALTH_MEDIUM null
#define STATUS_EFFECT_FOOD_HEALTH_LARGE null
#define STATUS_EFFECT_FOOD_RESISTANCE null
#define STATUS_EFFECT_FOOD_SLIDE null
#define STATUS_EFFECT_FOOD_JOB_MINER null
#define STATUS_EFFECT_FOOD_FIREBURPS null
#define STATUS_EFFECT_FOOD_SWEATY null
#define STATUS_EFFECT_STAM_REGEN_SMALL null
#define STATUS_EFFECT_STAM_REGEN_MEDIUM null
#define STATUS_EFFECT_STAM_REGEN_LARGE null

#define PAYCHECK_LOWER 0
#define PAYCHECK_CREW 0
#define ITEM_SLOT_MASK 0

#define CUSTOM_INGREDIENT_ICON_NOCHANGE 0
#define CUSTOM_INGREDIENT_ICON_FILL 1
#define CUSTOM_INGREDIENT_ICON_SCATTER 2
#define CUSTOM_INGREDIENT_ICON_STACK 3
#define CUSTOM_INGREDIENT_ICON_STACKPLUSTOP 5

#define TRAIT_TRASH_ITEM "trash_item"
#define INNATE_TRAIT "innate"

#define CELL_LINE_TABLE_MOLD null
#define CELL_LINE_TABLE_CARP null
#define CELL_LINE_TABLE_BEAR null
#define CELL_LINE_TABLE_CHICKEN null
#define CELL_LINE_TABLE_MOUSE null
#define CELL_LINE_TABLE_CORGI null
#define CELL_LINE_TABLE_PUG null
#define CELL_LINE_TABLE_WALKING_MUSHROOM null
#define CELL_VIRUS_TABLE_GENERIC null
#define CELL_VIRUS_TABLE_GENERIC_MOB null

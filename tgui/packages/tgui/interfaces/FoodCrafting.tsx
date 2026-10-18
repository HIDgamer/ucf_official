import { classes } from 'common/react';
import { useState } from 'react';

import { useBackend } from '../backend';
import { Box, Button, Input, Section, Stack, Tabs } from '../components';
import { Window } from '../layouts';

type Requirement = {
  name: string;
  amount: number;
  reagent: boolean;
};

type Recipe = {
  ref: string;
  sprite: string;
  name: string;
  category: string;
  desc: string;
  reqs: Requirement[];
  tools: string[];
  steps?: string[];
  non_craftable?: boolean;
};

type Data = {
  recipes: Recipe[];
  categories: string[];
  craftable: string[];
  busy: boolean;
  display_craftable_only: boolean;
};

export const FoodCrafting = (props) => {
  const { act, data } = useBackend<Data>();
  const { recipes, categories, craftable, busy, display_craftable_only } = data;

  const [category, setCategory] = useState('All');
  const [search, setSearch] = useState('');

  const craftableSet = new Set(craftable);
  const query = search.trim().toLowerCase();

  const shown = recipes.filter((recipe) => {
    if (category !== 'All' && recipe.category !== category) {
      return false;
    }
    if (display_craftable_only && !craftableSet.has(recipe.ref)) {
      return false;
    }
    if (!query) {
      return true;
    }
    return (
      recipe.name.toLowerCase().includes(query) ||
      recipe.reqs.some((req) => req.name.toLowerCase().includes(query))
    );
  });

  return (
    <Window width={760} height={620}>
      <Window.Content>
        <Stack fill>
          <Stack.Item width="190px">
            <Section fill scrollable title="Categories">
              <Tabs vertical>
                <Tabs.Tab
                  selected={category === 'All'}
                  onClick={() => setCategory('All')}
                >
                  All
                </Tabs.Tab>
                {categories.map((name) => (
                  <Tabs.Tab
                    key={name}
                    selected={category === name}
                    onClick={() => setCategory(name)}
                  >
                    {name}
                  </Tabs.Tab>
                ))}
              </Tabs>
            </Section>
          </Stack.Item>
          <Stack.Item grow>
            <Section
              fill
              scrollable
              title={`Recipes (${shown.length})`}
              buttons={
                <Stack align="center">
                  <Stack.Item>
                    <Input
                      placeholder="Search"
                      value={search}
                      onChange={(e, value) => setSearch(value)}
                    />
                  </Stack.Item>
                  <Stack.Item>
                    <Button.Checkbox
                      checked={!!display_craftable_only}
                      onClick={() => act('toggle_craftable_only')}
                    >
                      Craftable only
                    </Button.Checkbox>
                  </Stack.Item>
                </Stack>
              }
            >
              {shown.map((recipe) => {
                const canCraft = craftableSet.has(recipe.ref);
                return (
                  <Section key={recipe.ref}>
                    <Stack align="center">
                      <Stack.Item>
                        <span
                          className={classes(['cooking32x32', recipe.sprite])}
                        />
                      </Stack.Item>
                      <Stack.Item grow>
                        <Box bold>{recipe.name}</Box>
                        <Box color="label">{recipe.desc}</Box>
                        <Box>
                          {recipe.reqs.map((req, index) => (
                            <Box
                              key={index}
                              as="span"
                              mr={1}
                              color={req.reagent ? 'teal' : undefined}
                            >
                              {req.amount}
                              {req.reagent ? 'u' : 'x'} {req.name}
                              {index < recipe.reqs.length - 1 ? ',' : ''}
                            </Box>
                          ))}
                        </Box>
                        {recipe.tools.length > 0 && (
                          <Box color="average">
                            Needs: {recipe.tools.join(', ')}
                          </Box>
                        )}
                        {recipe.steps &&
                          recipe.steps.map((step, index) => (
                            <Box key={index} color="label">
                              {step}
                            </Box>
                          ))}
                      </Stack.Item>
                      {!recipe.non_craftable && (
                        <Stack.Item>
                          <Button
                            icon="utensils"
                            disabled={!canCraft || busy}
                            onClick={() => act('make', { recipe: recipe.ref })}
                          >
                            Craft
                          </Button>
                        </Stack.Item>
                      )}
                    </Stack>
                  </Section>
                );
              })}
            </Section>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};

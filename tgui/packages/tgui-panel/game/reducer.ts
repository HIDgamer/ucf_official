/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

import { connectionLost } from './actions';
import { connectionRestored } from './actions';

const initialState = {
  // TODO: This is where round info should be.
  roundId: null,
  roundTime: null,
  roundRestartedAt: null,
  connectionLostAt: null,
  playerJob: null,
  playerCharacter: null,
  playerCharacters: [],
};

export const gameReducer = (state = initialState, action) => {
  const { type, meta } = action;
  if (type === 'roundrestart') {
    return {
      ...state,
      roundRestartedAt: meta.now,
    };
  }
  if (type === connectionLost.type) {
    return {
      ...state,
      connectionLostAt: meta.now,
    };
  }
  if (type === connectionRestored.type) {
    return {
      ...state,
      connectionLostAt: null,
    };
  }
  if (type === 'player/set') {
    const { payload } = action;
    return {
      ...state,
      playerJob: payload?.job ?? null,
      playerCharacter: payload?.character ?? null,
      playerCharacters: Array.isArray(payload?.characters)
        ? payload.characters
        : [],
    };
  }
  return state;
};

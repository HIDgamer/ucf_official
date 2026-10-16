/**
 * @file
 */
import { createUuid } from 'common/uuid';

import { DEFAULT_HIGHLIGHT_SOUND } from './constants';

export const createHighlightSetting = (obj?: Record<string, any>) => ({
  id: createUuid(),
  enabled: true,
  highlightText: '',
  highlightColor: '#ffdd44',
  highlightWholeMessage: true,
  matchWord: false,
  matchCase: false,
  playSound: false,
  soundFile: DEFAULT_HIGHLIGHT_SOUND,
  soundVolume: 0.5,
  jobFilter: '',
  characterFilter: [] as string[],
  ...obj,
});

export const createDefaultHighlightSetting = (obj?: Record<string, any>) =>
  createHighlightSetting({
    id: 'default',
    ...obj,
  });

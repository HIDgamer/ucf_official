/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

export const SETTINGS_TABS = [
  {
    id: 'general',
    name: 'General',
  },

  {
    id: 'textHighlight',
    name: 'Text Highlights',
  },
  {
    id: 'chatPage',
    name: 'Chat Tabs',
  },
];

export const FONTS_DISABLED = 'Default';

export const FONTS = [
  FONTS_DISABLED,
  'Verdana',
  'Arial',
  'Arial Black',
  'Comic Sans MS',
  'Impact',
  'Lucida Sans Unicode',
  'Tahoma',
  'Trebuchet MS',
  'Courier New',
  'Lucida Console',
];

export const MAX_HIGHLIGHT_SETTINGS = 10;

export const DEFAULT_HIGHLIGHT_SOUND = 'sound/misc/highlight_sounds/Beep.ogg';

export const HIGHLIGHT_SOUNDS = [
  { label: 'Beep', value: DEFAULT_HIGHLIGHT_SOUND },
];

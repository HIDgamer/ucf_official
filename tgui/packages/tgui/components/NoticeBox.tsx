/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

import { type BooleanLike, classes } from 'common/react';

import { Box, type BoxProps } from './Box';

type Props = ExclusiveProps & BoxProps;

/** You MUST use only one or none */
type NoticeType = 'info' | 'success' | 'warning' | 'danger';

type None = {
  [K in NoticeType]?: undefined;
};

type ExclusiveProps =
  | None
  | (Omit<None, 'info'> & {
      info: BooleanLike;
    })
  | (Omit<None, 'success'> & {
      success: BooleanLike;
    })
  | (Omit<None, 'warning'> & {
      warning: BooleanLike;
    })
  | (Omit<None, 'danger'> & {
      danger: BooleanLike;
    });

export function NoticeBox(props: Props) {
  const { className, color, info, success, warning, danger, ...rest } = props;

  return (
    <Box
      className={classes([
        'NoticeBox',
        color && 'NoticeBox--color--' + color,
        info && 'NoticeBox--type--info',
        success && 'NoticeBox--type--success',
        warning && 'NoticeBox--type--warning',
        danger && 'NoticeBox--type--danger',
        className,
      ])}
      {...rest}
    />
  );
}

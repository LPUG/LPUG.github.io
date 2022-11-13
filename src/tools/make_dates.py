#!/usr/bin/env python
# coding: utf-8
"""Make dates on second Tuesday of the month for full year"""


import datetime
import sys


def second_tuesday(year, month):
    """Find the second Tuesday in a month."""
    date = datetime.date(year, month, 1)
    seen = 0
    day = datetime.timedelta(days=1)
    while True:
        date += day
        if date.weekday() == 1:
            seen += 1
        if seen == 2:
            return date


def make_dates(year):
    """Make list of second Tuesdays of `year`."""
    return [second_tuesday(year, month) for month in range(1, 13)]


def show_date_table(year, comment_out=True):
    """Print out a table with all second Tuesdays of `year`.

    `comment_out` commennts out all lines with `#` so it does not show
    up in markdown.
    """
    comment = '# ' if comment_out else ''
    for date in make_dates(year):
        print(f'{comment}{date:%d.%m.%Y} | TBD |')


def main(year=None):
    """Show table of second Tuesdays for `year`.

    `year` needs to be supplied via command line if `None`.
    """
    if year is None:
        try:
            year = int(sys.argv[1])
        except (IndexError, ValueError):
            print('Must specify year as command first line argument.')
            return
    show_date_table(year)


if __name__ == '__main__':
    main()

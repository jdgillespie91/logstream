from freezegun import freeze_time

from logstream import logstream


@freeze_time('2016-01-01 00:00:00')
def test_pretty_format_date():
    assert logstream.format_datetime() == '2016-01-01 00:00:00'

from datetime import datetime
from time import sleep


def format_datetime():
    """Return a pretty formatted Datetime."""
    return datetime.now().replace(microsecond=0).isoformat(sep=' ')


def main():  # pragma: no cover
    """Entrypoint invoked via a console script."""
    try:
        while True:
            print(format_datetime())
            sleep(1)
    except KeyboardInterrupt:
        pass


if __name__ == '__main__':  # pragma: no cover
    main()

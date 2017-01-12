import os
import re
from setuptools import setup

README = open(os.path.join(os.path.dirname(__file__), 'README.rst')).read()

with open('logstream/__init__.py', 'r') as f:
    version = re.search(r'^__version__\s*=\s*[\'"]([^\'"]*)[\'"]',
                        f.read(), re.MULTILINE).group(1)

setup(
    name='logstream',
    version=version,
    packages=('logstream',),
    description='Log to stdout... simply.',
    long_description=README,
    author='Jake Gillespie',
    author_email='jdgillespie91@gmail.com',
    zip_safe=True,
    classifiers=[
        'Development Status :: 3 - Alpha',
        'Intended Audience :: Developers',
        'Topic :: Software Development',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.5',
    ],
)

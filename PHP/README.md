# Parrot Refactoring Kata

This is the PHP version of the Parrot Refactoring Kata. The project is fully functional, with a full test suite. The objective of this Kata is improve the code. The tests do not normally need to be changed.

## Installation

The project uses:

- PHP 7.2+
- [Composer](https://getcomposer.org)


Recommended:
- [Git](https://git-scm.com/downloads)


Clone the repository

```sh
git clone https://github.com/emilybache/Parrot-Refactoring-Kata.git
```

Install all the dependencies using composer

```sh
cd php
composer install
```

## Dependencies

The project uses composer to install:

- [PHPUnit](https://phpunit.de/)
- [PHP CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer/wiki)

## Testing

To run the tests:

    composer test

## Code Standard

The starting code has been configure to the [PSR-12](https://www.php-fig.org/psr/psr-12/) code standard. 

To focus to be writing tests, code can be checked against the PSR-12 code standard, using a PHP_CodeSniffer script.

    composer checkcode

To apply possible fixes to PSR-12 standard, using a PHP_CodeSniffer script

    composer fixcode

## Folders

- `src` - Contains the Parrot class and ParrotTypeEnum
- `tests` - Contains the ParrotTest

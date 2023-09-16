## [1.2.1] - September 16, 2023

* Dart 3 is out. Updated environment.

## [1.2.0] - March 4, 2021

* Reverted [Nonce.generate] to using optional parameters and replaced
the [secure] and [seed] parameters with the [random] parameter.

## [1.1.0] - March 3, 2021

* Changed [Nonce.generate]'s optional [length] parameter to a named parameter.

* Add parameter to provide a seed to [Nonce.generate].

* Add option to use a secure random to [Nonce.generate].

* Added the [Nonce.secure] factory constructor.

## [1.0.0] - March 3, 2021

* Migrated to null-safe code.

## [0.2.1] - February 26, 2021

* Added the [key] factory constructor.

## [0.2.0] - February 26, 2021

* Added default and [unique] factory constructors to
construct [Nonce] as an object.

## [0.1.0] - February 6, 2020

* Initial release.

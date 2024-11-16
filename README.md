# MulleFoundation-startup

#### ▶️  Startup code for the MulleFoundation

This static library provides the required `__register_mulle_objc_universe`
function for executables, that link against
[MulleFoundation](//github.com/MulleFoundation/MulleFoundation).



| Release Version                                       | Release Notes
|-------------------------------------------------------|--------------
| ![Mulle kybernetiK tag](https://img.shields.io/github/tag/MulleFoundation/MulleFoundation-startup.svg?branch=release) [![Build Status](https://github.com/MulleFoundation/MulleFoundation-startup/workflows/CI/badge.svg?branch=release)](//github.com/MulleFoundation/MulleFoundation-startup/actions) | [RELEASENOTES](RELEASENOTES.md) |





## Sourcetree

The main raison d'être of MulleFoundation-startup as a
separate library is to bequeath the required dependencies
[mulle-atinit](//github.com/mulle-core/mulle-atinit) and
[mulle-atexit](//github.com/mulle-core/mulle-atexit) for linking the
executable.



## Requirements

|   Requirement         | Release Version  | Description
|-----------------------|------------------|---------------
| [MulleFoundation](https://github.com/MulleFoundation/MulleFoundation) | ![Mulle kybernetiK tag](https://img.shields.io/github/tag/MulleFoundation/MulleFoundation.svg) [![Build Status](https://github.com/MulleFoundation/MulleFoundation/workflows/CI/badge.svg?branch=release)](https://github.com/MulleFoundation/MulleFoundation/actions/workflows/mulle-sde-ci.yml) | 💍 Umbrella library for the MulleFoundation
| [mulle-atinit](https://github.com/mulle-core/mulle-atinit) | ![Mulle kybernetiK tag](https://img.shields.io/github/tag/mulle-core/mulle-atinit.svg) [![Build Status](https://github.com/mulle-core/mulle-atinit/workflows/CI/badge.svg?branch=release)](https://github.com/mulle-core/mulle-atinit/actions/workflows/mulle-sde-ci.yml) | 🤱🏼 Compatibility library for deterministic initializers
| [mulle-atexit](https://github.com/mulle-core/mulle-atexit) | ![Mulle kybernetiK tag](https://img.shields.io/github/tag/mulle-core/mulle-atexit.svg) [![Build Status](https://github.com/mulle-core/mulle-atexit/workflows/CI/badge.svg?branch=release)](https://github.com/mulle-core/mulle-atexit/actions/workflows/mulle-sde-ci.yml) | 👼 Compatibility library to fix atexit
| [mulle-objc-debug](https://github.com/mulle-objc/mulle-objc-debug) | ![Mulle kybernetiK tag](https://img.shields.io/github/tag/mulle-objc/mulle-objc-debug.svg) [![Build Status](https://github.com/mulle-objc/mulle-objc-debug/workflows/CI/badge.svg?branch=release)](https://github.com/mulle-objc/mulle-objc-debug/actions/workflows/mulle-sde-ci.yml) | 🐞 Debug support for the mulle-objc-runtime

### You are here

![Overview](overview.dot.svg)

## Add

Use [mulle-sde](//github.com/mulle-sde) to add MulleFoundation-startup to your project:

``` sh
mulle-sde add github:MulleFoundation/MulleFoundation-startup
```

## Install

Use [mulle-sde](//github.com/mulle-sde) to build and install MulleFoundation-startup and all dependencies:

``` sh
mulle-sde install --prefix /usr/local \
   https://github.com/MulleFoundation/MulleFoundation-startup/archive/latest.tar.gz
```

### Legacy Installation

Install the requirements:

| Requirements                                 | Description
|----------------------------------------------|-----------------------
| [MulleFoundation](https://github.com/MulleFoundation/MulleFoundation)             | 💍 Umbrella library for the MulleFoundation
| [mulle-atinit](https://github.com/mulle-core/mulle-atinit)             | 🤱🏼 Compatibility library for deterministic initializers
| [mulle-atexit](https://github.com/mulle-core/mulle-atexit)             | 👼 Compatibility library to fix atexit
| [mulle-objc-debug](https://github.com/mulle-objc/mulle-objc-debug)             | 🐞 Debug support for the mulle-objc-runtime

Download the latest [tar](https://github.com/MulleFoundation/MulleFoundation-startup/archive/refs/tags/latest.tar.gz) or [zip](https://github.com/MulleFoundation/MulleFoundation-startup/archive/refs/tags/latest.zip) archive and unpack it.

Install **MulleFoundation-startup** into `/usr/local` with [cmake](https://cmake.org):

``` sh
cmake -B build \
      -DCMAKE_INSTALL_PREFIX=/usr/local \
      -DCMAKE_PREFIX_PATH=/usr/local \
      -DCMAKE_BUILD_TYPE=Release &&
cmake --build build --config Release &&
cmake --install build --config Release
```

## Author

[Nat!](https://mulle-kybernetik.com/weblog) for Mulle kybernetiK  



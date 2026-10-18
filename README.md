# MulleFoundation-startup

#### ▶️  Startup code for the MulleFoundation

This static library provides the required `__register_mulle_objc_universe`
function for executables, that link against
[MulleFoundation](//github.com/MulleFoundation/MulleFoundation).



| Release Version                                       | Release Notes  | AI Documentation
|-------------------------------------------------------|----------------|---------------
| ![Mulle kybernetiK tag](https://img.shields.io/github/tag/MulleFoundation/MulleFoundation-startup.svg) [![Build Status](https://github.com/MulleFoundation/MulleFoundation-startup/workflows/CI/badge.svg)](//github.com/MulleFoundation/MulleFoundation-startup/actions) | [RELEASENOTES](RELEASENOTES.md) | [DeepWiki for MulleFoundation-startup](https://deepwiki.com/MulleFoundation/MulleFoundation-startup)




## Documentation & Guides

* [API Summary](asset/dox/api/toc)



## Sourcetree

The main raison d'être of MulleFoundation-startup as a
separate library is to bequeath the required dependencies
[mulle-atinit](//github.com/mulle-core/mulle-atinit) and
[mulle-atexit](//github.com/mulle-core/mulle-atexit) for linking the
executable.



## Requirements

|   Requirement         | Release Version  | Description
|-----------------------|------------------|---------------
| [mulle-objc-cc](https://github.com/mulle-cc/mulle-objc-cc) | ![Mulle kybernetiK tag](https://img.shields.io/github/tag/mulle-cc/mulle-objc-cc.svg) [![Build Status](https://github.com/mulle-cc/mulle-objc-cc/workflows/CI/badge.svg?branch=release)](https://github.com/mulle-cc/mulle-objc-cc/actions/workflows/mulle-sde-ci.yml) | 
| [MulleFoundation](https://github.com/MulleFoundation/MulleFoundation) | ![Mulle kybernetiK tag](https://img.shields.io/github/tag/MulleFoundation/MulleFoundation.svg) [![Build Status](https://github.com/MulleFoundation/MulleFoundation/workflows/CI/badge.svg?branch=release)](https://github.com/MulleFoundation/MulleFoundation/actions/workflows/mulle-sde-ci.yml) | 🧱 MulleFoundation amalgamates Foundations projects

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

### Manual Installation

Install the requirements:

| Requirements                                 | Description
|----------------------------------------------|-----------------------
| [mulle-objc-cc](https://github.com/mulle-cc/mulle-objc-cc)             | 
| [MulleFoundation](https://github.com/MulleFoundation/MulleFoundation)             | 🧱 MulleFoundation amalgamates Foundations projects

Download the latest [tar](https://github.com/MulleFoundation/MulleFoundation-startup/archive/refs/tags/latest.tar.gz) or [zip](https://github.com/MulleFoundation/MulleFoundation-startup/archive/refs/tags/latest.zip) archive and unpack it.

Install **MulleFoundation-startup** into `/usr/local` with [cmake](https://cmake.org):

``` sh
PREFIX_DIR="/usr/local"
cmake -B build                               \
      -DMULLE_SDK_PATH="${PREFIX_DIR}"       \
      -DCMAKE_INSTALL_PREFIX="${PREFIX_DIR}" \
      -DCMAKE_PREFIX_PATH="${PREFIX_DIR}"    \
      -DCMAKE_BUILD_TYPE=Release &&
cmake --build build --config Release &&
cmake --install build --config Release
```

## Author

[Nat!](https://mulle-kybernetik.com/weblog) for Mulle kybernetiK  



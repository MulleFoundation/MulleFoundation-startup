### 0.21.1



* correct documented bootstrap entry point from `MulleFoundationBang` to `MulleObjCStandardFoundationBang`
* update startup hook include path to ``<MulleObjCStandardFoundation/mulle-foundation-startup-private.inc>``
* describe `MulleFoundation` as the amalgamation of the Foundations projects it initializes




* import the MulleObjC umbrella before the private headers, so base types and macros are declared before use
* run universe initialization through MulleObjCStandardFoundationBang instead of the removed MulleFoundationBang
* declare the dependency as MulleFoundation-all-load so the atinit/atexit constructors are force-linked

## 0.21.0


feature: install stacktrace callback during MulleFoundation startup

* exceptions and runtime errors now produce stack traces via the mulle-stacktrace callback
* link target pulls in mulle-stacktrace as a dependency


### 0.20.9

Various small improvements

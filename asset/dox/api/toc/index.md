# MulleFoundation-startup Library Documentation for AI
<!-- Keywords: startup, runtime, initialization, objective-c, executable, stacktrace, static -->
## 1. Introduction & Purpose

**MulleFoundation-startup** is a static library providing the startup code for
the MulleFoundation. When an executable links against
[MulleFoundation](https://github.com/MulleFoundation/MulleFoundation), this
library supplies the required `__register_mulle_objc_universe` function (via a
runtime-universe startup hook).

The single source file, `src/MulleFoundation-startup.m`, runs **before
`main()`** and performs the following one-time initialization:

- Applies default values to the ObjC universe configuration via
  `mulle_foundation_universeconfiguration_set_defaults`.
- Calls `MulleFoundationBang` to initialize the MulleFoundation universe
  (classes, protocols, and functions become usable).
- Registers a stacktrace callback on the ObjC universe so that exceptions and
  runtime errors produce stack traces (added in 0.21.0).

It is a dependency-wiring library: its main raison d'être is to bequeath the
linked dependencies (`mulle-atinit`, `mulle-atexit`, and now
`mulle-stacktrace`) to the final executable.

## 2. Key Concepts & Design Philosophy

### Zero Public API
MulleFoundation-startup exports **no public classes, functions, or types**.
The only user interaction is linking it into an executable. All functionality
is initialization side effects. There are no headers to include and no test
directory; the build system (`mulle-sde`) links it automatically for
executables that import `<MulleFoundation/MulleFoundation.h>`.

### Static Only
The library must be built static. `CMakeLists.txt` emits a fatal error if
`BUILD_SHARED_LIBS` is set:

```cmake
if( BUILD_SHARED_LIBS)
   message( FATAL_ERROR "Startup library must be built static")
endif()
```

### Startup Hook Mechanism
The startup function `bang` is wired into the ObjC runtime universe startup
sequence through the private include
`<MulleFoundation/mulle-foundation-startup-private.inc>` (owned by
MulleFoundation). This gives the library its `__register_mulle_objc_universe`
entry point without exposing any public API of its own.

### Stacktrace Callback (since 0.21.0)
During startup, the library calls the MulleObjCRuntime function
`mulle_objc_universe_set_stacktrace_callback` with the `mulle-stacktrace`
callback `mulle_stacktrace_once`. This makes runtime errors and crashes within
MulleFoundation-using executables print stack traces.

## 3. Core API & Data Structures

There is no public API to copy from headers because the project ships no
public header files. The following is declared inside
`src/MulleFoundation-startup.m`.

### Version Macro

- **`MULLE_FOUNDATION__STARTUP_VERSION`**
  - Encoding of the library version, defined as:
    `((0UL << 20) | (21 << 8) | 0)` (i.e. version 0.21.0).

### Internal Startup Hook (`bang`)

- **Purpose:** Initializes the MulleFoundation universe during program
  startup. Statically declared; invoked via the runtime universe startup
  mechanism provided by `mulle-foundation-startup-private.inc`.
- **Steps in order:**
  1. `mulle_foundation_universeconfiguration_set_defaults( &config)` — fills a
     `struct _mulle_objc_universeconfiguration` with the default universe
     configuration.
  2. `MulleFoundationBang( universe, allocator, &config)` — performs the actual
     MulleFoundation bootstrap.
  3. `mulle_objc_universe_set_stacktrace_callback( universe, mulle_stacktrace_once)`
     — installs the stacktrace-once callback for subsequent diagnostics.

### Runtime Function Consumed (from MulleObjCRuntime)

Declared verbatim in the source as a forward declaration:

```c
MULLE_OBJC_RUNTIME_GLOBAL
void
   mulle_objc_universe_set_stacktrace_callback(
      struct _mulle_objc_universe *universe,
      void (*callback)( FILE *fp));
```

- Sets `callback` as the stacktrace producer for `universe`; invoked once
  during startup with `mulle_stacktrace_once`.

## 4. Performance Characteristics

- **Startup cost:** One-time, bounded work executed before `main()`. It
  configures defaults, runs the MulleFoundation bang sequence, and installs a
  callback. No measurable steady-state overhead.
- **Memory:** No persistent allocations owned by this library; all resources
  belong to the MulleFoundation universe.
- **Concurrency:** Startup runs single-threaded before `main()`, so there is
  no thread-safety concern for this code. The resulting universe is
  thread-safe as provided by MulleFoundation.
- The library itself adds no data structures or runtime paths beyond the ping
  of the startup sequence; performance characteristics are dominated by the
  linked MulleFoundation and mulle-stacktrace dependencies.

## 5. AI Usage Recommendations & Patterns

### Best Practices
- Link the executable against `MulleFoundation-startup` **instead of linking
  the MulleFoundation libraries directly**. The startup hook is required for
  correct universe registration.
- Let `mulle-sde`/CMake handle the linking automatically; do not hand-edit the
  link targets.
- Import `<MulleFoundation/MulleFoundation.h>` in application code; all classes
  and functions are fully usable immediately in `main()` and in `+load`-style
  runtime hooks.

### Common Pitfalls
- Linking only MulleFoundation without `MulleFoundation-startup` may result in
  a missing `__register_mulle_objc_universe` symbol at link time, or an
  uninitialized universe at runtime.
- Do not link this static library into other shared libraries; it is an
  executable startup component and is intentionally rejected as a shared
  library by its own CMake configuration.
- Do not call internal startup functions (e.g. `bang`,
  `MulleFoundationBang`) yourself; they run automatically and must run exactly
  once with a proper universe.

## 6. Integration Examples

Code style: 3-space indent, Allman braces, `return( expr);`, no dot-syntax in
Objective-C.

### Example 1: Minimal Executable Using MulleFoundation

```objc
#import <MulleFoundation/MulleFoundation.h>

int   main( int argc, char *argv[])
{
   NSAutoreleasePool   *pool;

   pool = [[NSAutoreleasePool alloc] init];   // only allowed inside main
   // MulleFoundation-startup has already run:
   // - universe configuration set up
   // - MulleFoundationBang executed
   // - stacktrace callback installed

   [pool release];
   return( 0);
}
```

### Example 2: Verify Runtime Error Produce Stack Traces

Because `mullet` (the MulleFoundation test runner / CLI tooling) links
`MulleFoundation-startup`, runtime errors in executables built this way are
reported with stack traces:

```objc
#import <MulleFoundation/MulleFoundation.h>

int   main( int argc, char *argv[])
{
   NSAutoreleasePool   *pool;
   NSArray             *array;

   pool  = [[NSAutoreleasePool alloc] init];    // outer pool (main only)
   array = [NSArray arrayWithObject:@"Hello"];  // +instance factory

   // this raises an exception; the installed stacktrace callback
   // prints the stack before the runtime error propagates
   NSLog( @"%@", [array objectAtIndex:99]);

   [pool release];
   return( 0);
}
```

### Example 3: Adding the Dependency to a mulle-sde Project

```sh
mulle-sde add github:MulleFoundation/MulleFoundation-startup
```

## 7. Dependencies

Direct `mulle-sde` dependencies (from `.mulle/etc/sourcetree/config` and
`clib.json`):

- `MulleFoundation` (the umlbrella bootstrap it initializes)
- `mulle-stacktrace` (provides `mulle_stacktrace_once`, the installed
  stacktrace callback — since 0.21.0)

The library also bequeaths the linker dependencies for the final executable:
`mulle-atinit` and `mulle-atexit`.
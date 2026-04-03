# MulleFoundation-startup Library Documentation for AI

## 1. Introduction & Purpose

**MulleFoundation-startup** is a minimal wrapper that provides automatic initialization of MulleFoundation when linked into an application. It ensures all MulleFoundation framework components are properly initialized before `main()` is called.

This library exists to:
- Automatically invoke MulleFoundation startup code via constructor functions
- Ensure proper initialization order of all MulleFoundation subsystems  
- Provide a single link target that handles all MulleFoundation initialization
- Support applications using `#import <MulleFoundation/MulleFoundation.h>` directly

Most applications built with mulle-sde automatically link MulleFoundation-startup via their build configuration. It does not export any public API; it's purely for initialization side effects.

## 2. Key Concepts & Design Philosophy

### Automatic Initialization via Constructors
This library uses constructor functions (code executed before `main()`) to initialize MulleFoundation. This happens transparently without requiring explicit initialization calls in application code.

### Dependency Initialization Order
MulleFoundation has multiple component libraries with dependency relationships:
1. ObjC runtime (MulleObjC) initializes first
2. Base types and collections initialize next
3. Mid-level components (Calendar, Math, etc.)
4. High-level components (OS, Regex, etc.)
5. Framework integration and customization

MulleFoundation-startup enforces this initialization order automatically.

### Zero Public API
This library provides no classes, functions, or types for public use. Linking against it is the only user interaction; all functionality is initialization side effects.

## 3. Core API & Data Structures

### No Public API
MulleFoundation-startup exports no public functions, classes, or constants. Its entire purpose is startup sequence execution.

### Automatic Behavior

**At Build Time:**
- Link applications against MulleFoundation-startup
- Modern mulle-sde projects handle this automatically

**At Runtime:**
- Before `main()` executes, all MulleFoundation initialization happens
- By `main()` entry, all classes, protocols, and functions are ready
- No manual initialization code needed

**Application Code Pattern:**
```objc
#import <MulleFoundation/MulleFoundation.h>

int main(int argc, char *argv[]) {
    @autoreleasepool {
        // MulleFoundation is fully initialized
        NSString *str = @"Ready!";
        NSLog(@"%@", str);
        return 0;
    }
}
```

## 4. Performance Characteristics

### Startup Overhead
- Adds ~50-100ms initialization time before `main()` starts
- Includes loading all MulleFoundation component libraries
- One-time cost at application startup

### Memory
- No persistent overhead beyond MulleFoundation memory footprint
- Initialization data structures freed after startup

---

## 5. AI Usage Recommendations & Patterns

### Best Practices
- Always link applications against MulleFoundation-startup (not MulleFoundation directly)
- Let mulle-sde build system handle linking automatically
- Never manually invoke Foundation initialization functions

### Common Pitfalls
- Linking only MulleFoundation without MulleFoundation-startup may fail to initialize
- Don't attempt to call startup functions; they're designed to run automatically
- Never link MulleFoundation-startup into libraries; only use in applications

---

## 6. Integration Examples

### Example: Standard Application Build

Modern mulle-sde build systems handle this. For reference:

```bash
# When building an executable
mulle-sde build

# mulle-sde automatically handles linking MulleFoundation-startup
```

### Example: Application Code

```objc
#import <MulleFoundation/MulleFoundation.h>

int main(int argc, char *argv[]) {
    @autoreleasepool {
        // All MulleFoundation classes immediately available
        NSArray *items = @[@"Hello", @"MulleFoundation"];
        NSLog(@"Items: %@", items);
        return 0;
    }
}
```

---

## 7. Dependencies

**MulleFoundation-startup** depends on:
- **MulleFoundation** - Provides all functionality to initialize
- All transitive dependencies of MulleFoundation

This library ensures proper initialization of all dependencies before application code executes.

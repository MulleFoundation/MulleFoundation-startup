//
//  Foundation.m
//  MulleFoundation
//
//  Created by Nat! on 04.04.16.
//  Copyright © 2016 Mulle kybernetiK. All rights reserved.
//
#define _GNU_SOURCE

#import <MulleFoundation/MulleFoundation.h>

#import <MulleFoundation/private/mulle-foundation-startup-private.inc>

#define MULLE_FOUNDATION_STARTUP_VERSION  ((0 << 20) | (19 << 8) | 0)


static void   bang( struct _mulle_objc_universe *universe,
                    struct mulle_allocator *allocator,
                    void *userinfo)
{
   struct _mulle_objc_universeconfiguration   config;

   memcpy( &config,
           mulle_objc_global_get_default_universeconfiguration(),
           sizeof( config));

   MulleFoundationBang( universe, allocator, &config);
}

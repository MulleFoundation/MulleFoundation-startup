//
//  Foundation.m
//  MulleFoundation
//
//  Created by Nat! on 04.04.16.
//  Copyright © 2016 Mulle kybernetiK. All rights reserved.
//
#define _GNU_SOURCE

#import <MulleFoundation/MulleFoundation.h>

#import <MulleFoundation/mulle-foundation-startup-private.inc>

#define MULLE_FOUNDATION_STARTUP_VERSION  ((0 << 20) | (20 << 8) | 3)


static void   bang( struct _mulle_objc_universe *universe,
                    struct mulle_allocator *allocator,
                    void *userinfo)
{
   struct _mulle_objc_universeconfiguration   config;

   mulle_foundation_universeconfiguration_set_defaults( &config);
   MulleFoundationBang( universe, allocator, &config);
}

//
//  WebP.h
//  webp Framework
//
//  Created by C.W. Betts on 10/21/19.
//  Copyright © 2019 planetmutlu. All rights reserved.
//

#ifndef WebP_h
#define WebP_h

#include <TargetConditionals.h>
#include <WebPMac/CGImage_WebP.h>
#ifdef __OBJC__
#if defined(TARGET_OS_OSX) && TARGET_OS_OSX
#import <WebPMac/TSSTWebPImageRep.h>
#import <WebPMac/NSImage_WebP.h>
#else
#import <WebPMac/UIImage_WebP.h>
#endif
#endif

#endif /* WebP_h */

//
//  TSSTWebPImageRep.h
//  Simple Comic
//
//  Created by C.W. Betts on 10/20/19.
//  Copyright © 2019 Dancing Tortoise Software. All rights reserved.
//

#include <TargetConditionals.h>
#if defined(TARGET_OS_OSX) && TARGET_OS_OSX

#import <Cocoa/Cocoa.h>

#ifndef WEBPMacExport
#define WEBPMacExport __attribute__((visibility("default")))
#endif

NS_ASSUME_NONNULL_BEGIN

/*!
 *	@abstract Simple \c NSImageRep for WebP images.
 *	@discussion Limitations: No amimation support. Cannot access base WebP data. Cannot access
 *	raw pixels.
 */
WEBPMacExport
@interface TSSTWebPImageRep : NSImageRep
- (nullable instancetype)initWithData:(NSData *)data;
+ (nullable instancetype)imageRepWithContentsOfFile:(NSString *)filename;
+ (nullable instancetype)imageRepWithContentsOfURL:(NSURL *)url;
@end

NS_ASSUME_NONNULL_END

#endif

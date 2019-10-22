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

NS_ASSUME_NONNULL_BEGIN

__attribute__ ((visibility ("default")))
@interface TSSTWebPImageRep : NSImageRep
- (nullable instancetype)initWithData:(NSData *)data;
@end

NS_ASSUME_NONNULL_END

#endif

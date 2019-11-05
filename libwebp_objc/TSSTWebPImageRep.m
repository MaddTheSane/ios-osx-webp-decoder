//
//  TSSTWebPImageRep.m
//  Simple Comic
//
//  Created by C.W. Betts on 10/20/19.
//  Copyright © 2019 Dancing Tortoise Software. All rights reserved.
//

#import "TSSTWebPImageRep.h"
#if defined(TARGET_OS_OSX) && TARGET_OS_OSX
#import "CGImage_WebP.h"
#include "decode.h"

@implementation TSSTWebPImageRep {
	CGImageRef imageRef;
}

+ (NSArray<NSString *> *)imageUnfilteredTypes
{
	static NSArray *utis;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		utis = @[@"public.webp"];
	});
	return utis;
}

+ (BOOL)canInitWithData:(NSData *)data
{
	return WebPGetInfo(data.bytes, data.length, NULL, NULL) != 0;
}

- (nullable instancetype)initWithData:(NSData *)data
{
	CGImageRef ref = CGImageFromWebPData((__bridge CFDataRef)(data));
	if (ref == NULL) {
		return nil;
	}
	if (self = [super init]) {
		imageRef = ref;
		/*
		 @property (getter=isOpaque) BOOL opaque;
		 */
		self.colorSpaceName = NSCalibratedRGBColorSpace;
		self.pixelsHigh = CGImageGetHeight(ref);
		self.pixelsWide = CGImageGetWidth(ref);
		self.bitsPerSample = CGImageGetBitsPerComponent(ref);
		self.size = NSMakeSize(CGImageGetWidth(ref), CGImageGetHeight(ref));
		self.alpha = YES;
	}
	return self;
}

+ (nullable instancetype)imageRepWithData:(NSData *)data
{
	return [[self alloc] initWithData:data];
}

- (void)dealloc
{
	CGImageRelease(imageRef);
}

+ (id)imageRepWithContentsOfFile:(NSString *)filename
{
	NSData *aDat = [NSData dataWithContentsOfFile:filename];
	if (aDat == nil) {
		return nil;
	}
	return [self imageRepWithData:aDat];
}

+ (id)imageRepWithContentsOfURL:(NSURL *)url
{
	NSData *aDat = [NSData dataWithContentsOfURL:url];
	if (aDat == nil) {
		return nil;
	}
	return [self imageRepWithData:aDat];
}

- (BOOL)draw
{
	CGContextRef ourRef = NSGraphicsContext.currentContext.CGContext;
	CGContextDrawImage(ourRef, CGRectMake(0, 0, self.size.width, self.size.height), imageRef);
	return YES;
}

@end

#endif

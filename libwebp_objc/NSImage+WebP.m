/* @file NSImage+WebP.h
 * @brief WebP loader for NSImage
 *
 * @version 1.0
 * @author Johannes Schriewer <hallo@dunkelstern.de>
 * @date 2014-07-10
 */

#import "decode.h"
#import "NSImage+WebP.h"
#import "CGImage+WebP.h"

#if defined(TARGET_OS_OSX) && TARGET_OS_OSX

@implementation NSImage (WebP)

+ (instancetype)imageWithWebPNamed:(NSString *)name {
    NSString *filename = [[NSBundle mainBundle] pathForResource:name ofType:@"webp"];
    return [self imageWithWebPFile:filename];
}

+ (instancetype)imageWithWebPFile:(NSString *)path {
    if (![[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:nil]) {
        return nil;
    }

    NSData *imageData = [NSData dataWithContentsOfFile:path];

    CGImageRef imageRef = CGImageFromWebPData((__bridge CFDataRef)(imageData));
    NSBitmapImageRep *imgRep = [[NSBitmapImageRep alloc] initWithCGImage:imageRef];
    NSImage *image = [[NSImage alloc] initWithSize:imgRep.size];
    [image addRepresentation:imgRep];
    CGImageRelease(imageRef);

    return image;
}

@end

#endif

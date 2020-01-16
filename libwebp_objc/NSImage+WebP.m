/* @file NSImage+WebP.h
 * @brief WebP loader for NSImage
 *
 * @version 1.0
 * @author Johannes Schriewer <hallo@dunkelstern.de>
 * @date 2014-07-10
 */

#import "decode.h"
#import "NSImage_WebP.h"
#import "CGImage_WebP.h"
#import "TSSTWebPImageRep.h"

#if defined(TARGET_OS_OSX) && TARGET_OS_OSX

@implementation NSImage (WebP)

+ (instancetype)imageWithWebPNamed:(NSString *)name {
    NSDataAsset *asset = [[NSDataAsset alloc] initWithName:name];
    if (asset && [asset.typeIdentifier isEqualToString:@"public.webp"]) {
        NSData *assetData = asset.data;
        NSImageRep *rep = [[TSSTWebPImageRep alloc] initWithData:assetData];
        NSImage *image = [[NSImage alloc] initWithSize:rep.size];
        [image addRepresentation:rep];
        image.name = name;
        return image;
    }
    NSString *filename = [[NSBundle mainBundle] pathForResource:name ofType:@"webp"];
    NSString *filenameX2 = [[NSBundle mainBundle] pathForResource:[name stringByAppendingString:@"@2x"] ofType:@"webp"];
    if (filenameX2) {
        NSImageRep *x1, *x2;
        x1 = [TSSTWebPImageRep imageRepWithContentsOfFile:filename];
        x2 = [TSSTWebPImageRep imageRepWithContentsOfFile:filenameX2];
        NSImage *image = [[NSImage alloc] initWithSize:x1.size];
        [image addRepresentation:x1];
        x2.size = x1.size;
        [image addRepresentation:x2];
        image.name = name;
        return image;
    }
    return [self imageWithWebPFile:filename];
}

+ (instancetype)imageWithWebPFile:(NSString *)path {
    if (![[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:nil]) {
        return nil;
    }

    NSData *imageData = [NSData dataWithContentsOfFile:path];

    TSSTWebPImageRep *imgRep = [[TSSTWebPImageRep alloc] initWithData:imageData];
    if (!imgRep) {
        return nil;
    }
    NSImage *image = [[NSImage alloc] initWithSize:imgRep.size];
    [image addRepresentation:imgRep];

    return image;
}

@end

#endif

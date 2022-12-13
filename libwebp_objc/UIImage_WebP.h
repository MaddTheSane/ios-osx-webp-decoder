/* @file UIImage+WebP.h
 * @brief WebP loader for UIImage
 *
 * @version 1.0
 * @author Johannes Schriewer <hallo@dunkelstern.de>
 * @date 2014-07-10
 */

#include <TargetConditionals.h>
#if TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR || TARGET_OS_TV || TARGET_OS_MACCATALYST

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (WebP)

/** @brief load image by name, extension is assumed to be "webp" and location is in the main bundle
 *
 *  @note if there is a @2x version of an image and the main screen is a retina screen this version
 *        will be loaded, modifiers like '~ipad' or '~iphone' do not work currently.
 *  @param name the name of the image to load
 *  @returns new @c UIImage containing the decoded webp image
 */
+ (nullable UIImage*)imageWithWebPNamed:(NSString *)name;

@end

NS_ASSUME_NONNULL_END

#endif

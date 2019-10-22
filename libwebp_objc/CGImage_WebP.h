/* @file CGImage+WebP.h
 * @brief WebP loader for CGImage
 *
 * @version 1.0
 * @author Johannes Schriewer <hallo@dunkelstern.de>
 * @date 2014-07-10
 */

#import <Foundation/Foundation.h>
#include <CoreGraphics/CoreGraphics.h>

#define WEBPMacExport __attribute__((visibility("default")))

/*! @brief load WebP image data and create a CGImage from it
 *
 * @param data data to decode
 * @returns @c CGImage with decoded data or NULL, result has to be freed with @c CGImageRelease()
 */
WEBPMacExport CGImageRef _Nullable CGImageFromWebPData(CFDataRef _Nonnull data) CF_RETURNS_RETAINED;


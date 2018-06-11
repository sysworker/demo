//
//  IdeaDef.h
//  Idea
//
//  Created by Harry on 14-6-29.
//  Copyright (c) 2014年 Harry. All rights reserved.
//
//  Mail:iidioter@gmail.com
//  TEL :+(86)18668032582


#ifndef __IDEA_IDEADDEF_H__
#define __IDEA_IDEADDEF_H__

#include <stdlib.h>

#if __has_feature(objc_arc)
#  define __objc_arc__
#endif /* __has_feature(objc_arc) */




#if defined(__cplusplus)

#  define BEGIN_DECLS                              extern "C"{
#  define END_DECLS                                          }

#  define BEGIN_NAMESPACE(name)                    namespace name    {
#  define END_NAMESPACE(name)                                        }
#  define USE_NAMESPACE(name)                      using namespace name;

#else

#  define BEGIN_DECLS
#  define END_DECLS

#endif /* __cplusplus */

#define CAST(type, p)                              ((type)(p))
#define LOCAL                                      static inline


#define IsInvalid                                  (YES)




#define I_FUNCTION                                 __PRETTY_FUNCTION__


#ifndef __STRING
#  define __STRING(STR)                            (#STR)
#endif /* __STRING */


#pragma mark const info


#define SCREEN_RECT                                [[UIScreen mainScreen] bounds]
#define SCREEN_SIZE                                [[UIScreen mainScreen] bounds].size

#define GOLDEN_SECTION(x)                          ((x) * 0.61803398875f)
#define GOLDEN_SECTION_2(x)                        ((x) * 0.30901699438f)
#define GOLDEN_SECTION_4(x)                        ((x) * 0.15450849719f)

#define INVERTED_GOLDEN_SECTION(x)                 ((x) * 0.38196601125f)
#define INVERTED_GOLDEN_SECTION_2(x)               ((x) * 0.19098300563f)
#define INVERTED_GOLDEN_SECTION_4(x)               ((x) * 0.09549150281f)

#define RADIAN_2_ANGLE(x)                          ((x) * 180.0f / M_PI)
#define ANGLE_2_RADIAN(x)                          ((x) * M_PI / 180.0f)



#define UIViewAutoresizingAll                      (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin)
#define UIViewAutoresizingVertical                 (UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleRightMargin)
#define UIViewAutoresizingHorizontal               (UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleBottomMargin)
#define UIViewAutoresizingSize                     (UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight)


#ifndef RGB
#define RGB(r,g,b)                                 [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#endif /* RGB */

#ifndef RGBA
#define RGBA(r,g,b,a)                              [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#endif /* RGBA */

#define NS_STR(key, comment)                       NSLocalizedString((key), (comment))

#define APP_STR(key)                               NS_STR((key), nil)/*中英文标准*/

#define IS_MAINTHREAD()                            ([NSThread isMainThread])
#define WEAK_SELF                                  __weak __typeof__(self)

#define IS_PAD                                     (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


#define UIAViewAnimationDefaultDuraton             (0.2f)


#pragma mark __objc_arc__


#ifdef __objc_arc__
#  define __AUTORELEASE(x)                   (x);
#  define __RELEASE(x)                       (x) = nil;
#  define __RETAIN(x)                        (x)
#  define __SUPER_DEALLOC                    objc_removeAssociatedObjects(self);
#  define __dispatch_release(x)              (x) = nil;
#else
#  define __RETAIN(x)                        [(x) retain];
#  define __AUTORELEASE(x)                   [(x) autorelease];
#  define __RELEASE(x)                       if (nil != (x))               \
                                             {                             \
                                                [(x) release];             \
                                                (x) = nil;                 \
                                             }
#  define __SUPER_DEALLOC                    objc_removeAssociatedObjects(self);[super dealloc];
#  define __dispatch_release(x)              dispatch_release((x))
#endif



#define __VIEW_RELEASE(x)                    if (nil != (x))               \
                                             {                             \
                                                [(x) removeFromSuperview]; \
                                             }                             \
                                             __RELEASE(x);


#define __cast(type, x)                      (type)(x)
#define __bridge_cast(type, x)               (__bridge type)(x)





#define IOS6_TOP_MARGIN(view)                                              \
                                             if (![UIDevice iOS6Later])    \
                                             {                             \
                                                [view setFrame:CGRectMake(self.view.frame.origin.x, 0, self.view.frame.size.width, self.view.frame.size.height)];\
                                             } /* End if () */



#define UI_PERFORM_SELECTOR(SELF, SEL, OBJ, DONE)  \
                                             {                                               \
                                                [(SELF) performSelectorOnMainThread:(SEL)    \
                                                                         withObject:(OBJ)    \
                                                                      waitUntilDone:(DONE)]; \
                                             }

#define UI_PERFORM_SELECTOR_ERR(SELF, SEL, OBJ, DONE)  \
                                             {                                               \
                                                [(SELF) performSelectorOnMainThread:(SEL)    \
                                                                         withObject:(OBJ)    \
                                                                      waitUntilDone:(DONE)]; \
                                                nErr = noErr;                                \
                                             }

#define BG_PERFORM_SELECTOR(SELF, SEL, OBJ)  \
                                             {                                               \
                                                [(SELF) performSelectorInBackground:(SEL)    \
                                                                         withObject:OBJ];    \
                                             }

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
//#  define IDEA_DRAW_AT_POINT(text, point, font)                         [(text) length] > 0 ? [(text) drawAtPoint:(point) withAttributes:@{NSFontAttributeName:(font)}] : CGSizeZero;
//#  define IDEA_MULTILINE_DRAW_AT_POINT(text, point, width, font, mode)
#  define IDEA_TEXTSIZE(text, font)                                     [(text) length] > 0 ? [(text) sizeWithAttributes:@{NSFontAttributeName:(font)}] : CGSizeZero;
#  define IDEA_MULTILINE_TEXTSIZE(text, font, maxSize, mode)            [(text) length] > 0 ? [(text) \
                                                                        boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) \
                                                                        attributes:@{NSFontAttributeName:font} context:nil].size : CGSizeZero;
#else
//#  define IDEA_DRAW_AT_POINT(text, point, font)                [(text) length] > 0 ? [(text) drawAtPoint:(point) withFont:(font)}] : CGSizeZero;
//#  define IDEA_MULTILINE_DRAW_AT_POINT(text, point, width, font, mode)  [(text) length] > 0 ? [(text) drawAtPoint:(point) forWidth:(width) withFont:(font)} lineBreakMode:(mode)] : CGSizeZero;
#  define IDEA_TEXTSIZE(text, font)                                     [(text) length] > 0 ? [(text) sizeWithFont:(font)] : CGSizeZero;
#  define IDEA_MULTILINE_TEXTSIZE(text, font, maxSize, mode)            [(text) length] > 0 ? [(text) sizeWithFont:font constrainedToSize:maxSize lineBreakMode:mode] : CGSizeZero;
#endif



#ifdef __objc_arc__
#  define AFHTTP_RELEASE(HTTP_MANAGER)       if(HTTP_MANAGER){[(HTTP_MANAGER).operationQueue cancelAllOperations];(HTTP_MANAGER)=nil;}
#  define NS_ARRAY_RELEASE(ARRAY)            if(ARRAY){[(ARRAY) removeAllObjects];(ARRAY)= nil;}
#else
#  define AFHTTP_RELEASE(HTTP_MANAGER)       if((HTTP_MANAGER)){[(HTTP_MANAGER).operationQueue cancelAllOperations];[(HTTP_MANAGER) release];(HTTP_MANAGER)=nil;}
#  define NS_ARRAY_RELEASE(ARRAY)            if(ARRAY){[(ARRAY) removeAllObjects];[(ARRAY) release];(ARRAY)= nil;}
#endif

#define BEGIN_AUTO_RELEASE_POOL                                         @autoreleasepool{
#define END_AUTO_RELEASE_POOL                                           }


#ifndef nonnull
#  define nonnull
#endif

#ifndef nullable
#  define nullable
#endif

#ifndef __nonnull
#  define __nonnull
#endif

/************************************************************************/
/*                                                                      */
/************************************************************************/

#undef  __ON__
#define __ON__                                                          (1)

#undef  __OFF__
#define __OFF__                                                         (0)

#undef  __AUTO__

#if defined(DEBUG) && (1 == DEBUG)
#  define __AUTO__                                                      __ON__
#else
#  define __AUTO__                                                      __OFF__
#endif


//#warning log flag...

#ifdef TARGET_OS_IPHONE
#  if defined(DEBUG) && (1 == DEBUG)
#     define __Debug__                                                  __ON__
#  else
#     define __Debug__                                                  __OFF__
#  endif
#else
#  define __Debug__                                                     __AUTO__
#endif




#endif /* __IDEA_IDEADDEF_H__ */













//
//  IdeaDebug.h
//  Idea
//
//  Created by Harry on 14-6-29.
//  Copyright (c) 2014年 Harry. All rights reserved.
//
//  Mail:iidioter@gmail.com
//  TEL :+(86)18668032582

#ifndef __IDEA_IDEADEBUG_H__
#define __IDEA_IDEADEBUG_H__

#import "IdeaDef.h"
#import "IdeaLog.h"

/************************************************************************/
/*                                                                      */
/************************************************************************/

#if __Debug__
#  define __DebugInfo__                            __AUTO__
#  define __DebugDebug__                           __AUTO__
#  define __DebugError__                           __AUTO__
#  define __DebugFunc__                            __AUTO__
#  define __HWDecodeDebug__                        __OFF__
#  define __HWDecodeDump__                         __OFF__
#else
#  define __DebugInfo__                            __OFF__
#  define __DebugDebug__                           __OFF__
#  define __DebugError__                           __OFF__
#  define __DebugFunc__                            __OFF__
#  define __HWDecodeDebug__                        __OFF__
#  define __HWDecodeDump__                         __OFF__
#endif

#if __Debug__
#  define __ColorDebug__                           __OFF__
#else
#  define __ColorDebug__                           __OFF__
#endif /* !__Debug__ */

#if __HWDecodeDebug__
#  define LogVideo(x)                              LoggerDebug x
#  define LogAudio(x)                              LoggerDebug x
#  define LogStream(x)                             LoggerDebug x
#  define __av_strerror(x)                         av_strerror x
#else
#  define LogVideo(x)
#  define LogAudio(x)
#  define LogStream(x)
#  define __av_strerror(x)
#endif /* __HWDecodeDebug__ */

/************************************************************************/
/*                                                                      */
/************************************************************************/

#if __DebugInfo__
#  define __LoggerInfo(x)                          LoggerInfo   x
#else
#  define __LoggerInfo(x)
#endif

#if __DebugDebug__
#  define __LoggerDebug(x)                         LoggerDebug  x
#else
#  define __LoggerDebug(x)
#endif

#if __DebugFunc__
#  define __LogFunc(x)                             LoggerDebug x
#else
#  define __LogFunc(x)
#endif

#if __DebugError__
#  define __LoggerFatal(x)                         LoggerFatal  x
#  define __LoggerError(x)                         LoggerError  x
#  define __LoggerWarn(x)                          LoggerWarn   x
#else
#  define __LoggerFatal(x)
#  define __LoggerError(x)
#  define __LoggerWarn(x)
#endif

#define LogInfo                                    __LoggerInfo
#define LogDebug                                   __LoggerDebug
#define LogFatal                                   __LoggerFatal
#define LogError                                   __LoggerError
#define LogWarn                                    __LoggerWarn

#define LogFunc                                    __LogFunc

/************************************************************************/
/*                                                                      */
/************************************************************************/

#define  ThrowIf(_Return, _Description)                                                                                 \
                                             {                                                                          \
                                                if (noErr != (_Return))                                               \
                                                {                                                                       \
                                                   LogDebug((@"%s :: %s err!", I_FUNCTION, __STRING(_Description)));    \
                                                   break;                                                               \
                                                } /*End if () */                                                        \
                                             }

#define  ThrowNull(_Args, _Return, _ErrCode, _Description)                                                              \
                                             {                                                                          \
                                                if (!(_Args))                                                           \
                                                {                                                                       \
                                                   LogDebug((@"%s :: %s err!", I_FUNCTION, __STRING(_Description)));    \
                                                   (_Return) = (_ErrCode);                                              \
                                                   break;                                                               \
                                                } /*End if () */                                                        \
                                             }

#define ThrowParam(_Args, _Return, _ErrCode)                                                                            \
                                             {                                                                          \
                                                if (IsInvalid == (_Args))                                               \
                                                {                                                                       \
                                                   LogDebug((@"%s - %s is invalid!", I_FUNCTION, __STRING(_Args)));     \
                                                   (_Return) = (_ErrCode);                                              \
                                                   break;                                                               \
                                                } /*End if () */                                                        \
                                             }

#define  __Function_Start()                  LogDebug(((@"%s - Enter!") , I_FUNCTION));


#define  __Function_End(_Return)                                                                                        \
                                             {                                                                          \
                                                if (noErr == (_Return))                                               \
                                                {                                                                       \
                                                   LogDebug(((@"%s - Leave with Success!"), I_FUNCTION));               \
                                                } /*End if () */                                                        \
                                                else                                                                    \
                                                {                                                                       \
                                                   LogDebug(((@"%s - Leave with Error : %d(0x%08x)!"), I_FUNCTION, (int)_Return, (int)_Return));\
                                                } /*End else () */                                                      \
                                             }


#if __Debug__

#  define FunctionStart                      __Function_Start
#  define FunctionEnd                        __Function_End

#else

#  define FunctionStart()
#  define FunctionEnd(x)

#endif /* __DebugInfo__ */

#define __TRY                                FunctionStart();           \
                                             do {


#define __CATCH(nErr)                        nErr = noErr;              \
                                             } while (0);               \
                                             FunctionEnd(nErr);


#define __LOG_FUNCTION                       LogFunc((@"%s :", __PRETTY_FUNCTION__))

#define __LOG_RECT(rc)                       LogDebug((@"%s : RECT : (%d, %d, %d, %d)", __STRING(rc), (int)((rc).origin.x), (int)((rc).origin.y), (int)((rc).size.width), (int)((rc).size.height)))
#define __LOG_SIZE(sz)                       LogDebug((@"%s : SIZE : (%d, %d)", __STRING(sz), (int)((sz).width), (int)((sz).height)))
#define __LOG_POINT(pt)                      LogDebug((@"%s : POINT: (%d, %d)", __STRING(pt), (int)((pt).x), (int)((pt).y)))




#endif /* __IDEA_IDEADEBUG_H__ */






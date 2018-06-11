//
//  IdeaLog.h
//  Idea
//
//  Created by Harry on 14-6-29.
//  Copyright (c) 2014年 Harry. All rights reserved.
//
//  Mail:iidioter@gmail.com
//  TEL :+(86)18668032582


#ifndef __IDEA_IDEADLOG_H__
#define __IDEA_IDEADLOG_H__


#import "IdeaDef.h"

#define LOG_BUG_SIZE                                  (1024 * 1)


//#define ZeroMemory(Destination,Length)                memset((Destination),0,(Length))

typedef enum
{
   LogLevelFatal = 0,
   LogLevelError,
   LogLevelWarn,
   LogLevelInfo,
   LogLevelDebug
   
} LogLevel;

BEGIN_DECLS

void  LoggerFatal (NSString *aFormat, ...);
void  LoggerError (NSString *aFormat, ...);
void  LoggerWarn  (NSString *aFormat, ...);
void  LoggerInfo  (NSString *aFormat, ...);
void  LoggerDebug (NSString *aFormat, ...);

END_DECLS


#endif /* __IDEA_IDEADLOG_H__ */


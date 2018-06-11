//
//  IdeaLog.h
//  Hunter
//
//  Created by Arvin on 2016/10/08.
//  Copyright © 2016年 August. All rights reserved.
//


#import  <sys/time.h>

#import "IdeaLog.h"


static inline const char* __LogLevelToString(LogLevel _eLevel)
{
    switch (_eLevel)
    {
        case LogLevelFatal:
            return ("Fatal");
        case LogLevelError:
            return ("Error");
        case LogLevelWarn:
            return (" Warn");
        case LogLevelInfo:
            return (" Info");
        case LogLevelDebug:
            return ("Debug");
        default:
            break;
            
    } /* End switch (); */
    
    return ("Unknown");
}



static inline void __Log(LogLevel _eLevel, const char *_cpszMsg)
{
    printf("%s :: %s\n", __LogLevelToString(_eLevel), _cpszMsg);
    
    return;
}



void LoggerFatal(NSString *aFormat, ...)
{
    va_list      args;
    NSString    *szMSG   = nil;
    
    va_start (args, aFormat);
    szMSG = [[NSString alloc] initWithFormat:aFormat  arguments:args];
    va_end (args);
    
    __Log(LogLevelFatal, [szMSG UTF8String]);
    
    __RELEASE(szMSG);
    
    return;
}




void LoggerError(NSString *aFormat, ...)
{
    va_list      args;
    NSString    *szMSG   = nil;
    
    va_start (args, aFormat);
    szMSG = [[NSString alloc] initWithFormat:aFormat  arguments:args];
    va_end (args);
    
    __Log(LogLevelError, [szMSG UTF8String]);
    
    __RELEASE(szMSG);
    
    return;
}



void LoggerWarn(NSString *aFormat, ...)
{
    va_list      args;
    NSString    *szMSG   = nil;
    
    va_start (args, aFormat);
    szMSG = [[NSString alloc] initWithFormat:aFormat  arguments:args];
    va_end (args);
    
    __Log(LogLevelWarn, [szMSG UTF8String]);
    
    __RELEASE(szMSG);
    
    return;
}

void LoggerInfo(NSString *aFormat, ...)
{
    va_list      args;
    NSString    *szMSG   = nil;
    
    va_start (args, aFormat);
    szMSG = [[NSString alloc] initWithFormat:aFormat  arguments:args];
    va_end (args);
    
    __Log(LogLevelInfo, [szMSG UTF8String]);
    
    __RELEASE(szMSG);
    
    return;
}


void LoggerDebug(NSString *aFormat, ...)
{
    va_list      args;
    NSString    *szMSG   = nil;
    
    va_start (args, aFormat);
    szMSG = [[NSString alloc] initWithFormat:aFormat  arguments:args];
    va_end (args);
    
    __Log(LogLevelDebug, [szMSG UTF8String]);
    
    __RELEASE(szMSG);
    
    return;
}

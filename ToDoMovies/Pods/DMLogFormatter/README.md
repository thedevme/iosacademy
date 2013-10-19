DMLogFormatter a CocoaLumberjack Log Formatter
==============================================

We are using the `DMLogFormatter` in our projects to clean up the console output. Feel free to use it in your project. It should be used with the [CocoaLumberjack](https://github.com/robbiehanson/CocoaLumberjack) framework.

##Usage

Like this:

    #import "DMLogFormatter.h"

    - (void)initLogger
    {
        DDTTYLogger *ttyLogger = [DDTTYLogger sharedInstance];
        ttyLogger.logFormatter = [[DMLogFormatter alloc] init];
        [DDLog addLogger:ttyLogger];
    }

##License

Under MIT Licence.

---

Your devmob team.
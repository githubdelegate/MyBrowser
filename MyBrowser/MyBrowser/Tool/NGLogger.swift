//
//  NGLogger.swift
//  MyBrowser
//
//  Created by zhangyun on 15/12/14.
//  Copyright © 2015年 zhangyun. All rights reserved.
//

import Foundation
import CocoaLumberjack

class NGLogger {
    
   internal static func setup() {
        DDLog.addLogger(DDASLLogger.sharedInstance())
        DDLog.addLogger(DDTTYLogger.sharedInstance())
 
    /*
     * You may occasionally notice that colors don't work when you're debugging your app in the simulator. And you may also notice that your colors never work when debugging on the actual device. How do I fix it so it works everywhere, all the time?
     * In Xcode bring up the Scheme Editor (Product -> Edit Scheme...)
     * Select "Run" (on the left), and then the "Arguments" tab
     * Add a new Environment Variable named "XcodeColors", with a value of "YES"
     * see https://github.com/CocoaLumberjack/CocoaLumberjack/blob/master/Documentation/XcodeColors.md for detail.
     */
    DDTTYLogger.sharedInstance().colorsEnabled = true
    DDTTYLogger.sharedInstance().setForegroundColor(UIColor.redColor(), backgroundColor: nil, forFlag: LOG_FLAG_ERROR) 
    DDTTYLogger.sharedInstance().setForegroundColor(UIColor.cyanColor(), backgroundColor: nil, forFlag: LOG_FLAG_DEBUG)
    }
    
}
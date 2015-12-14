//
//  NGAppSetting.swift
//  MyBrowser
//
//  Created by zhangyun on 15/12/14.
//  Copyright © 2015年 zhangyun. All rights reserved.
//

import Foundation

let NGAppSettingsThemeChangedNotification = "PRAppSettingsThemeChangedNotification"
let kPrefetchKey = "prefetch"
let kImageWIFIOnlyKey = "imageWIFIOnly"
let kFontSizeKey = "fontSize"
let kNightModeKey = "nightModeFixed"
let kFastScrollKey = "fastScroll"
let kAutoStarCommentedKey = "autostar"
let kInclineSummaryKey = "inclineSummary"


// 字体大小
enum NGArticleFontSize:Int{
    case Small = 1
    case Normal
    case Big
}

class NGAppSetting {
    var _useDefaults:NSUserDefaults?
    var prefetchOnWIFI:Bool
    var imageWIFIOnly:Bool
    var fontSize:NGArticleFontSize
    var nightMode:Bool
    var articleFastScroll:Bool
    var autoStarCommented:Bool
    var inclineSummary:Bool
    
    class var sharedSetting: NGAppSetting{
        struct Static {
            static var onceToken : dispatch_once_t = 0
            static var instance : NGAppSetting? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = NGAppSetting()
        }
        return Static.instance!
    }
    
    
    init(){
        _useDefaults = NSUserDefaults.standardUserDefaults()
        _useDefaults?.setBool(true, forKey: kPrefetchKey)
        _useDefaults?.setBool(false, forKey: kImageWIFIOnlyKey)
        _useDefaults?.setInteger(NGArticleFontSize.Normal.rawValue, forKey: kFontSizeKey)
        _useDefaults?.setBool(false, forKey: kNightModeKey)
        _useDefaults?.setBool(true, forKey: kFastScrollKey)
        _useDefaults?.setBool(true, forKey: kAutoStarCommentedKey)
        _useDefaults?.setBool(false, forKey: kInclineSummaryKey)
        
        prefetchOnWIFI = (_useDefaults?.boolForKey(kPrefetchKey))!
        imageWIFIOnly = (_useDefaults?.boolForKey(kImageWIFIOnlyKey))!
        
        
        let tmp = (_useDefaults?.integerForKey(kFontSizeKey))!
        fontSize = NGArticleFontSize(rawValue: tmp)!
        nightMode = (_useDefaults?.boolForKey(kNightModeKey))!
        articleFastScroll = (_useDefaults?.boolForKey(kFastScrollKey))!
        autoStarCommented = (_useDefaults?.boolForKey(kAutoStarCommentedKey))!
        inclineSummary = (_useDefaults?.boolForKey(kInclineSummaryKey))!
    }
    
    func setPrefetchOnWIFI(_prefetchOnWIFI:Bool){
        prefetchOnWIFI = _prefetchOnWIFI
        _useDefaults?.setBool(prefetchOnWIFI, forKey: kPrefetchKey)
    }
    
    func setImageWIFIOnly(_imageWIFIOnly:Bool){
        imageWIFIOnly = _imageWIFIOnly
        _useDefaults?.setBool(imageWIFIOnly, forKey: kImageWIFIOnlyKey)
    }
    
    
    func setFontSize(_fontSize:NGArticleFontSize){
        fontSize = _fontSize
        _useDefaults?.setInteger(fontSize.rawValue, forKey: kFontSizeKey)
    }
    
    func setNightMode(_nightMode:Bool){
        nightMode = _nightMode
        _useDefaults?.setBool(nightMode, forKey: kNightModeKey)
        NSNotificationCenter.defaultCenter().postNotificationName(NGAppSettingsThemeChangedNotification, object: self)
    }
    
    
    func setArticleFastScroll(_articleFastScroll:Bool){
        articleFastScroll = _articleFastScroll
        _useDefaults?.setBool(articleFastScroll, forKey: kFastScrollKey)
    }
    
    func setAutoStarCommented( _autoStarCommented:Bool){
        autoStarCommented = _autoStarCommented
        _useDefaults?.setBool(autoStarCommented, forKey: kAutoStarCommentedKey)
    }
    
    func setInclineSummary(_inclineSummary:Bool){
        inclineSummary = _inclineSummary
        _useDefaults?.setBool(inclineSummary, forKey: kInclineSummaryKey)
        
    }
    
    
}
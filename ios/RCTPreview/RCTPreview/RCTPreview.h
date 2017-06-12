//
//  RCTPreview.h
//  RCTPreview
//
//  Created by WeiGuangcheng on 6/12/17.
//  Copyright © 2017 Liaoyuan. All rights reserved.
//

#if __has_include("RCTBridgeModule.h")
    #import "RCTBridgeModule.h"
#else
    #import <React/RCTBridgeModule.h>
#endif

#import <Foundation/Foundation.h>
#import <QuickLook/QuickLook.h>
@interface RCTPreview : NSObject <RCTBridgeModule,QLPreviewControllerDataSource,QLPreviewControllerDelegate>

@property(nonatomic, readwrite) NSURL *fileUrl;

@end

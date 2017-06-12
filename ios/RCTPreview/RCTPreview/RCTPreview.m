//
//  RCTPreview.m
//  RCTPreview
//
//  Created by WeiGuangcheng on 6/12/17.
//  Copyright © 2017 Liaoyuan. All rights reserved.
//

#import "RCTPreview.h"


@implementation RCTPreview

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(preview:(NSString *)fileURL resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    NSURL *url = [NSURL fileURLWithPath:fileURL];
    self.fileUrl = url;
    
    if (![QLPreviewController canPreviewItem:(id<QLPreviewItem>)url]) {
        NSError *error = [[NSError alloc] init];
        reject(@"cannot_preview", @"Can not preview", error);
    }
    QLPreviewController *qlVc = [[QLPreviewController alloc] init];
    qlVc.navigationItem.title=@"预览";
    qlVc.delegate = self;
    qlVc.dataSource = self;
    qlVc.navigationController.navigationBar.userInteractionEnabled = YES;
    qlVc.view.userInteractionEnabled = YES;
    UIViewController *root = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
//        qlVc.view.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    [root presentViewController:qlVc animated:YES completion:^{
        resolve(fileURL);
    }];
}

#pragma mark - QLPreviewController 代理方法
- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller{
    return 1;
}

- (id<QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index{
    return self.fileUrl;
}

@end

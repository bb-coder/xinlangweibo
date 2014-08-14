//
//  UIImage+FullScreen.m
//  xinlangweibo
//
//  Created by bb_coder on 14-8-15.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "UIImage+FullScreen.h"

@implementation UIImage (FullScreen)
+(UIImage *)fullImageWithNamged:(NSString *)imageName
{
    NSString * extension = [imageName pathExtension];
    NSLog(@"%@",extension);
    imageName = [imageName stringByDeletingPathExtension];
    NSLog(@"%@",imageName);
    if ([UIScreen mainScreen].bounds.size.height == 568) {
        imageName = [imageName stringByAppendingString:@"-568h@2x"];
    }
    imageName = [imageName stringByAppendingString:@"."];
    
    return [UIImage imageNamed:[imageName stringByAppendingString:extension]];
}
@end

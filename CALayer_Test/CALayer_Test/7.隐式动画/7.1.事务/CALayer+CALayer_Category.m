//
//  CALayer+CALayer_Category.m
//  CALayer_Test
//
//  Created by 吴昊 on 2017/12/24.
//  Copyright © 2017年 吴昊. All rights reserved.
//

#import "CALayer+CALayer_Category.h"
#import <UIKit/UIKit.h>
@implementation CALayer (CALayer_Category)
- (void)setBorderColorWithUIColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
}
@end

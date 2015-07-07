//
//  FunctionalCoreImage.m
//  FilterLibrary
//
//  Created by Sumit Gera on 07/07/15.
//  Copyright (c) 2015 SumitGera. All rights reserved.
//

#import "FunctionalCoreImage.h"
#import <UIKit/UIKit.h>

@implementation FunctionalCoreImage


+ (CIImage *) blurWithRadius: (CGFloat) radius andImage: (CIImage *) image {
    
    CIFilter * filter = [CIFilter filterWithName:@"CIGaussianBlur"
                             withInputParameters:@{
                                                   @"inputImage" : image,
                                                   @"inputRadius": [NSNumber numberWithFloat:radius]
                                                   }];
    return filter.outputImage;
}

@end
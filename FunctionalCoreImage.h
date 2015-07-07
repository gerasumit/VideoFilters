//
//  FunctionalCoreImage.h
//  FilterLibrary
//
//  Created by Sumit Gera on 07/07/15.
//  Copyright (c) 2015 SumitGera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FunctionalCoreImage : NSObject

+ (CIImage *) blurWithRadius: (CGFloat) radius andImage: (CIImage *) image;

@end

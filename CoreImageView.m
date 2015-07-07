//
//  CoreImageView.m
//  FilterLibrary
//
//  Created by Sumit Gera on 07/07/15.
//  Copyright (c) 2015 SumitGera. All rights reserved.
//

#import "CoreImageView.h"
#import <GLKit/GLKit.h>

@interface CoreImageView () {
    CIContext * coreImageContext;
}

@end

@implementation CoreImageView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        EAGLContext * context = [[EAGLContext alloc]initWithAPI:kEAGLRenderingAPIOpenGLES2];
        self = [self initWithFrame:frame context:context];
    }
    
    return self;
}

- (instancetype) initWithFrame:(CGRect)frame context:(EAGLContext *)context {
    self = [super initWithFrame:frame context:context];
    
    if (self) {
        coreImageContext = [CIContext contextWithEAGLContext:context];
        [self setEnableSetNeedsDisplay:false];
    }
    
    return self;
}

- (void) drawRect:(CGRect)rect {
    CGFloat scale = 1.0;
    CGRect destRect = CGRectApplyAffineTransform(self.bounds, CGAffineTransformMakeScale(scale, scale));
    [coreImageContext drawImage:self.image inRect:destRect fromRect:self.image.extent];
}

@end
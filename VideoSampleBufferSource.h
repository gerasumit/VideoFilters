//
//  VideoSampleBufferSource.h
//  FilterLibrary
//
//  Created by Sumit Gera on 07/07/15.
//  Copyright (c) 2015 SumitGera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

@interface VideoSampleBufferSource : NSObject

- (instancetype) initWithURL: (NSURL *) URL withCallbackBlock:(void (^)(CVPixelBufferRef buffer))callbackBlock;


@end

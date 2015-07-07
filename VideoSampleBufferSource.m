//
//  VideoSampleBufferSource.m
//  FilterLibrary
//
//  Created by Sumit Gera on 07/07/15.
//  Copyright (c) 2015 SumitGera. All rights reserved.
//

#import "VideoSampleBufferSource.h"
#import <AVFoundation/AVFoundation.h>
#import <GLKit/GLKit.h>

typedef void(^ConsumerCallback)(CVPixelBufferRef buffer);

@interface VideoSampleBufferSource () {
    CADisplayLink * displayLink;
    AVPlayerItemVideoOutput * videoOutput;
    AVPlayer * player;
    NSDictionary * pixelBufferDict;
    ConsumerCallback consumer;
}

@end

@implementation VideoSampleBufferSource

- (instancetype) init {
    self = [super init];
    
    if (self) {
        displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkDidRefreshWithLink:)];
        pixelBufferDict = [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange] forKey:(id)kCVPixelBufferPixelFormatTypeKey];
    }
    
    return self;
}

- (instancetype) initWithURL: (NSURL *) URL withCallbackBlock:(void (^)(CVPixelBufferRef buffer))callbackBlock {
    self = [self init];
    
    if (self) {
        player = [AVPlayer playerWithURL:URL];
        videoOutput = [[AVPlayerItemVideoOutput alloc] initWithPixelBufferAttributes:pixelBufferDict];
        [player.currentItem addOutput:videoOutput];
        [self start];
        consumer = callbackBlock;
    }
    
    [player play];
    return self;
}

- (void) start {
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void) displayLinkDidRefreshWithLink: (CADisplayLink *) link {
    CMTime itemTime = [videoOutput itemTimeForHostTime:CACurrentMediaTime()];
    if ([videoOutput hasNewPixelBufferForItemTime:itemTime]) {
        CMTime presentationItemTime = kCMTimeZero;
        CVPixelBufferRef pixelBuffer = [videoOutput copyPixelBufferForItemTime:itemTime itemTimeForDisplay:&presentationItemTime];
        consumer(pixelBuffer);
    }
}


@end
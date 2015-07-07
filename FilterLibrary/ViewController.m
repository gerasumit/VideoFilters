//
//  ViewController.m
//  FilterLibrary
//
//  Created by Sumit Gera on 07/07/15.
//  Copyright (c) 2015 SumitGera. All rights reserved.
//

#import "ViewController.h"
#import "CoreImageView.h"
#import "VideoSampleBufferSource.h"
#import "FunctionalCoreImage.h"

@interface ViewController () {
    CoreImageView * coreImageView;
    VideoSampleBufferSource * videoSource;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    coreImageView = [[CoreImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview: coreImageView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated {
    NSURL * url = [[NSBundle mainBundle] URLForResource:@"video" withExtension:@"mp4"];
    videoSource = [[VideoSampleBufferSource alloc] initWithURL:url withCallbackBlock:^(CVPixelBufferRef buffer) {
        CIImage * image = [CIImage imageWithCVPixelBuffer:buffer];
        CIImage * background = [FunctionalCoreImage blurWithRadius:10.0 andImage:image];
        coreImageView.image = background;
    }];
}

@end

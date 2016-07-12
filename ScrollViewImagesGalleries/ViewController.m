//
//  ViewController.m
//  ScrollViewImagesGalleries
//
//  Created by Viviane Chan on 2016-07-11.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

#import "ViewController.h"
#import "detailControllerViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIView *imageContainerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.backgroundColor = [UIColor blackColor];
}

- (void)viewDidLayoutSubviews {
    [self showPictures];
}

-(void) showPictures {
    // create a container to hold our content
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame))];
    [self.scrollView addSubview:containerView];
    self.imageContainerView = containerView;

    
    NSArray *pictureViews = @[[UIImage imageNamed:@"Lighthouse-in-Field.jpg"],[UIImage imageNamed:@"Lighthouse-night.jpg"],[UIImage imageNamed:@"Lighthouse.jpg"] ];
   
    CGFloat xOffset = 0;

    for (UIImage *eachPicture in pictureViews) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(xOffset,0,CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame))];
        [imageView setImage:eachPicture];

        [containerView addSubview:imageView];

        // adjust the xOffset for the next view
        xOffset += CGRectGetWidth(imageView.frame);
        


    }
    
    self.scrollView.contentSize = CGSizeMake(xOffset, CGRectGetHeight(self.scrollView.frame));
    self.scrollView.pagingEnabled = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

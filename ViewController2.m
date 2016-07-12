//
//  ViewController2.m
//  ScrollViewImagesGalleries
//
//  Created by Viviane Chan on 2016-07-11.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

#import "ViewController2.h"
#import "DetailControllerViewController.h"


@interface ViewController2 () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIView *imageContainerView;
@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;



@end

@implementation ViewController2



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
        imageView.userInteractionEnabled = YES;
        [containerView addSubview:imageView];

        // adjust the xOffset for the next view
        xOffset += CGRectGetWidth(imageView.frame);
     
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
        [imageView addGestureRecognizer:tapGestureRecognizer];
        
        
    }
    
    self.scrollView.contentSize = CGSizeMake(xOffset, CGRectGetHeight(self.scrollView.frame));
    
    self.scrollView.delegate = self;
    
    // You need to set the zoom scales to enable zooming
    self.scrollView.maximumZoomScale = 10;
    self.scrollView.minimumZoomScale = 0.5;

    self.scrollView.pagingEnabled = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    // Return the view you want the scrollview to zoom in and out of
    
        return self.imageContainerView;
}


-(void)tapped:(UITapGestureRecognizer *)recognizer {
     if (recognizer.state == UIGestureRecognizerStateEnded) {
         [self performSegueWithIdentifier:@"showDetail" sender:recognizer.view];
     }
 }

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showDetail"]) {

        UIImageView *pictureToDisplay = (UIImageView*)sender;
        NSLog(@"%@", pictureToDisplay);

        DetailControllerViewController *detailControllerViewController = (DetailControllerViewController *) [segue destinationViewController];
        detailControllerViewController.pictureImage = pictureToDisplay.image;

    }
}

@end

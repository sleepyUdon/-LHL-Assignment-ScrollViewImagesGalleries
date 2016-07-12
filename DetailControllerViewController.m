//
//  DetailControllerViewController.m
//  ScrollViewImagesGalleries
//
//  Created by Viviane Chan on 2016-07-11.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

#import "DetailControllerViewController.h"
#import "ViewController2.h"

@interface DetailControllerViewController ()

@end

@implementation DetailControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *pictureImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 60, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-60)];
    
    [self.view addSubview:pictureImageView];
    [pictureImageView setImage:self.pictureImage];

    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

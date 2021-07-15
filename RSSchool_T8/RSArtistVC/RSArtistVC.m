//
//  RSArtistVC.m
//  RSSchool_T8
//
//  Created by Anna Ershova on 15.07.2021.
//

#import "RSArtistVC.h"
#import "RSSchool_T8-Swift.h"
@interface RSArtistVC ()

@end

@implementation RSArtistVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.state = ASIdle;
    self.view.backgroundColor = [UIColor blueColor];
    self.title = @"Artist";
    [self makeRightBarButtonIntem];
}

- (void)makeRightBarButtonIntem {
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"Drawings" style:UIBarButtonItemStyleDone target:self action:@selector(tapOnRightBarItem)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)tapOnRightBarItem {

}

@end

//
//  RSNavigationVC.m
//  RSSchool_T8
//
//  Created by Anna Ershova on 15.07.2021.
//

#import "RSNavigationVC.h"
@interface RSNavigationVC ()

@end

@implementation RSNavigationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self navigationBarUI];
}

- (void)navigationBarUI {
    self.navigationBar.frame = CGRectMake(0, 0, self.view.frame.size.width, 62);
    self.navigationBar.barTintColor = [UIColor whiteColor];
}

@end

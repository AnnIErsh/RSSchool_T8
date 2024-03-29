//
//  RSArtistVC.h
//  RSSchool_T8
//
//  Created by Anna Ershova on 15.07.2021.
//

#import <UIKit/UIKit.h>
#import "RSArtistState.h"
#import "RSpaletteVCDelegate.h"
#import "RSDrawStateDelegate.h"
#import "RSSchool_T8-Swift.h"
@class RSUIButton;
NS_ASSUME_NONNULL_BEGIN
@interface RSArtistVC : UIViewController <RSpaletteVCDelegate, RSDrawStateDelegate, RSTimerDelegate, RSDrawOnCanvasDelegate>
@property (weak, nonatomic) IBOutlet UIView *canvas;
@property (weak, nonatomic) IBOutlet RSUIButton *openPalette;
@property (weak, nonatomic) IBOutlet RSUIButton *openTimer;
@property (weak, nonatomic) IBOutlet RSUIButton *share;
@property (weak, nonatomic) IBOutlet RSUIButton *draw;
@property (weak, nonatomic) IBOutlet RSUIButton *reset;
@property (weak) NSTimer *time;
@property (nonatomic) RSArtistState state;

@end

NS_ASSUME_NONNULL_END

//
//  ViewController.m
//  faketouch
//
//  Created by Henry Quan on 16/3/21.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *presentButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)onSimulateTouch:(UIButton *)sender {
    CGPoint point = _presentButton.center;
    NSInteger pointId = [PTFakeMetaTouch fakeTouchId:[PTFakeMetaTouch getAvailablePointId] AtPoint:point withTouchPhase:UITouchPhaseBegan];
    [PTFakeMetaTouch fakeTouchId:pointId AtPoint:point withTouchPhase:UITouchPhaseEnded];
}

- (IBAction)onPresent:(UIButton *)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Just an alert" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:ok];

    [self presentViewController:alert animated:true completion:nil];
}

@end

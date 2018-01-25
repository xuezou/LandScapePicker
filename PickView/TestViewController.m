//
//  TestViewController.m
//  PickView
//
//  Created by A$CE on 2018/1/25.
//  Copyright © 2018年 A$CE. All rights reserved.
//
#import "LandScapePicker.h"

#import "TestViewController.h"

@interface TestViewController ()
@property (nonatomic ,strong) LandScapePicker *pickerView;

@property (nonatomic ,strong) UILabel *textLabel;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.textLabel = [[UILabel alloc] init];
    self.textLabel.frame = CGRectMake(20, 400, 200, 40);
    self.textLabel.text = @"Title";
    [self.view addSubview:self.textLabel];
    
    self.pickerView = [[LandScapePicker alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    [self.view addSubview:self.pickerView];
    
    self.pickerView.pTitles = @[@"李元芳",@"狄仁杰",@"安其拉",@"貂蝉"];
    
    __weak typeof(self) weakSelf = self;
    self.pickerView.lspSelected = ^(NSInteger row, NSString *title) {
        weakSelf.textLabel.text = title;
        weakSelf.textLabel.backgroundColor = [UIColor colorWithRed:0.33*row green:1-0.33*row blue:0.1*row alpha:1];
    };
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc
{
    NSLog(@"%s",__FUNCTION__);
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

//
//  ViewController.m
//  DesDemo
//
//  Created by 赵凯 on 2017/8/30.
//  Copyright © 2017年 赵凯. All rights reserved.
//

#import "ViewController.h"
#import "DESManage.h"
#define KEY @"abcd1234"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UILabel *lab2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
- (IBAction)btn1Action:(id)sender {
    
    _lab1.text = [DESManage encryptUseDES:_textField.text key:KEY];
    
    NSLog(@"加密内容 = %@",_textField.text);
    NSLog(@"加密密文 = %@",_lab1.text);
    
}

- (IBAction)btn2Action:(id)sender {
    
    _lab2.text = [DESManage decryptUseDES:_lab1.text key:KEY];

}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [_textField resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

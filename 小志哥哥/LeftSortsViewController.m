//
//  LeftSortsViewController.m
//  LGDeckViewController
//
//  Created by jamie on 15/3/31.
//  Copyright (c) 2015年 Jamie-Ling. All rights reserved.
//

#import "LeftSortsViewController.h"
#import "AppDelegate.h"
#import "ViewController.h"
#import "CommonDefine.h"
#import "ScanningViewController.h"
@interface LeftSortsViewController () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation LeftSortsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor grayColor];
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageview.image = [UIImage imageNamed:@"leftbackiamge"];
    [self.view addSubview:imageview];

    UITableView *tableview = [[UITableView alloc] init];
    self.tableview = tableview;
    tableview.frame = self.view.bounds;
    tableview.dataSource = self;
    tableview.delegate  = self;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identifier = @"Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont systemFontOfSize:20.0f];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"开通会员";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"QQ钱包";
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"扫一扫";
    } else if (indexPath.row == 3) {
        cell.textLabel.text = @"个性装扮";
    } else if (indexPath.row == 4) {
        cell.textLabel.text = @"我的收藏";
    } else if (indexPath.row == 5) {
        cell.textLabel.text = @"我的相册";
    } else if (indexPath.row == 6) {
        cell.textLabel.text = @"我的文件";
    }else if (indexPath.row == 7) {
        cell.textLabel.text = @"退出登录";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   
    if (indexPath.row==0) {
        ViewController *vc=[[ViewController alloc]init];
        vc.hidesBottomBarWhenPushed=YES;
        [self.leftViewHideDelegate.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row==2) {
        ScanningViewController *vc=[[ScanningViewController alloc]init];
        vc.hidesBottomBarWhenPushed=YES;
        [self.leftViewHideDelegate.navigationController pushViewController:vc animated:YES];
        
    }
    else if (indexPath.row==7) {
        

        
      UIAlertController *alertController=  [UIAlertController alertControllerWithTitle:@"提示" message:@"是否要注销当前账号?" preferredStyle:UIAlertControllerStyleAlert];
        NSString *account  = [[NSUserDefaults standardUserDefaults] objectForKey:USER_ACCOUNT];
        NSString *passwored = [[NSUserDefaults standardUserDefaults] objectForKey:USER_PASSWOERD];
        
        [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
            textField.placeholder = @"登录";
            textField.text=account;
            NSLog(@"%@",textField.text);
        }];
        [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
            textField.placeholder = @"密码";
            textField.text=passwored;
            textField.secureTextEntry = YES;
        }];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            NSLog(@"The \"Okay/Cancel\" alert's cancel action occured.");
        }];
        
        UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            
            UITextField *accountF = alertController.textFields.firstObject;
            UITextField *passwordF = alertController.textFields.lastObject;
            
       
            
            if ([passwordF.text isEqualToString:passwored]&&[accountF.text isEqualToString:account]) {
                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                [defaults setBool:NO forKey:@"autoSignIn"];
                [defaults synchronize];
                ViewController *chooseVc = [[ViewController alloc] init];
                UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:chooseVc];
                [UIApplication sharedApplication].keyWindow.rootViewController = nav;
            }
            
            
        }];
        
        // Add the actions.
        [alertController addAction:cancelAction];
        [alertController addAction:otherAction];
 
        [self presentViewController:alertController animated:YES completion:nil];
//        [[[UIAlertView alloc]initWithTitle:@"提示" message:@"是否要注销当前账号?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil] show];
        
        
  
        
    }
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate.LeftSlideVC closeLeftView];//关闭左侧抽屉
  
}

//注销账号
-(void)CancelAccount{
 

}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 130;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableview.bounds.size.width, 180)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}
@end

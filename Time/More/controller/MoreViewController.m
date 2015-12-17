//
//  MoreViewController.m
//  Time
//
//  Created by imac on 15/8/3.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()
@property (weak, nonatomic) IBOutlet UILabel *MBLabel;

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // self.title=@"更多";
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    label.text=@"更多";
    label.textAlignment=NSTextAlignmentCenter;
    label.textColor=[UIColor whiteColor];
    label.font=[UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView=label;

    [self countFileSize];
    
}
-(long long)countFileSize{
    
    //获取当前应用程序的沙盒路径
    NSString *homePath =  NSHomeDirectory();
    NSArray *subFilePath=@[@"/Library/CaChes/com.hackemist.SDWebImageCache.default/"];
    //遍历文件夹
    long long fileSize=0;
    for(NSString *filePath in subFilePath)
    {
        //获取SDWebIage的缓存文件夹路径
        NSString *subFile=[homePath stringByAppendingPathComponent:filePath];
        //创建一个文件管理器 单例
        NSFileManager *fileManager=[NSFileManager defaultManager];
        
        //获取某个路径下所有的文件名
        NSArray *fileNames=[fileManager subpathsOfDirectoryAtPath:subFile error:nil];
        
        for(NSString *fileName in fileNames)
        {
            //拼接文件路径
            NSString *file=[subFile stringByAppendingPathComponent:fileName];
            //根据文件路径 获取文件的相关信息
            NSDictionary *dic=[fileManager attributesOfItemAtPath:file error:nil];
            fileSize +=[dic[NSFileSize] longLongValue];
            
        }
    }
    _MBLabel.text=[NSString stringWithFormat:@"%.2fMB",(CGFloat)fileSize / 1024 / 1024];
    //NSLog(@"%@",homePath);
    return fileSize;
}

-(void)viewWillAppear:(BOOL)animated{
    [self countFileSize];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0){
        //内存清理
        NSString *homePath =  NSHomeDirectory();
        NSArray *subFilePath=@[@"/Library/CaChes/com.hackemist.SDWebImageCache.default/"];
    
        for(NSString *filePath in subFilePath)
        {
            //获取SDWebIage的缓存文件夹路径
            NSString *subFile=[homePath stringByAppendingPathComponent:filePath];
            //创建一个文件管理器 单例
            NSFileManager *fileManager=[NSFileManager defaultManager];
            
            //获取某个路径下所有的文件名
            NSArray *fileNames=[fileManager subpathsOfDirectoryAtPath:subFile error:nil];
            
            for(NSString *fileName in fileNames)
            {
                //拼接文件路径
                NSString *file=[subFile stringByAppendingPathComponent:fileName];
                //删除文件
                [fileManager removeItemAtPath:file error:nil];
                
                
            }
        }
        
        _MBLabel.text=@"余超傻逼";
        //删除文件之后.再次计算程序缓存文件大小
        [self performSelector:@selector(countFileSize) withObject:nil afterDelay:1];
    }
    
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

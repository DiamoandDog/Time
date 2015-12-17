//
//  TopViewController.m
//  Time
//
//  Created by imac on 15/8/3.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "TopViewController.h"
#import "TopCollectionViewCell.h"
#import "Top.h"
#import "DetiailViewController.h"
@interface TopViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    NSMutableArray *_topData;
}

@property (weak, nonatomic) IBOutlet UICollectionView *myCollection;
@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"Top250";
    
    [self _loadData];
}

-(void)_loadData{
    //1.获取文件路劲
    NSString *filePath=[[NSBundle mainBundle]pathForResource:@"top250" ofType:@"json"];
    
    
    //2.读取文件
    NSData *data=[NSData dataWithContentsOfFile:filePath];
    
    
    //3.解析文件
    NSError *error=[[NSError alloc]init];
    NSDictionary *dic= [NSJSONSerialization JSONObjectWithData:data
                                                    options:NSJSONReadingMutableLeaves
                                                      error:&error];
    
    _topData=[[NSMutableArray alloc]init];
    
    
   for(NSDictionary *d in dic[@"subjects"]){
        Top *new= [[Top alloc]initWithDictionary:d ];
        [_topData addObject:new];
    }
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section


{
    
    return _topData.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath


{
    TopCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"TopCell" forIndexPath:indexPath];
    cell.backgroundColor=[UIColor whiteColor];
    cell.top=_topData[indexPath.row];
    
    
    
    return cell;
}


// 单元格被选中  push
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 创建detailViewController
    DetiailViewController *detail = [[DetiailViewController alloc] init];
    detail.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:detail animated:YES];
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

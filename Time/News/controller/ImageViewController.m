//
//  ImageViewController.m
//  Time
//
//  Created by imac on 15/8/5.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "ImageViewController.h"
#import "ImageCollectionViewCell.h"
#import "Images.h"
#import "BigViewController.h"
@interface ImageViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
{
    NSMutableArray *_imageData;
}
@property (weak, nonatomic) IBOutlet UICollectionView *myCollection;
@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"图片新闻";
    [self _loadData];
    
//    [_myCollection registerClass:[ImageCollectionViewCell class] forCellWithReuseIdentifier:@"imageCell"];}
    
    //self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    
}
-(void)_loadData{
    //1.获取文件路劲
    NSString *filePath=[[NSBundle mainBundle]pathForResource:@"image_list" ofType:@"json"];
    
    
    //2.读取文件
    NSData *data=[NSData dataWithContentsOfFile:filePath];
    
    
    //3.解析文件
    NSError *error=[[NSError alloc]init];
    NSArray *array= [NSJSONSerialization JSONObjectWithData:data
                                                       options:NSJSONReadingMutableLeaves
                                                         error:&error];

    _imageData=[[NSMutableArray alloc]init];
    
    
    for(NSDictionary *dic in array){
        NSString *movie=dic[@"image"];
        //NSLog(@"%@",movie);
        [_imageData addObject:movie];
        //NSLog(@"%@",_imageData);
}
   
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section

{

    return _imageData.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath

{
    ImageCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"imageCell" forIndexPath:indexPath];
    cell.backgroundColor=[UIColor whiteColor];
    UIImageView *imageV=[[UIImageView alloc]init];
    [imageV sd_setImageWithURL:_imageData[indexPath.row]];
    cell.backgroundView=imageV;
    //cell.imagee=_imageData[indexPath.row];
    //视图的边框  (圆角的半径)
    cell.layer.cornerRadius = 10;
    //设置边框颜色 UIcolor 转换为 CGColorRef
    cell.layer.borderColor=[[UIColor yellowColor]CGColor];
    //边框的宽度
    cell.layer.borderWidth=3;

    
    return cell;
}
//
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    BigViewController *big=[[BigViewController alloc]init];
    big.imageDataa=_imageData;
    big.imageDataaa = indexPath;
    [self.navigationController pushViewController:big animated:YES];
    
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

   

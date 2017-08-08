//
//  ViewController.m
//  CustomCollectionViewDemo
//
//  Created by iOS开发者 on 2017/2/13.
//  Copyright © 2017年 iOS开发者. All rights reserved.
//

#import "ViewController.h"
#import "MyCollectionViewCell.h"
#import "MyCollectionViewModel.h"

#define minimumLine 80

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong)UICollectionView *collectionV;
@property(nonatomic,strong)NSMutableArray  *collectList;

@end

@implementation ViewController

#pragma mark - 懒加载
- (NSMutableArray *)collectList{
    if (!_collectList) {
        _collectList = [NSMutableArray array];
    }
    return _collectList;
}

- (void)loadData{
    for (int i=0; i<9; i++) {
        MyCollectionViewModel *model = [[MyCollectionViewModel alloc]init];
        model.nameLbl = [NSString stringWithFormat:@"第%d个单元格",i+1];
        [self.collectList addObject:model];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadData];
    [self setupUI];
    
    NSLog(@"修改测试");
}

- (void)setupUI{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake((self.view.frame.size.width - 3*4)/3, minimumLine);
    layout.minimumLineSpacing = 3;//行间距
    layout.minimumInteritemSpacing = 3;//列间距
    layout.sectionInset = UIEdgeInsetsMake(3, 3, 3, 3);//每组的内边距：上、左、下、右
    //集合视图的高
    CGFloat collectionH = minimumLine*3+3*4;
    _collectionV = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 35, self.view.frame.size.width,collectionH) collectionViewLayout:layout];
    _collectionV.delegate = self;
    _collectionV.dataSource = self;
    _collectionV.scrollEnabled = NO;
    _collectionV.showsHorizontalScrollIndicator = NO;
    _collectionV.pagingEnabled = NO;
    _collectionV.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_collectionV];
    
    [_collectionV registerNib:[UINib nibWithNibName:@"MyCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"MyCollectionViewCell"];
    
}

#pragma mark - UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _collectList.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //取出单元格
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCollectionViewCell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor whiteColor];
    MyCollectionViewModel *model = _collectList[indexPath.row];
    cell.model = model;
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
//单元格的选中事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //取出单元格
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCollectionViewCell" forIndexPath:indexPath];
    MyCollectionViewModel *model = _collectList[indexPath.row];
    cell.model = model;
    
    NSLog(@"选中了第%ld个单元格",(long)indexPath.row+1);
    
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
// 设置是否允许取消选中
- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

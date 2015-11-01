//
//  CitysViewController.m
//  GoSport
//
//  Created by imac on 15/9/28.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "CitysViewController.h"
#import "CityModel.h"

@interface CitysViewController ()

@end

@implementation CitysViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"切换城市";
    _spellData = [NSMutableArray array];
    _latestCity = [NSMutableArray array];

    self.view.backgroundColor = [UIColor whiteColor];
    //初始化视图
    [self _initViews];
    //处理数据
    [self dealWithData];
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < 26; i++) {
        char c = 65 + i;
        NSString *str = [NSString stringWithFormat:@"%c",c];
        [arr addObject:str];
    }
    _allCaptail = arr;
    //接受通知
    //应用中任何一个TextField进行编辑时，发出的通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificationChanged:) name:UITextFieldTextDidChangeNotification object:nil];
    
}

#pragma mark -初始化视图
- (void)_initViews
{
    _cityTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _cityTableView.delegate = self;
    _cityTableView.dataSource = self;
    _cityTableView.showsVerticalScrollIndicator = NO;
    _cityTableView.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.1];
    [self.view addSubview:_cityTableView];

    //设置索引的颜色
    _cityTableView.sectionIndexBackgroundColor = [UIColor clearColor];
    _cityTableView.sectionIndexColor = [UIColor darkGrayColor];
    _cityTableView.sectionIndexTrackingBackgroundColor = [UIColor lightGrayColor];
    //创建头视图
    [self createHeaderView];
    
}
#pragma mark -创建头视图
- (void)createHeaderView
{
    headeView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth , 50)];
    _cityTableView.tableHeaderView = headeView;
    
    searchTf = [[UITextField alloc]initWithFrame:CGRectMake((kScreenWidth - 280)/2, 10, 280, 20)];
    searchTf.backgroundColor = [UIColor redColor];
    [headeView addSubview:searchTf];
}
- (void)notificationChanged:(NSNotification *)notification
{
    UITextField *textf = notification.object;
    [self textChange:textf];
}
- (void)textChange:(UITextField *)txf
{
    NSString *text = txf.text;
    if (text.length == 0) {
        self.filterData = self.data;
        [_cityTableView reloadData];
        return;
    }
    //过滤条件
    NSString *p = [NSString stringWithFormat:@"SELF LIKE[c] '*%@*'",text];
    //使用谓词
    NSPredicate *predicate = [NSPredicate predicateWithFormat:p];
    self.filterData = [self.data filteredArrayUsingPredicate:predicate];
    [_cityTableView reloadData];
}
- (void)dealWithData
{
    NSDictionary *jsonDic = [DataService requestDataWithFileName:kCity];
    NSArray *arr = jsonDic[@"data"];
    NSMutableArray *hotCity = [NSMutableArray array];
    NSMutableArray *mArr = [NSMutableArray array];

    //处理数据
    for (NSDictionary *dic in arr) {
        CityModel *cityModel = [[CityModel alloc]initContentWithDic:dic];
        NSString *cityName = cityModel.cityName;
        if ([cityModel.isHot integerValue] == 1) {
            [hotCity addObject:cityName];
        }
        NSString *spell = cityModel.spell;
        [self.spellData addObject:spell];
        [mArr addObject:cityName];
    }
    self.data = mArr;
    self.filterData = self.data;
    self.hotCitys = hotCity;
}
#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    for (int i = 0; i < self.filterData.count; i++) {
        NSString *cityName = self.filterData[i];
        NSString *spell = self.spellData[i];
        NSString *key = [spell substringToIndex:1];
        NSMutableArray *subCity = [dic objectForKey:key];
        if (subCity.count == 0) {
            subCity = [NSMutableArray array];
            [dic setObject:subCity forKey:key];
        }
        [subCity addObject:cityName];
    }
    _allCityDic = dic;
    _subCitys = [dic allKeys];
    _subCitys = [_subCitys sortedArrayUsingSelector:@selector(compare:)];
    return _allCityDic.count + 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section <= 2) {
        return 1;
    }
    NSString *subCity = _subCitys[section - 3];
    NSArray *arr2D = [_allCityDic objectForKey:subCity];
    return arr2D.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section <= 2) {
        UITableViewCell *specialCell = [[UITableViewCell alloc]init];
        specialCell.selectionStyle = UITableViewCellSelectionStyleNone;
        CGFloat btnWidth = (kScreenWidth - 20 * 4)/3;
        if (indexPath.section == 0) {
            UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 30, 30)];
            imgView.image = [UIImage imageNamed:@"location.png"];
            [specialCell.contentView addSubview:imgView];
            locationLabel = [[UILabel alloc]initWithFrame:CGRectMake(imgView.right, 7, btnWidth, 30)];
            NSString *currentCity = [[NSUserDefaults standardUserDefaults] objectForKey:kcurrentCity];
            if (currentCity.length == 0) {
                //
                locationLabel.text = @"暂无";
            }else
            {
                locationLabel.text = currentCity;
            }
            [specialCell.contentView addSubview:locationLabel];
        }else if(indexPath.section == 1)
        {
            NSArray *lastArr = [[NSUserDefaults standardUserDefaults] objectForKey:kLatestCity];
            if (lastArr.count == 0) {
                specialCell.textLabel.text = @"暂无";
            }else
            {
                for (int i = 0; i < lastArr.count; i++){
                    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                    btn.frame = CGRectMake((20 + btnWidth) * (i % 3) + 20, (i /3 ) * 40 + 10, btnWidth, 35);
                    [btn setTitle:lastArr[i] forState:UIControlStateNormal];
                    btn.backgroundColor = [UIColor lightGrayColor];
                    [btn addTarget:self action:@selector(cityBtnClick:) forControlEvents:UIControlEventTouchUpInside];
                    [specialCell.contentView addSubview:btn];
                }
 
            }
        }else if(indexPath.section == 2)
        {
            for (int i = 0; i < _hotCitys.count; i++){
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                btn.frame = CGRectMake((20 + btnWidth) * (i % 3) + 20, (i /3 ) * 40 + 10, btnWidth, 35);
                [btn setTitle:_hotCitys[i] forState:UIControlStateNormal];
                btn.backgroundColor = [UIColor lightGrayColor];
                [btn addTarget:self action:@selector(cityBtnClick:) forControlEvents:UIControlEventTouchUpInside];
                [specialCell.contentView addSubview:btn];
            }
        }
        return specialCell;
    }
    NSString *identifier = @"CityCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.backgroundColor = [UIColor whiteColor];
    }
    NSString *subCity = _subCitys[indexPath.section - 3];
    NSArray *arr2D = [_allCityDic objectForKey:subCity];
    cell.textLabel.text = arr2D[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        return 50;
    }else if (indexPath.section == 2) {
        return 90;
    }
    return 44;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"定位城市";
    }else if(section == 1)
    {
        return @"最近访问的城市";
    }else if(section == 2)
    {
        return @"热门城市";
    }
    NSString *subCity = [_subCitys[section - 3] uppercaseString];
    return subCity;
}
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.subCitys;
}
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    NSInteger i = [self.subCitys indexOfObject:[title lowercaseString]];
    return i;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section < 3) {
        return;
    }
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *title = cell.textLabel.text;
    [self selected:title];
    }
#pragma mark - cityBtnClick
- (void)cityBtnClick:(UIButton *)btn
{
    [self selected:btn.titleLabel.text];
}
- (void)selected:(NSString *)text
{
    NSArray *latestCity = [[NSUserDefaults standardUserDefaults]objectForKey:kLatestCity];
    NSMutableArray *latestCity1 = [NSMutableArray arrayWithArray:latestCity];
    BOOL isTrue = NO;
    for (int i = 0; i < latestCity1.count; i++) {
        if ([text isEqualToString:latestCity1[i]]) {
            isTrue = YES;
            if (i == 0) {
                break;
            }
            [latestCity1 exchangeObjectAtIndex:0 withObjectAtIndex:i];
        }
    }
    if(!isTrue)
    {
        [latestCity1 insertObject:text atIndex:0];
    }
    if (latestCity1.count > 3) {
        [latestCity1 removeLastObject];
    }
    
    latestCity = latestCity1;
    latestCity1 = nil;
    [[NSUserDefaults standardUserDefaults] setObject:latestCity forKey:kLatestCity];
    //返回上一级界面
    [self.navigationController popViewControllerAnimated:YES];

}

@end

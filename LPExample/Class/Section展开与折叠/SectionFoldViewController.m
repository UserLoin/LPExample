

#import "SectionFoldViewController.h"

static const CGFloat SectionHeight = 44.f;
typedef NS_ENUM(NSInteger,SectionFoldType) {
    SectionIsFold = 0, //折叠
    SectionIsUnFold    //展开
};

@interface SectionFoldViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *sectionArray;
@property (nonatomic,strong)NSMutableArray *flagArray;
@end

@implementation SectionFoldViewController

#pragma mark - 懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

#pragma mark - 页面加载
- (void)viewDidLoad {
    [super viewDidLoad];
    [self sp_layoutNavigation];
    [self sp_getNewData];
    [self sp_addSubviews];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 设置navigationItem
- (void)sp_layoutNavigation {
    self.navigationItem.title = @"Section折叠与展开";
}

#pragma mark - 创建tableView
- (void)sp_addSubviews {
    [self.view addSubview:self.tableView];
    self.tableView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
}

#pragma mark - 加载数据
- (void)sp_getNewData {
    _sectionArray = [NSMutableArray array];
    _flagArray  = [NSMutableArray array];
    NSInteger num = 10;
    for (int i = 0; i < num; i ++) {
        NSMutableArray *rowArray = [NSMutableArray array];
        for (int j = 0; j < arc4random()%20 + 1; j ++) {
            [rowArray addObject:[NSString stringWithFormat:@"%d",j]];
        }
        [_sectionArray addObject:rowArray];
        [_flagArray addObject:@(SectionIsFold)];
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _sectionArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *arr = _sectionArray[section];
    return arr.count;}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identify];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld组的第%ld个cell",indexPath.section,indexPath.row];
    cell.clipsToBounds = YES; //这句话很重要 不信你就试试
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [_flagArray[indexPath.section] boolValue] == SectionIsFold ? 0 : SectionHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return SectionHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1.f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *sectionLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor whiteColor];
        label.frame = CGRectMake(0, 0, self.view.frame.size.width, SectionHeight);
        label.textColor = [UIColor redColor];
        label.text = [NSString stringWithFormat:@"组%ld",section];
        label.textAlignment = NSTextAlignmentCenter;
        label.tag = 100 + section;
        label.userInteractionEnabled = YES;
        label;
    });
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sectionClick:)];
    [sectionLabel addGestureRecognizer:tap];
    
    return sectionLabel;
}
- (void)sectionClick:(UITapGestureRecognizer *)tap{
    int index = tap.view.tag % 100;
    
    NSMutableArray *indexArray = [[NSMutableArray alloc]init];
    NSArray *arr = _sectionArray[index];
    for (int i = 0; i < arr.count; i ++) {
        NSIndexPath *path = [NSIndexPath indexPathForRow:i inSection:index];
        [indexArray addObject:path];
    }
    
    // 展开
    // 方法一 通过刷新Rows的方法刷新
    /*
     if ([_flagArray[index] boolValue] == SectionIsFold) {
     _flagArray[index] = @(SectionIsUnFold);
     [_tableView reloadRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationBottom];  //使用下面注释的方法就 注释掉这一句
     } else { //收起
     _flagArray[index] = @(SectionIsFold);
     [_tableView reloadRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationTop]; //使用下面注释的方法就 注释掉这一句
     }
     */
    
    // 方法一简写
    _flagArray[index] = @(![_flagArray[index] boolValue]);
    UITableViewRowAnimation type = [_flagArray[index] boolValue] ? UITableViewRowAnimationBottom : UITableViewRowAnimationTop;
    [_tableView reloadRowsAtIndexPaths:indexArray withRowAnimation: type];
    
    
    /*
     // 方法二 通过刷新Sections的方法刷新
     _flagArray[index] = @(![_flagArray[index] boolValue]);
     NSRange range = NSMakeRange(index, 1);
     NSIndexSet *sectionToReload = [NSIndexSet indexSetWithIndexesInRange:range];
     [_tableView reloadSections:sectionToReload withRowAnimation:UITableViewRowAnimationAutomatic];
     */
}

@end

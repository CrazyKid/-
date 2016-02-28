//
//  TopViewController.h
//  01
//
//  Created by Macx on 15/12/8.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "BaseViewController.h"

@interface TopViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    __weak IBOutlet UICollectionView *_collectionView;
    NSMutableArray *_data;
}
@end

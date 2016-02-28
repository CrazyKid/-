//
//  ImageViewController.h
//  01
//
//  Created by Macx on 15/12/12.
//  Copyright © 2015年 Arthur. All rights reserved.
//

#import "BaseViewController.h"

@interface ImageViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    __weak IBOutlet UICollectionView *_collectionView;
    NSMutableArray *_data;
}
@end

//
//  AppDelegate.h
//  all
//
//  Created by 吴智极 on 16/2/16.
//  Copyright © 2016年 吴智极. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#import "ClassNavigationController.h"
#import "SteamNavigationController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic          ) UIWindow                     *window;
@property (strong, nonatomic          ) UITabBarController           *tbc;
@property (strong, nonatomic          ) ClassNavigationController    *classNVC;
@property (strong, nonatomic          ) SteamNavigationController    *steamNVC;
@property (readonly, strong, nonatomic) NSManagedObjectContext       *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel         *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end


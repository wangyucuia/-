//
//  AppDelegate.m
//  推送
//
//  Created by 王玉翠 on 16/6/27.
//  Copyright © 2016年 王玉翠. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor orangeColor];
    [[UINavigationBar appearance] setBarTintColor:[UIColor magentaColor]];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
    ViewController *mainVC = [[ViewController alloc] init];
    
    self.window.rootViewController = mainVC;
    [self.window makeKeyAndVisible];
    if ([[UIApplication sharedApplication] currentUserNotificationSettings].types != UIUserNotificationTypeNone) {
        [self addLocalNotification];
    }else{
      
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert| UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories:nil];
        
        
        
    }
    
    
    return YES;
}



-(void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings{
    
    if (notificationSettings.types != UIUserNotificationTypeNone) {
        [self addLocalNotification];
    }
    
    
}
-(void)applicationWillResignActive:(UIApplication *)application{
    
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    
    
    
}


-(void)addLocalNotification{
    
    //定义本地通知对象
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    //设置调用时间
    notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:10.0];//通知中心调用10时s之后
    notification.repeatInterval = 2;//重复次数
    notification.alertBody = @"最近天气不好";
    notification.applicationIconBadgeNumber = 1;//应用程序右上角显示的数字
    notification.alertAction = @"打开应用";//待机界面的滑动动作提示
    notification.alertLaunchImage = @"123";//通过点击通知打开应用时的启动图片,这里使用程序启动图片
    notification.soundName = @"msa.caf";//通知声音（需要真机才可以听到）
    notification.userInfo = @{@"id":@1,@"user":@"kenshu"};//绑定到通知上的其他附加信息
    UIApplication *app = [UIApplication sharedApplication];
    [app scheduleLocalNotification:notification];
    
    
    
    [self removeNotification];
    
}


-(void)removeNotification{
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}



- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

//
//  AppDelegate.m
//  SafeToUnplug
//
//  Created by Wolf Rentzsch on 10/30/12.
//  Copyright (c) 2012 Jonathan 'Wolf' Rentzsch. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification*)notification {
    // ref: http://stackoverflow.com/questions/1408216/detect-when-removable-storage-is-unmounted
    
    NSNotificationCenter *workpaceNotificationCenter = [[NSWorkspace sharedWorkspace] notificationCenter];
    
    [workpaceNotificationCenter addObserver:self
                                   selector:@selector(didUnmountNotification:)
                                       name:NSWorkspaceDidUnmountNotification
                                     object:nil];
}

- (void)didUnmountNotification:(NSNotification*)notification {
    //NSLog(@"%@ %@", notification, [notification userInfo]);
    
    NSUserNotification *userNote = [NSUserNotification new];
    userNote.title = @"Safe to Unplug";
    userNote.informativeText = [[notification userInfo] objectForKey:NSWorkspaceVolumeLocalizedNameKey];
    userNote.hasActionButton = NO;
    [[NSUserNotificationCenter defaultUserNotificationCenter] deliverNotification:userNote];
}

@end

//  AppDelegate.m
//  SafeToUnplug
//
//  Copyright (c) 2012 Jonathan 'Wolf' Rentzsch: http://rentzsch.com
//  Some rights reserved: http://opensource.org/licenses/mit


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
    
    NSString *volumeName = [[notification userInfo] objectForKey:NSWorkspaceVolumeLocalizedNameKey];
    
    if (![volumeName isEqualToString:@"Boot OS X"]) { // Cover up random rescue volume unmounts.
        NSUserNotification *userNote = [NSUserNotification new];
        userNote.title = @"Safe to Unplug";
        userNote.informativeText = volumeName;
        userNote.hasActionButton = NO;
        [[NSUserNotificationCenter defaultUserNotificationCenter] deliverNotification:userNote];
    }
}

@end

//
//  CHAppDelegate.m
//  carFileTool
//
//  Created by Alexander Zielenski on 8/8/14.
//  Copyright (c) 2014 Alexander Zielenski. All rights reserved.
//

#import "CHAppDelegate.h"
#import "NSAppearance.h"
#import "CUICatalog.h"
#import "CUIStructuredThemeStore.h"
#import "CUICommonAssetStorage.h"

@implementation CHAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    NSColor *color = [NSColor colorWithCatalogName:@"System" colorName:@"_sourceListBackgroundColor"];

    NSLog(@"%f", color.blueComponent);
}

- (BOOL)applicationShouldOpenUntitledFile:(NSApplication *)sender {
    NSAppearance *appearance = [NSAppearance currentAppearance];
    CUICatalog *catalog = appearance._coreUICatalog;
    CUIStructuredThemeStore *themeStore = catalog._themeStore;
    CUICommonAssetStorage *assetStorage = themeStore.themeStore;
    
    [[NSDocumentController sharedDocumentController] openDocumentWithContentsOfURL:[NSURL fileURLWithPath:assetStorage.path]
                                                                            display:YES
                                                                  completionHandler:nil];
    return NO;
}

@end

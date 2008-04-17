//
//  CDataScanner_Extensions.h
//  CocoaJSON
//
//  Created by Jonathan Wight on 12/08/2005.
//  Copyright 2005 Toxic Software. All rights reserved.
//

#import "CDataScanner.h"

@interface CDataScanner (CDataScanner_Extensions)

- (BOOL)scanCStyleComment:(NSString **)outComment;
- (BOOL)scanCPlusPlusStyleComment:(NSString **)outComment;

@end

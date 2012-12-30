//
//  SOPinnerActivity.h
//  PinnerActivity
//
//  Created by Sam Oakley on 30/12/12.
//  Copyright (c) 2012 Sam Oakley. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const SOActivityTypeSendToPinboard;

extern NSString *const SOPinnerTitleParameterKey;
extern NSString *const SOPinnerTagsParameterKey; // Tags are a string separated by spaces.
extern NSString *const SOPinnerExtendedParameterKey;
extern NSString *const SOPinnerSharedParameterKey;
extern NSString *const SOPinnerToReadParameterKey;

@interface SOPinnerActivity : UIActivity

@property (strong, nonatomic) NSDictionary *bookmarkParameters;

@end
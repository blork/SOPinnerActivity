//
//  SOPinnerActivity.m
//  PinnerActivity
//
//  Created by Sam Oakley on 30/12/12.
//  Copyright (c) 2012 Sam Oakley. All rights reserved.
//

#import "SOPinnerActivity.h"

NSString *const SOActivityTypeSendToPinboard = @"SOActivityTypeSendToPinboard";;
NSString *const SOPinnerTitleParameterKey = @"title";
NSString *const SOPinnerTagsParameterKey = @"tags";
NSString *const SOPinnerExtendedParameterKey = @"extended";
NSString *const SOPinnerSharedParameterKey = @"shared";
NSString *const SOPinnerToReadParameterKey = @"toread";

@interface SOPinnerActivity ()

@property (strong, nonatomic) NSURL *activityURL;

@end

@implementation SOPinnerActivity

- (NSString *)activityType
{
    return SOActivityTypeSendToPinboard;
}

- (NSString *)activityTitle
{
    return @"Save to Pinner";
}

- (UIImage *)activityImage
{
    return [UIImage imageNamed:@"SOPinnerActivityMask"];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"ANY SELF.class.description == %@", [[NSURL class] description]];
    BOOL containsURL = [predicate evaluateWithObject:activityItems];

    return containsURL && [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"pinner:///"]];
}

- (void)prepareWithActivityItems:(NSArray *)activityItems
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self.class.description == %@", [[NSURL class] description]];
    NSArray *URLS = [activityItems filteredArrayUsingPredicate:predicate];
    NSURL* activityURL = [URLS objectAtIndex:0];
    
    self.activityURL = activityURL;
}

- (void)performActivity
{
    BOOL didFinish = NO;
        
    NSMutableString *pinnerURLString = [NSMutableString stringWithFormat:@"pinner://bookmark?href=%@", [self.activityURL absoluteString]];
    NSMutableArray *pathComponents = [NSMutableArray array];
    
    for (NSString *key in self.bookmarkParameters) {
        id parameterValue = self.bookmarkParameters[key];
        [pathComponents addObject:[NSString stringWithFormat:@"%@=%@", key, parameterValue]];        
    }
    
    NSString *parameterString = [pathComponents componentsJoinedByString:@"&"];

    if ([parameterString length]) {
        [pinnerURLString appendFormat:@"&%@", parameterString];
    }
    
    NSURL *pinnerURL = [NSURL URLWithString:[pinnerURLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    if ([[UIApplication sharedApplication] canOpenURL:pinnerURL]) {
        [[UIApplication sharedApplication] openURL:pinnerURL];
        didFinish = YES;
    }
    
    [self activityDidFinish:didFinish];
}

@end

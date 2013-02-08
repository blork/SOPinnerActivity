# SOPinnerActivity
`SOPinnerActivity` is a `UIActivity` subclass to save bookmarks to Pinner which are then uploaded to the user's Pinboard.in account.

##URL Scheme
To add a bookmark to Pinner without including the UIActivity subclass, use the following URL scheme:

	pinner://bookmark
	
with the parameters:

	href (required)
	title
	tags
	extended
	shared
	toread


## Acknowledgements
Inspired by [ALBPinbookActivity](https://github.com/collindonnell/ALBPinbookActivity), a similar UIActivity used for the [Pinbook](http://albinadevelopment.com/page3) app.

## Adding to a Project
Add the following files to your project:

* SOPinnerActivity.h
* SOPinnerActivity.m
* SOPinnerActivityMask.png
* SOPinnerActivityMask@2x.png
* SOPinnerActivityMask~ipad.png
* SOPinnerActivityMask~ipad@2x.png

## Usage
Create a new `SOPinnerActivity` object and provide it as one of the `applicationActivities` when instantiating `UIActivityViewController`. The activity will only appear if the user has the Pinner app installed and if at least one of the `ActivityItems` provided to `UIActivityViewController` is a URL.

Without any other configuration this will send the specified URL to Pinner as a new bookmark. Additionally you may set the `bookmarkParameters` property with an NSDictionary to pre-fill the rest of the bookmark fields with any information you like, as shown in the following example:

	SOPinnerActivity *activity = [[SOPinnerActivity alloc] init];
    activity.bookmarkParameters = @{
    SOPinnerTitleParameterKey : @"Bookmark Title", 
    SOPinnerTagsParameterKey : @"tag anothertag yetanothertag", 
    SOPinnerExtendedParameterKey : @"This is an example.", 
    SOPinnerSharedParameterKey : @(YES), 
    SOPinnerToReadParameterKey : @(NO)
    };
    
    UIActivityViewController *viewController = [[UIActivityViewController alloc] initWithActivityItems:@[[NSURL URLWithString:@"http://apple.com"]] applicationActivities:@[activity]];
    [self presentViewController:viewController animated:YES completion:nil];

## Parameter Keys
* `SOPinnerTitleParameterKey`: The title of the bookmark (NSString).
* `SOPinnerTagsParameterKey`: Tags separated by spaces (NSString).
* `SOPinnerExtendedParameterKey`: Extra text/a description (NSString).
* `SOPinnerSharedParameterKey`: Boolean shared/private (NSNumber).
* `SOPinnerToReadParameterKey`: Boolean, mark the bookmark as 'to read' (NSNumber).

##License
This project made available under the MIT License.

Copyright (C) 2013 Sam Oakley

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

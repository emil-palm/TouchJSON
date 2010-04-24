//
//  main.m
//  TouchCode
//
//  Created by Jonathan Wight on 20100422.
//  Copyright 2009 toxicsoftware.com. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//

#import <Foundation/Foundation.h>
#import <Carbon/Carbon.h>

extern NSDictionary *TouchJSONTest(NSData *theData);
extern NSDictionary *BSJSONTest(NSData *theData);
extern NSDictionary *SbrautasetJSONTest(NSData *theData);

typedef NSDictionary *(*testfuncptr)(NSData *theData);

int main (int argc, const char *argv[])
{
NSAutoreleasePool *thePool = [[NSAutoreleasePool alloc] init];

NSString *theFilename = [NSString stringWithUTF8String:argv[1]];
NSData *theContentData = [NSData dataWithContentsOfFile:theFilename];

NSString *theFunctionNames[] = { @"TouchJSON", @"Sbrautaset", @"BSJSON" };
testfuncptr theFunctions[] = { TouchJSONTest, SbrautasetJSONTest, BSJSONTest };

for (int N = 0; N != 2; ++N)
	{
	testfuncptr theTestPtr = theFunctions[N];
	NSLog(@"Library: %@", theFunctionNames[N]);
	int theCount = 1;

	UInt64 M0, M1;

	Microseconds((UnsignedWide *)&M0);

	for (int N = 0; N != theCount; ++N)
		{
		NSAutoreleasePool *theTestPool = [[NSAutoreleasePool alloc] init];

		NSDictionary *theOutput = (*theTestPtr)(theContentData);
	//	[theOutput retain];

		[theTestPool drain];

	//	[theOutput autorelease];
		}

	Microseconds((UnsignedWide *)&M1);
	NSLog(@"Microseconds: %g\n", ((double)(M1 - M0) / (double)theCount) / 1000000.0);
	}


[thePool drain];
return 0;
}

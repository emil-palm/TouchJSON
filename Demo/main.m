#import <Foundation/Foundation.h>

#import "CJSONScanner.h"

int main(int argc, char **argv)
{
NSAutoreleasePool *theAutoreleasePool = [[NSAutoreleasePool alloc] init];
//

NSString *theSource = NULL;
//theSource = @"[{\"a\":\"b\"}]";
theSource = @"{\"r\":[{\"name\":\"KEXP\",\"desc\":\"90.3 - Where The Music Matters\",\"icon\":\"\\/img\\/channels\\/radio_stream.png\",\"audiostream\":\"http:\\/\\/kexp-mp3-1.cac.washington.edu:8000\\/\",\"type\":\"radio\",\"stream\":\"fb8155000526e0abb5f8d1e02c54cb83094cffae\",\"relay\":\"r2b\"}]}";
NSData *theData = [theSource dataUsingEncoding:NSUTF32BigEndianStringEncoding];
//NSData *theData = [NSData dataWithContentsOfFile:@"/Users/schwa/Desktop/d.json"];

CJSONScanner *theScanner = [CJSONScanner scannerWithData:theData];

id theObject = NULL;
BOOL theResult = [theScanner scanJSONObject:&theObject error:NULL];

NSLog(@"Result: %d", [theObject count]);


//
[theAutoreleasePool release];
//
return(0);
}
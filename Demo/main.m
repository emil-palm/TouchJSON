#import <Foundation/Foundation.h>

#import "CJSONScanner.h"

int main(int argc, char **argv)
{
NSAutoreleasePool *theAutoreleasePool = [[NSAutoreleasePool alloc] init];
//
id theObject = NULL;

NSString *theSource = NULL;
theSource = @"{\"r\":[{\"name\":\"KEXP\",\"desc\":\"90.3 - Where The Music Matters\",\"icon\":\"\\/img\\/channels\\/radio_stream.png\",\"audiostream\":\"http:\\/\\/kexp-mp3-1.cac.washington.edu:8000\\/\",\"type\":\"radio\",\"stream\":\"fb8155000526e0abb5f8d1e02c54cb83094cffae\",\"relay\":\"r2b\"}]}";
//theSource = @"[{\"a\":\"b\"}]";

NSScanner *theScanner = [NSScanner scannerWithString:theSource];

BOOL theResult = [theScanner scanJSONObject:&theObject];

NSLog(@"%@", theObject);


//
[theAutoreleasePool release];
//
return(0);
}
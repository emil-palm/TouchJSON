#import <Foundation/Foundation.h>
#import <Carbon/Carbon.h>

extern NSDictionary *Test(NSData *theData);

int main (int argc, const char *argv[])
{
NSAutoreleasePool *thePool = [[NSAutoreleasePool alloc] init];

NSString *theFilename = [NSString stringWithUTF8String:argv[1]];
NSData *theContentData = [NSData dataWithContentsOfFile:theFilename];

//time_t  t0, t1;
//clock_t c0, c1;
UInt64 M0, M1;

//t0 = time(NULL);
//c0 = clock();
Microseconds((UnsignedWide *)&M0);

NSAutoreleasePool *theTestPool = [[NSAutoreleasePool alloc] init];

NSDictionary *theOutput = Test(theContentData);
[theOutput retain];

[theTestPool drain];

//t1 = time(NULL);
//c1 = clock();
Microseconds((UnsignedWide *)&M1);

//printf ("Wall clock time: %ld\n", (long) (t1 - t0));
//printf ("CPU time:        %f\n", (float) (c1 - c0)/CLOCKS_PER_SEC);
printf ("Microseconds: %ld\n", (M1 - M0));


[theOutput autorelease];

[thePool drain];
return 0;
}
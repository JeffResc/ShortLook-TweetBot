#import "TweetBotContactPhotoProvider.h"
#import <Foundation/Foundation.h>

@implementation TweetBotContactPhotoProvider

- (DDNotificationContactPhotoPromiseOffer *)contactPhotoPromiseOfferForNotification:(DDUserNotification *)notification {
  NSString *username = [[notification.applicationUserInfo valueForKeyPath:@"aps.alert.title-loc-args"] objectAtIndex:0];
  if (!username) return nil;
  NSString *photoURLStr = [NSString stringWithFormat: @"https://twitter.com/%@/profile_image?size=original", username];
  NSURL *photoURL = [NSURL URLWithString:photoURLStr];
  if (!photoURL) return nil;
  return [NSClassFromString(@"DDNotificationContactPhotoPromiseOffer") offerDownloadingPromiseWithPhotoIdentifier:photoURLStr fromURL:photoURL];
}

@end

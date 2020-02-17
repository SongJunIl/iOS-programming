
#import "UIUtils.h"

@implementation UIUtils

+ (void)alertShowController:(UIViewController *)viewController title:(NSString *)title message:(NSString *)message style:(UIAlertControllerStyle)style alertAction:(NSArray<UIAlertAction *> *)action {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:style];
    
    if (action.count > 0) {
        for (UIAlertAction *alertAction in action) {
            [alert addAction:alertAction];
        }
    }
    else {
        [alert addAction:[UIAlertAction actionWithTitle:LocalString(@"confirm") style:UIAlertActionStyleCancel handler:nil]];
    }
    
    [viewController presentViewController:alert animated:YES completion:nil];

}

+ (void)buttonImageEdge:(UIButton *)button gap:(CGFloat)gap imageOnRight:(BOOL)imageOnRight {
    CGSize imageSize = button.imageView.frame.size;
    CGSize titleSize = button.titleLabel.bounds.size;
    
    if(imageOnRight) {
        button.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageSize.width * 2 + gap), 0, 0);
        button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -(titleSize.width * 2 + gap));
    } else {
        button.titleEdgeInsets = UIEdgeInsetsMake(0, gap, 0, 0);
        button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, gap);
    }
}

+ (void)buttonImageEdge:(UIButton *)button gap:(CGFloat)gap top:(CGFloat)top bottom:(CGFloat)bottom imageOnRight:(BOOL)imageOnRight {
    CGSize imageSize = button.imageView.frame.size;
    CGSize titleSize = button.titleLabel.bounds.size;
    
    if(imageOnRight) {
        button.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageSize.width * 2 + gap), 0, 0);
        button.imageEdgeInsets = UIEdgeInsetsMake(top, 0, bottom, -(titleSize.width * 2 + gap));
    } else {
        button.titleEdgeInsets = UIEdgeInsetsMake(0, gap, 0, 0);
        button.imageEdgeInsets = UIEdgeInsetsMake(top, 0, bottom, gap);
    }
}

@end

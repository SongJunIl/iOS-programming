

#import <Foundation/Foundation.h>


@interface UIUtils : NSObject

/**
 * UIAlertController Extension
 @param viewController UIAlertViewController를 노출 시킬 뷰 컨트롤러의 값을 넘겨 줍니다. (ex: self)
 @param title alertView 제목 파라미터 입니다.
 @param message alertView 내용 파라미터 입니다.
 @param style alertView 표현 스타일 입니다. (ex: UIAlertControllerStyleAlert)
 @param action alertView에 등록될 UIAlertAction을 배열 형태로 받는 파라미터 입니다.
 */
+ (void)alertShowController:(UIViewController *)viewController title:(NSString *)title message:(NSString *)message style:(UIAlertControllerStyle)style alertAction:(NSArray<UIAlertAction *> *)action;


/**
 * UIButton Extension
버튼의 이미지를 텍스트 기준 좌, 우로 변경 합니다.
버튼의 이미지를 텍스트 기준 좌, 우로 변경 합니다. YES: 우측으로 이동, NO 좌측 유지
@param button 변경할 버튼
@param top,bottom 텍스트와의 거리
@param imageOnRight 이미지위치 변경 여부  YES: 우측으로 이동, NO 좌측 유지
*/
+ (void)buttonImageEdge:(UIButton *)button gap:(CGFloat)gap imageOnRight:(BOOL)imageOnRight;
+ (void)buttonImageEdge:(UIButton *)button gap:(CGFloat)gap top:(CGFloat)top bottom:(CGFloat)bottom imageOnRight:(BOOL)imageOnRight;


@end



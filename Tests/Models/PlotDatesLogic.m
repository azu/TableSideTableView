//
// Created by azu on 2013/02/20.
//


#import "Kiwi.h"
#import "PlotDatesLogic.h"
#import "NSDate+AZBuilder.h"
#import "PlotDateModel.h"
#import "KWBeKindOfClassMatcher.h"
#import "KWEqualMatcher.h"

@interface PlotDatesLogicSPec : KWSpec

@end

@implementation PlotDatesLogicSPec

+ (void)buildExampleGroups {
    describe(@"PlotDatesLogic", ^{
        describe(@"#positionInDayForModel:", ^{
            context(@"when pass nil", ^{
                it(@"return nil", ^{
                    [[PlotDatesLogic positionInDayForModel:nil] shouldBeNil];
                });
            });
            context(@"when pass model", ^{
                // 24時間のちょうど半分なので
                context(@"which has 12:00", ^{
                    __block PlotDateModel *model;
                    beforeEach(^{
                        NSDate *date = [NSDate dateByUnit:@{
                                AZDateBuilderUnit.hour : @12,
                                AZDateBuilderUnit.minute : @0,
                                AZDateBuilderUnit.second : @0
                        }];
                        model = [PlotDateModel modelWithDate:date];
                    });
                    it(@"return NSNumber", ^{
                        NSNumber *number = [PlotDatesLogic positionInDayForModel:model];
                        [[number should] beKindOfClass:[number class]];
                    });
                    it(@"return @0.5", ^{
                        NSNumber *number = [PlotDatesLogic positionInDayForModel:model];
                        [[number should] equal:@0.5];
                    });
                });
                // 00:00
                context(@"when min", ^{
                    __block PlotDateModel *model;
                    beforeEach(^{
                        NSDate *date = [NSDate dateByUnit:@{

                                AZDateBuilderUnit.hour : @0,
                                AZDateBuilderUnit.minute : @0,
                                AZDateBuilderUnit.second : @0
                        }];
                        model = [PlotDateModel modelWithDate:date];
                    });
                    it(@"return @0", ^{
                        NSNumber *number = [PlotDatesLogic positionInDayForModel:model];
                        [[number should] equal:@0];
                    });
                });
                // 23:59
                context(@"when max", ^{
                    __block PlotDateModel *model;
                    beforeEach(^{
                        NSDate *date = [NSDate dateByUnit:@{
                                AZDateBuilderUnit.hour : @23,
                                AZDateBuilderUnit.minute : @59,
                                AZDateBuilderUnit.second : @59
                        }];
                        model = [PlotDateModel modelWithDate:date];
                    });
                    it(@"return @0.999...", ^{
                        // 小数点以下、最低 3 桁、最大 6 桁までを表示する NSNumberFormatter を用意します。
                        NSNumberFormatter* formatter = [[NSNumberFormatter alloc] init];
                        formatter.numberStyle = NSNumberFormatterDecimalStyle;
                        formatter.roundingMode = NSNumberFormatterRoundDown;// 3桁以降は切り落とす
                        formatter.maximumFractionDigits = 3;
                        NSNumber *number = [PlotDatesLogic positionInDayForModel:model];
                        NSString*resultString = [formatter stringFromNumber:number];
                        // 少数3桁の文字列にする
                        [[resultString should] equal:@"0.999"];
                    });
                });
            });
        });
    });
}

@end
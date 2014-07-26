
#import <UIKit/UIKit.h>

int currentQuestion = 0;


@interface PlayViewController : UIViewController
{
    
    int numCorrect;
    int QuestionSelected;
    
    IBOutlet UILabel *Message;
    
    IBOutlet UILabel *Score;
    
    IBOutlet UIButton *Home;
    
    IBOutlet UIButton *Replay;
    
}

@property (weak, nonatomic) IBOutlet UILabel *lblQuestionTitle;

@property (weak, nonatomic) IBOutlet UILabel *lblAnswerA;

@property (weak, nonatomic) IBOutlet UILabel *lblAnswerB;

@property (weak, nonatomic) IBOutlet UILabel *lblAnswerC;
@property (weak, nonatomic) IBOutlet UILabel *lblAnswerD;

@property (weak, nonatomic) IBOutlet UIButton *btnA;
@property (weak, nonatomic) IBOutlet UIButton *btnB;

@property (weak, nonatomic) IBOutlet UIButton *btnC;

@property (weak, nonatomic) IBOutlet UIButton *btnD;

@property (weak, nonatomic) NSArray *questions;
@property (weak, nonatomic) NSString *answer;

- (IBAction)buttonPressedA:(id)sender;

- (IBAction)buttonPressedB:(id)sender;

- (IBAction)buttonPressedC:(id)sender;

- (IBAction)buttonPressedD:(id)sender;


-(void) showNextQuestion;
-(void) FinalResult;


@end

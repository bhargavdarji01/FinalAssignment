

#import "PlayViewController.h"

@interface PlayViewController ()

@end

@implementation PlayViewController

@synthesize lblQuestionTitle;
@synthesize lblAnswerA;
@synthesize lblAnswerB;
@synthesize lblAnswerC;
@synthesize lblAnswerD;
@synthesize btnA;
@synthesize btnB;
@synthesize btnC;
@synthesize btnD;
@synthesize questions = questiion_;
@synthesize answer = answer_;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
     [super viewDidLoad];
     srandom(time(NULL));

     Replay.hidden = YES;
     Message.hidden = YES;
     Score.hidden = YES;
     Home.hidden = YES;
    
    // Do any additional setup after loading the view.

    currentQuestion = 0;
    [self showNextQuestion];
    
}

-(void) showNextQuestion
{
      currentQuestion = currentQuestion + 1;
      if (currentQuestion <= 5)
      {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Property List" ofType:@"plist"];
        NSDictionary *tempdict = [[NSDictionary alloc] initWithContentsOfFile:path];
        self.questions = [tempdict objectForKey:@"Questions"];
        QuestionSelected = arc4random() % 10;
        NSDictionary *nextQuestion = [self.questions objectAtIndex:QuestionSelected];
         self.answer = [nextQuestion valueForKey:@"QuestionAnswer"];
       
        self.lblQuestionTitle.text = [nextQuestion objectForKey:@"QuestionTitle"];
        self.lblAnswerA.text = [nextQuestion objectForKey:@"A"];
        self.lblAnswerB.text = [nextQuestion objectForKey:@"B"];
        self.lblAnswerC.text = [nextQuestion objectForKey:@"C"];
        self.lblAnswerD.text = [nextQuestion objectForKey:@"D"];
        
      }

      else
      {
         [self FinalResult];
      }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressedA:(id)sender
{
       
    if(self.answer == lblAnswerA.text)
    {
        numCorrect = numCorrect + 1;
        
    }
     [self showNextQuestion];
}

- (IBAction)buttonPressedB:(id)sender
{
    if(self.answer == lblAnswerB.text)
    {
        numCorrect = numCorrect + 1;
        
    }
    [self showNextQuestion];

}

- (IBAction)buttonPressedC:(id)sender
{
    if(self.answer == lblAnswerC.text)
    {
        numCorrect = numCorrect + 1;
        
    }
    [self showNextQuestion];

}

- (IBAction)buttonPressedD:(id)sender
{
    if(self.answer == lblAnswerD.text)
    {
        numCorrect = numCorrect + 1;
        
    }
    [self showNextQuestion];
    
}


-(void) FinalResult
{
    lblQuestionTitle.hidden = YES;
    btnA.hidden = YES;
    btnB.hidden = YES;
    btnC.hidden = YES;
    btnD.hidden = YES;
    lblAnswerA.hidden = YES;
    lblAnswerB.hidden = YES;
    lblAnswerC.hidden = YES;
    lblAnswerD.hidden = YES;
    
    Message.hidden = NO;
    Score.hidden = NO;
    Home.hidden = NO;
   
    
    if (numCorrect == 0)
    {
        Message.text = [NSString stringWithFormat:@"Please Try Again!!!"];
        Score.text = [NSString stringWithFormat:@"You Have Scored:%i out of 5",numCorrect];
        Replay.hidden = NO;
    }
    else if (numCorrect == 1)
    {
        Message.text = [NSString stringWithFormat:@"Please Try Again!!!"];
        Score.text = [NSString stringWithFormat:@"You Have Scored:%i out of 5",numCorrect];
        Replay.hidden = NO;
        
    }
    else if (numCorrect == 2)
    {
        Message.text = [NSString stringWithFormat:@"Please Try Again!!!"];
        Score.text = [NSString stringWithFormat:@"You Have Scored:%i out of 5",numCorrect];
        Replay.hidden = NO;
        
    }
    else if (numCorrect == 3)
    {
        Message.text = [NSString stringWithFormat:@"Good Job!!!"];
        Score.text = [NSString stringWithFormat:@"You Have Scored:%i out of 5",numCorrect];
    }
    else if (numCorrect == 4)
    {
        Message.text = [NSString stringWithFormat:@"Excellent Work!!!"];
        Score.text = [NSString stringWithFormat:@"You Have Scored:%i out of 5",numCorrect];
    }
    else if (numCorrect == 5)
    {
        Message.text = [NSString stringWithFormat:@"You are a Genius!!!"];
        Score.text = [NSString stringWithFormat:@"You Have Scored:%i out of 5",numCorrect];
    }
    else
    {
        //
    }
    
}

@end

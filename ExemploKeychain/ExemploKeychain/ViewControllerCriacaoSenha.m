//
//  ViewControllerCriacaoSenha.m
//  ExemploKeychain
//
//  Created by André Gimenez Faria on 23/05/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "ViewControllerCriacaoSenha.h"

@interface ViewControllerCriacaoSenha ()

@end

static UIWindow *window = nil;

@implementation ViewControllerCriacaoSenha

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(ViewControllerCriacaoSenha *)init {
    self = [super initWithNibName:nil bundle:nil];
    window = [[[UIApplication sharedApplication] delegate] window];
    if (self) {
        gerenciadorSenhas = [GerenciadorSenhas sharedInstance];
        txtEntradaSenha = [[UITextField alloc] initWithFrame:CGRectMake(0.10 * window.bounds.size.width, 0, 0.80 * window.bounds.size.width, 44)];
        txtEntradaSenha.borderStyle = UITextBorderStyleRoundedRect;
        txtEntradaSenha.layer.borderColor = [[UIColor blackColor] CGColor];
        txtEntradaSenha.secureTextEntry = YES;
        txtEntradaSenha.center = window.center;
        txtEntradaSenha.delegate = self;
        txtEntradaSenha.clearButtonMode = UITextFieldViewModeWhileEditing;
        [self.view addSubview:txtEntradaSenha];
        txtMensagem = [[UILabel alloc] initWithFrame:CGRectMake(0.05 * window.bounds.size.width, 0.25 * window.center.y, 0.90 * window.bounds.size.width, 44)];
        txtMensagem.text = @"Criar Senha";
        txtMensagem.font = [UIFont systemFontOfSize:36];
        txtMensagem.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:txtMensagem];
        self.title = @"Criação";
        self.tabBarItem.image = [UIImage imageNamed:@"iconeCriacao"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self criarSenha];
    [textField resignFirstResponder];
    [self performSelector:@selector(resetarUI) withObject:self afterDelay:3];
    return YES;
}

-(void)criarSenha{
    if (!([txtEntradaSenha.text isEqualToString:@""])) {
        int resultadoCriacao = [gerenciadorSenhas criarSenha:txtEntradaSenha.text];
        if (resultadoCriacao == 0) {
            txtMensagem.text = @"Senha Criada";
            txtMensagem.textColor = [UIColor greenColor];
        }
        else {
            UIAlertView *erroCriacaoSenha = [[UIAlertView alloc] initWithTitle:@"Senha Não Criada" message:[NSString stringWithFormat:@"Não foi possível criar senha.\nErro: %d",resultadoCriacao] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [erroCriacaoSenha show];
        }
    }
    else {
        UIAlertView *erroSenhaVazia = [[UIAlertView alloc] initWithTitle:@"Senha Vazia" message:@"A senha digitada está em branco." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [erroSenhaVazia show];
    }
}

-(void)resetarUI {
    txtMensagem.text = @"Criar Senha";
    txtMensagem.textColor = [UIColor blackColor];
    txtEntradaSenha.text = @"";
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

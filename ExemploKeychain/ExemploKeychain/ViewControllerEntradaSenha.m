//
//  ViewControllerEntradaSenha.m
//  ExemploKeychain
//
//  Created by André Gimenez Faria on 23/05/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "ViewControllerEntradaSenha.h"

@interface ViewControllerEntradaSenha ()

@end

@implementation ViewControllerEntradaSenha

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(ViewControllerEntradaSenha *)init {
    self = [super init];
    if (self) {
        txtMensagem.text = @"Validar Senha";
        self.title = @"Entrada";
        self.tabBarItem.image = [UIImage imageNamed:@"iconeChave"];
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

-(void)validarSenha {
    if (!([txtEntradaSenha.text isEqualToString:@""])) {
        BOOL validacao = [gerenciadorSenhas validarSenha:txtEntradaSenha.text];
        if (validacao) {
            txtMensagem.text = @"Senha Válida";
            txtMensagem.textColor = [UIColor greenColor];
        }
        else {
            txtMensagem.text = @"Senha Inválida";
            txtMensagem.textColor = [UIColor redColor];
        }
    }
    else {
        UIAlertView *erroSenhaVazia = [[UIAlertView alloc] initWithTitle:@"Senha Vazia" message:@"A senha digitada está em branco." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [erroSenhaVazia show];
    }
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(resetarUI) object:self];
    [self validarSenha];
    [textField resignFirstResponder];
    [self performSelector:@selector(resetarUI) withObject:self afterDelay:3];
    return YES;
}

-(void)resetarUI {
    txtMensagem.text = @"Validar Senha";
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

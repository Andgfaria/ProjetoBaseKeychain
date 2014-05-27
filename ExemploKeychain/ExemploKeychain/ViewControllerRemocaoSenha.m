//
//  ViewControllerRemocaoSenha.m
//  ExemploKeychain
//
//  Created by André Gimenez Faria on 23/05/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "ViewControllerRemocaoSenha.h"

@interface ViewControllerRemocaoSenha ()

@end

static UIWindow *window = nil;

@implementation ViewControllerRemocaoSenha

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(ViewControllerRemocaoSenha *)init {
    self = [super initWithNibName:nil bundle:nil];
    window = [[[UIApplication sharedApplication] delegate] window];
    if (self) {
        gerenciadorSenhas = [GerenciadorSenhas sharedInstance];
        txtMensagem = [[UILabel alloc] initWithFrame:CGRectMake(0.05 * window.bounds.size.width, 0.25 * window.center.y, 0.90 * window.bounds.size.width, 44)];
        txtMensagem.text = @"Senha Removida";
        txtMensagem.font = [UIFont systemFontOfSize:36];
        txtMensagem.textAlignment = NSTextAlignmentCenter;
        txtMensagem.hidden  = YES;
        [self.view addSubview:txtMensagem];
        btnRemoverSenha = [[UIButton alloc] initWithFrame:CGRectMake(0.10*window.bounds.size.width, 0, 0.80*window.bounds.size.width, 44)];
        btnRemoverSenha.center = window.center;
        [btnRemoverSenha setTitle:@"Remover Senha" forState:UIControlStateNormal];
        [btnRemoverSenha setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [btnRemoverSenha.titleLabel setFont:[UIFont systemFontOfSize:24]];
        [btnRemoverSenha addTarget:self action:@selector(removerSenha) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btnRemoverSenha];
        self.title = @"Remoção";
        self.tabBarItem.image = [UIImage imageNamed:@"iconeRemover"];
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

-(void)removerSenha {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(ocultarMensagem) object:self];
    [gerenciadorSenhas removerSenha];
    txtMensagem.hidden = NO;
    [self performSelector:@selector(ocultarMensagem) withObject:self afterDelay:3];
}

-(void)ocultarMensagem {
    txtMensagem.hidden = YES;
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

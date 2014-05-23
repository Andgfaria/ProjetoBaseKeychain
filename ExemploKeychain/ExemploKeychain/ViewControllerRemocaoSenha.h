//
//  ViewControllerRemocaoSenha.h
//  ExemploKeychain
//
//  Created by André Gimenez Faria on 23/05/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GerenciadorSenhas.h"

@interface ViewControllerRemocaoSenha : UIViewController {
    UIButton *btnRemoverSenha;
    UILabel *txtMensagem;
    GerenciadorSenhas *gerenciadorSenhas;
}

-(ViewControllerRemocaoSenha *)init;

@end

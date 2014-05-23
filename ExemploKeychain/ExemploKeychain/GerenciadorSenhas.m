//
//  GerenciadorSenhas.m
//  ExemploKeychain
//
//  Created by André Gimenez Faria on 23/05/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "GerenciadorSenhas.h"

@implementation GerenciadorSenhas

static GerenciadorSenhas *instancia = nil;

+(GerenciadorSenhas *)sharedInstance {
    if (!instancia) {
        instancia = [[super allocWithZone:nil] init];
    }
    return instancia;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [GerenciadorSenhas sharedInstance];
}

/* -------------------------------------------------------------
   |        Reimplementar todos os métodos abaixo!             |
   -------------------------------------------------------------
*/
-(NSDictionary *)dicionarioKeychain {
    return nil;
}

-(int)criarSenha:(NSString *)senha{
    return 0;
}

-(BOOL)validarSenha:(NSString *)senha{
    return YES;
}

-(void)removerSenha{
    
}

@end

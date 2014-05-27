//
//  GerenciadorSenhas.h
//  ExemploKeychain
//
//  Created by André Gimenez Faria on 23/05/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GerenciadorSenhas : NSObject

+(GerenciadorSenhas *)sharedInstance;
-(int)criarSenha:(NSString *)senha;
-(BOOL)validarSenha:(NSString *)senha;
-(void)atualizarSenha:(NSString *)novaSenha;
-(void)removerSenha;

@end

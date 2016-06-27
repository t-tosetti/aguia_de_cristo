//
//  ministerio.swift
//  AguiaDeCristo
//
//  Created by Thiago Tosetti Lopes on 12/02/16.
//  Copyright © 2016 tDesign. All rights reserved.
//

import UIKit

struct dados {
    let ID: String
    
    init(dicionario: [String: String]) {
        ID = dicionario["ID"] ?? "sem ID"
    }
}

struct pastores {
    let Pastor: String
    let tel: String
    
    init(dicionario: [String: String]) {
        Pastor = dicionario["Pastor"] ?? "sem nome"
        tel = dicionario["Telefone"] ?? "sem tel"
    }
}

struct cultos {
    let nome: String
    let horario: String
    
    init(dicionario: [String: String]) {
        nome = dicionario["Nome"] ?? "sem nome"
        horario = dicionario["Horario"] ?? "sem hora"
    }
}

struct contatos {
    let Telefone: String
    let Email: String
    let Endereco: String
    
    init(dicionario: [String: String]) {
        Telefone = dicionario["telefone"] ?? "sem telefone"
        Email = dicionario["email"] ?? "sem email"
        Endereco = dicionario["endereco"] ?? "sem endereço"
    }
}

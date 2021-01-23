//
//  SingleUserResponse.swift
//  DiscourseClient
//
//  Created by José Sancho on 22/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

// TODO: Implementar aquí el modelo de la respuesta.
// Puedes echar un vistazo en https://docs.discourse.org

struct SingleUserResponse: Codable {
    var user: User
}

//
//  StravaCallbackBody.swift
//  
//
//  Created by Yaroo Sedighi on 5/31/23.
//

import Vapor

struct StravaCallbackBody: Content {
    let code: String
    let clientId: String
    let clientSecret: String
    let grantType: String = "authorization_code"

    static var defaultContentType: HTTPMediaType = .urlEncodedForm

    enum CodingKeys: String, CodingKey {
        case code
        case clientId = "client_id"
        case clientSecret = "client_secret"
        case grantType = "grant_type"
    }
}

//
//  StravaAuth.swift
//  
//
//  Created by Yaroo Sedighi on 5/31/23.
//

import Vapor

public class StravaAuth: FederatedServiceTokens {
    public static var idEnvKey: String = "STRAVA_CLIENT_ID"
    public static var secretEnvKey: String = "STRAVA_CLIENT_SECRET"
    public var clientID: String
    public var clientSecret: String

    public required init() throws {
        let idError = ImperialError.missingEnvVar(StravaAuth.idEnvKey)
        let secretError = ImperialError.missingEnvVar(StravaAuth.secretEnvKey)

        self.clientID = try Environment.get(StravaAuth.idEnvKey).value(or: idError)
        self.clientSecret = try Environment.get(StravaAuth.secretEnvKey).value(or: secretError)
    }
}

//
//  StravaRouter.swift
//  
//
//  Created by Yaroo Sedighi on 5/31/23.
//
import Vapor
import Foundation

public class StravaRouter: FederatedServiceRouter {
    public let tokens: FederatedServiceTokens
    public let callbackCompletion: (Request, String) throws -> (EventLoopFuture<ResponseEncodable>)
    public var scope: [String] = []
    public let callbackURL: String
    public let accessTokenURL: String = "https://www.strava.com/api/v3/oauth/token"
    public let service: OAuthService = .strava
    public let callbackHeaders: HTTPHeaders = {
        var headers = HTTPHeaders()
        headers.contentType = .urlEncodedForm
        return headers
    }()

    public required init(callback: String, completion: @escaping (Request, String) throws -> (EventLoopFuture<ResponseEncodable>)) throws {
        self.tokens = try StravaAuth()
        self.callbackURL = callback
        self.callbackCompletion = completion
    }

    public func authURL(_ request: Request) throws -> String {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "www.strava.com"
        components.path = "/api/v3/oauth/token"
        components.queryItems = [
            clientIDItem,
            scopeItem,
            codeResponseTypeItem
        ]

        guard let url = components.url else {
            throw Abort(.internalServerError)
        }

        return url.absoluteString
    }

    public func callbackBody(with code: String) -> ResponseEncodable {
        StravaCallbackBody(
            code: code,
            clientId: tokens.clientID,
            clientSecret: tokens.clientSecret
        )
    }
}

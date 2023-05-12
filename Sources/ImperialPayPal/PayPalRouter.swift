import Vapor
import Foundation

public class PayPalRouter: FederatedServiceRouter {
    public let tokens: FederatedServiceTokens
    public let callbackCompletion: (Request, String) throws -> (EventLoopFuture<ResponseEncodable>)
    public var scope: [String] = []
    public let callbackURL: String
    public let accessTokenURL: String = "https://api-m.sandbox.paypal.com/v1/oauth2/token"
    public let service: OAuthService = .paypal
    public let callbackHeaders: HTTPHeaders = {
        var headers = HTTPHeaders()
        headers.contentType = .urlEncodedForm
        return headers
    }()

    public required init(callback: String, completion: @escaping (Request, String) throws -> (EventLoopFuture<ResponseEncodable>)) throws {
        self.tokens = try PayPalAuth()
        self.callbackURL = callback
        self.callbackCompletion = completion
    }

    public func authURL(_ request: Request) throws -> String {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api-m.sandbox.paypal.com"
        components.path = "/v1/oauth2/token"
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
        PayPalCallbackBody(
            code: code,
            clientId: tokens.clientID,
            clientSecret: tokens.clientSecret
        )
    }
}

import Vapor

public class PayPalAuth: FederatedServiceTokens {
    public static var idEnvKey: String = "PAYPAL_CLIENT_ID"
    public static var secretEnvKey: String = "PAYPAL_CLIENT_SECRET"
    public var clientID: String
    public var clientSecret: String
    
    public required init() throws {
        let idError = ImperialError.missingEnvVar(PayPalAuth.idEnvKey)
        let secretError = ImperialError.missingEnvVar(PayPalAuth.secretEnvKey)
        
        self.clientID = try Environment.get(PayPalAuth.idEnvKey).value(or: idError)
        self.clientSecret = try Environment.get(PayPalAuth.secretEnvKey).value(or: secretError)
    }
}

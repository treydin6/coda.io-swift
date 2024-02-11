// The Swift Programming Language
// https://docs.swift.org/swift-book

/// CodaApi is a class for interacting with the Coda API.
///
/// Use this class to create an instance for making requests to the Coda API.
public final class CodaApi {

    /// The API key required for authentication with the Coda API.
    private var apiKey: String
    
    let networkManager = NetworkManager()

    /// Initializes a new instance of CodaApi with the provided API key.
    ///
    /// - Parameter apiKey: The API key for authentication.
    public init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    func getApiKey() -> String {
        return self.apiKey
    }
}

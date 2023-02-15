import UIKit

let jsonString = """
{
    "response": {
        "status": "ok",
        "userTier": "developer",
        "results": [
            {
                "id": 1,
                "type": "article",
                "name": "mismatch"
            },
            {
                "id": 2,
                "type": "essay",
                "name": "opinion"
            }
        ]
    }
}
"""
struct Root: Decodable {
    var response: Response
}

struct Response: Decodable {
    var status: String
    var user: String
    var results: [Post]
    
    enum CodingKeys: String, CodingKey {
        case status, results
        case user = "userTier"
    }
}

struct Post: Decodable {
    var id: Int
    var type: String
    var name: String
}


let data = jsonString.data(using: .utf8)!
let decoder = JSONDecoder()
do {
    let root = try decoder.decode(Root.self, from: data)
    let user = root.response.user
    let name2 = root.response.results[1].name
    print(user, name2)
} catch {
    print(error)
}

let name = "Word"
    let message  = #"Hello "\#(name)"!"#

//
//  Photo.swift
//  Explore
//
//  Created by Nichita Stefanita on 7/13/20.
//

import Foundation

struct Photo: Identifiable, Decodable {
    var id: String
    var alt_description: String
    var urls: [String : String]
}

class UnsplashData: ObservableObject {
    @Published var photoArray: [Photo] = []
    
    init() {
        loadData()
    }
    
    func loadData() {
        
        let endpoint = "\(API)/photos/random/?count=30&client_id=\(accesKey)"
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: endpoint)!) { (data, _, error) in
            guard let data = data else {
                print("URLSession dataTas error:", error ?? "nil")
                return
            }
            do {
                let json =  try JSONDecoder().decode([Photo].self, from: data)
                print(json)
                for photo in json {
                    DispatchQueue.main.async {
                        self.photoArray.append(photo)
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

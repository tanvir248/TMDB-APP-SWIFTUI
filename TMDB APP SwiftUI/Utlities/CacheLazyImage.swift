//
//  CacheLazyImage.swift
//  TMDB APP SwiftUI
//
//  Created by Tanvir Rahman on 23.11.2023.
//

import Foundation
import SwiftUI

class lazyImageAndCache: ObservableObject {
    private let imageCache = NSCache<AnyObject, UIImage>()

    @Published var image = Image("No-Image-Placeholder")
    
    func lazyImage(url: String) -> Image {
        
        guard let url = URL(string: url) else {
            print("Poster image url not found")
            return Image("No-Image-Placeholder")
        }
//        if let cachedImage = self.imageCache.object(forKey: url as AnyObject)
//        {
//            print("image loaded from cache for =\(url)")
//            DispatchQueue.main.async {
//                self.image = Image(uiImage: cachedImage)
//            }
//            return image
//        }
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            
            if let imageData = try? Data(contentsOf: url)
            {
                //debugPrint("image downloaded from server...")
                if let findImage = UIImage(data: imageData)
                {
                    DispatchQueue.main.async {
                     //   self!.imageCache.setObject(findImage, forKey: url as AnyObject)
                        
                        self?.image = Image(uiImage: findImage)
                    }
                }
            }
        }
        return image
    }
}

//
//  CacheLazyImage.swift
//  TMDB APP SwiftUI
//
//  Created by Tanvir Rahman on 23.11.2023.
//

import Foundation
import UIKit

class LazyImageView
{
    static let shared = LazyImageView()
    private let imageCache = NSCache<AnyObject, UIImage>()

    func loadImage(fromURL imageURL: URL, placeHolderImage: String)
    -> UIImage{
        var imagePlaceHolder = UIImage(named: placeHolderImage)

        if let cachedImage = self.imageCache.object(forKey: imageURL as AnyObject)
        {
            debugPrint("image loaded from cache for =\(imageURL)")
            imagePlaceHolder = cachedImage
            return imagePlaceHolder!
        }
        
        DispatchQueue.global().async {
            [weak self] in

            if let imageData = try? Data(contentsOf: imageURL)
            {
                debugPrint("image downloaded from server...")
                if let image = UIImage(data: imageData)
                {
                    DispatchQueue.main.async {
                        self!.imageCache.setObject(image, forKey: imageURL as AnyObject)
                        imagePlaceHolder = image
                    }
                }
            }
        }
        return UIImage()
    }
}

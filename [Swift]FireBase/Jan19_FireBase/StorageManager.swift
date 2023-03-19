//
//  StorageManager.swift
//  Jan19_FireBase
//
//  Created by Ge Ding on 1/25/23.
//

import Foundation
import FirebaseStorage

final class StorageManager {
    static let shared = StorageManager()
    private let storage = Storage.storage().reference()
    public typealias UploadPictureCompletion = (Result<String,Error>) -> Void
    
    public func uploadProfilePicture(with data: Data, fileName: String, completion: @escaping UploadPictureCompletion) {
        storage.child("images/\(fileName)").putData(data, metadata: nil) { metadata, error in
            guard error == nil else {
                print(error.debugDescription)
                completion(.failure(StorageError.storageUploadError))
                return
            }
            
            self.storage.child("images/\(fileName)").downloadURL { url, error in
                guard error == nil else {
                    print(error.debugDescription)
                    return
                }
                guard let url = url else {
                    completion(.failure(StorageError.storageDownloadError))
                    return
                }
                
                let urlString = url.absoluteString
                print("download and returned: \(urlString)")
                completion(.success(urlString))
            }
        }
    }
    
    public func downloadUrl(for path: String, completion: @escaping ((Result<URL,Error>) -> Void) ) {
        let reference = storage.child(path)
        reference.downloadURL { url, error in
            guard let url = url, error == nil else {
                print(error.debugDescription)
                completion(.failure(StorageError.storageDownloadError))
                return
            }
            completion(.success(url))
        }
    }
    
    
}

enum StorageError: Error {
    case storageDownloadError
    case storageUploadError
}

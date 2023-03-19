//
//  ViewController.swift
//  Jan17NewDownload
//
//  Created by Ge Ding on 1/17/23.
//

import UIKit
import Photos
enum VIDEO_URL:String {
    case URL = "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4"
    case test_URL = "http://www.qdtricks.com/wp-content/uploads/2015/02/hd-wallpapers-1080p-for-mobile.png"
}

class ViewController: UIViewController, URLSessionDownloadDelegate {
    @IBOutlet weak var receivedProgressView: UIProgressView!
    @IBOutlet weak var receivedLabel: UILabel!
    var downloadTask: URLSessionDownloadTask!
    var isPause: Bool = false

    @IBOutlet weak var inputURLTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func pauseButtonTapped(_ sender: UIButton) {
        if isPause {
            downloadTask.progress.resume()
            sender.setTitle("Pause", for: .normal)
            isPause = false
        } else {
            
            downloadTask.progress.pause()
            sender.setTitle("Resume", for: .normal)
            isPause = true
        }
    }
    
    @IBAction func cacelButtonTapped(_ sender: Any) {
        downloadTask.progress.cancel()
        
        DispatchQueue.main.async {
            self.receivedProgressView.setProgress(0, animated: true)
            self.receivedLabel.text = "0%"
        }
    }
    

    @IBAction func downloadVideoTapped(_ sender: UIButton) {
        guard let url = URL(string: inputURLTextField.text ?? VIDEO_URL.URL.rawValue) else {return}
        
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        downloadTask = session.downloadTask(with: url)
        downloadTask.resume()
    }
    
    func saveToAlbum(url: URL) {
        guard let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let destinationURL = documentsDirectoryURL.appendingPathComponent("\(Date().timeIntervalSince1970).mp4")
        do {
            try FileManager.default.moveItem(at: url, to: destinationURL)

            PHPhotoLibrary.requestAuthorization({ (authorizationStatus: PHAuthorizationStatus) -> Void in
                if authorizationStatus == .authorized {
                    PHPhotoLibrary.shared().performChanges({
                        PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: destinationURL)}) { completed, error in
                            if completed {
                                print("Video Asset Created")
                            } else {
                                print(error?.localizedDescription ?? "N/A")
                            }
                    }
                }
            })
        } catch { print(error) }

        
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        saveToAlbum(url: location)
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        var progress:Float = 0.0
        if totalBytesExpectedToWrite == -1 {
            progress = Float(totalBytesWritten) / 10546620
        } else {
            progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        }
        DispatchQueue.main.async {
            self.receivedProgressView.setProgress(progress, animated: true)
            self.receivedLabel.text = "\(Int(progress*100))%"
        }
    }

}


//
//  ViewController.swift
//  SystemViewControllers
//
//  Created by Ujjwalsingh Rajput on 11/01/23.
//

import UIKit
import SafariServices
import MessageUI

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate
{

    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func shareButtonTap(_ sender: UIButton) {
        guard let image = imageView.image else {return}
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = sender
        present(activityController, animated: true, completion: nil)
    }
    
    @IBAction func safariButtonTap(_ sender: UIButton) {
        if let url = URL(string: "https://www.apple.com") {
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true,
                    completion: nil)
        }
    }
    
    @IBAction func cameraButtonTap(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            let alertController = UIAlertController(title:
               "Choose Image Source", message: nil,
               preferredStyle: .actionSheet)
            let cancelAction = UIAlertAction(title: "Cancel",
               style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let cameraAction = UIAlertAction(title: "Camera",
                   style: .default, handler: { action in
                    imagePicker.sourceType = .camera
                    self.present(imagePicker, animated: true, completion: nil)
                })
                alertController.addAction(cameraAction)
            }
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let photoLibraryAction = UIAlertAction(title: "Photo Library",
                   style: .default, handler: { action in
                    imagePicker.sourceType = .photoLibrary
                    self.present(imagePicker, animated: true, completion: nil)
                })
                alertController.addAction(photoLibraryAction)
            }
            alertController.popoverPresentationController?.sourceView = sender
            present(alertController, animated: true, completion: nil)
        
        
    }
    
    @IBAction func emailButtonTap(_ sender: UIButton) {
        guard MFMailComposeViewController.canSendMail() else { return }
            let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        mailComposer.setToRecipients(["ur0226@srmist.edu.in"])
        mailComposer.setSubject("Look at this")
        mailComposer.setMessageBody("Hello, this is an email from the app I made.", isHTML: false)
        if let image = imageView.image, let jpegData =
           image.jpegData(compressionQuality: 0.9) {
            mailComposer.addAttachmentData(jpegData, mimeType:
               "image/jpeg", fileName: "photo.jpg")
        }
        present(mailComposer, animated: true, completion: nil)
        print("Mail sent")
    }
    
    func mailComposeController(_ controller:
                               MFMailComposeViewController, didFinishWith result:
                               MFMailComposeResult, error: Error?) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController,
       didFinishPickingMediaWithInfo info:
       [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as?
           UIImage else { return }
        imageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
}


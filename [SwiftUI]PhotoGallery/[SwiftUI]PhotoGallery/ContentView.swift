//
//  ContentView.swift
//  [SwiftUI]PhotoGallery
//
//  Created by Ge Ding on 12/14/23.
//

import SwiftUI
import SwiftData
import PhotosUI

struct ContentView: View {
    @State private var selectedItem: [PhotosPickerItem?] = Array(repeating: nil, count: 9)
    @State private var selectedImageArr: [Image?] = Array(repeating: nil, count: 9)
    
    
    var body: some View {
        NavigationView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible())]) {
                ForEach(Array(0..<selectedImageArr.count), id:\.self) { idex in
                    PhotosPicker(
                        selection: $selectedItem[idex],
                        matching: .images,
                        photoLibrary: .shared()) {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.gray)
                                    .frame(height: 150)
                                if let img = selectedImageArr[idex] {
                                    img
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 150)
                                } else {
                                    Text("Select a photo")
                                }
                            }
                        }
                        .onChange(of: selectedItem) {
                            Task {
                                if let loaded = try? await selectedItem[idex]?.loadTransferable(type: Image.self) {
                                    selectedImageArr[idex] = loaded
                                }
                            }
                        }
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}


struct ImagePicker: UIViewControllerRepresentable {
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    @Binding var selectedImage: UIImage
    @Environment(\.presentationMode) private var presentationMode

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}



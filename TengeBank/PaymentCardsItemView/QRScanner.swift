//
//  QRScanner.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 02/03/24.
//

import SwiftUI
import AVKit


struct ScannerView: View {
    
    // Qr Code Scanner Properties...
    @State private var isScanning:Bool = false
    @State private var session:AVCaptureSession = .init()
    @State private var cameraPermission:Permission = .idle
    
    // Qr Scanner Av Output
    @State private var qrOutput:AVCaptureMetadataOutput = .init()
    // Error proporties
    @State private var  errorMessage:String = ""
    @State private var showError:Bool = false
    @Environment(\.openURL) private var openURL
    
    // Camera qr output delegate
    @StateObject private var qrDelegate = QRScannerDelegate()
    //Scanned Code
    @State private var scannedCode:String = ""
    
    
    var body: some View {
        
        VStack(spacing:8){
            
//            Button{
//                
//            } label: {
//                Image(systemName: "xmark")
//                    .font(.title3)
//                    .foregroundColor(/*Color("Blue")*/.blue)
//            }
//            .frame(maxWidth: .infinity,alignment: .leading)
            
            Text("Place the Qr Code  code insede area")
                .font(.title3)
                .foregroundColor(.black.opacity(0.8))
                .padding(.top,20)
            
            Text("Scanning will start automaticallly")
                .font(.callout)
                .foregroundColor(.gray)
            
            Spacer(minLength: 0)
            
                //Scanner..
            GeometryReader{
                let size = $0.size
                
                ZStack{
                    
                    CameraView(framaSize: CGSize(width: size.width, height: size.width), session: $session)
                    
                    //making it little smaller
                        .scaleEffect(0.97)
                    
                    ForEach(0...4, id:\.self) { index in
                        let rotation = Double(index) * 90
                        
                        RoundedRectangle(cornerRadius: 2, style: .circular)
                        // Trimming  to get Scanner like Edges
                            .trim(from:0.61,to:0.64)
                            .stroke(/*Color("Blue")*/.blue,style: StrokeStyle(lineWidth: 5,lineCap: .round,lineJoin: .round))
                            .rotationEffect(.init(degrees: rotation))
                    }
                }
                //square shape
                .frame(width: size.width,height: size.width)
                //Scanner animation
                .overlay(alignment:.top ,content:{
                    Rectangle()
                        .fill(/*Color("Blue")*/.blue)
                        .frame(height: 2.5)
                        .shadow(color:.black.opacity(0.8) ,radius: 8,x:0,y: isScanning ? 15 : -15)
                        .offset(y:isScanning ? size.width : 0)
                })
//
                //To make it center
                .frame(maxWidth: .infinity,maxHeight:.infinity)
            }
            .padding(.horizontal,45)
            
            Spacer(minLength: 15)
            
            Button{
                if !session.isRunning && cameraPermission == .approved {
                    reActivateCamera()
                    activateScanneerAnimation()
                }
            } label: {
                Image(systemName: "qrcode.viewfinder")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            }
            Spacer(minLength: 45)
        }
        .padding(15)
        //checking Camera permission ,when the view is visiable
        .onAppear(perform:checkCameraPermission)
        .alert(errorMessage,isPresented: $showError) {
            // showing Setting's Button ,if permission is denied
            if cameraPermission == .denied {
                Button("Settings") {
                    let settingsString = UIApplication.openSettingsURLString
                    if let  settingsURL = URL(string: settingsString){
                        // opening ap's setting ,using openURL SwiftUI API
                        openURL(settingsURL)
                    }
                }
                // Along with cancel  Button
                Button("Cancel",role:.cancel){
                    
                }
            }
        }
        .onChange(of: qrDelegate.scannedCode) {newValue in
            if let code = newValue {
                scannedCode = code
                //when the first code scan is avilable ,immediately stop the camera
                session.stopRunning()
              //stopping scanner animation
                deActivateScanneerAnimation()
                // clearing the data on delegate
                qrDelegate.scannedCode = nil
            }
        }
    }
    func reActivateCamera() {
        DispatchQueue.global(qos: .background).async {
            session.startRunning()
        }
    }
    //Activating scanner animation method
    func activateScanneerAnimation() {
        //Adding Delay for each reversal
        withAnimation(.easeInOut(duration: 0.85).repeatForever(autoreverses: true)){
            isScanning = true
        }
    }
    
    //De - Activating scanner animation method
    func deActivateScanneerAnimation() {
        //Adding Delay for each reversal
        withAnimation(.easeInOut(duration: 0.85)){
            isScanning = false
        }
    }
    // Checking Camer Permission
    
    func checkCameraPermission() {
        Task {
            switch AVCaptureDevice.authorizationStatus(for: .video){
            case .authorized:
                cameraPermission = .approved
                if session.inputs.isEmpty {
                    //New setUp
                    setUpCamera()
                } else {
                    //Already existing one
                    session.startRunning()
                }
            case .notDetermined:
                // Requesting Camera Acces
                if await AVCaptureDevice.requestAccess(for: .video) {
                    //Permission Granted
                    cameraPermission = .approved
                    setUpCamera()
                } else {
                    //Permission Denied
                    cameraPermission = .denied
                    //Presenting errorMessage
                    presentError("Please Provide Acces to Camera for Scanning codes")
                }
            case .denied, .restricted:
                cameraPermission = .denied
                presentError("Please Provide Acces to Camera for Scanning codes")
            default: break
            }
        }
    }
    // setting camera
    func setUpCamera() {
        do {
            //Finding back camera
            guard let device = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: .back).devices.first else {
                presentError("UNKNOWN DEVICE EROR")
                return
            }
            
            //Camera input
            let input = try AVCaptureDeviceInput(device: device)
            //For extra softey
            //Checking whether input & output can be added to the session
            guard session.canAddInput(input),session.canAddOutput(qrOutput) else {
                presentError("UNKNOWN INPUT/OUTPUTEROR")
                return
            }
            
            // Adding input &output to camera session
            session.beginConfiguration()
            session.addInput(input)
            session.addOutput(qrOutput)
            //setting output config to read qr code
            qrOutput.metadataObjectTypes = [.qr]
            //Adding delegate to retrieve the fetched qr code from camera
            qrOutput.setMetadataObjectsDelegate(qrDelegate, queue: .main)
            session.commitConfiguration()
            //note session must be started on background thread
            DispatchQueue.global(qos: .background).async {
                session.startRunning()
            }
            activateScanneerAnimation()
            
        } catch {
            presentError(error.localizedDescription)
        }
    }
    //Prsenting Error
    func presentError(_ message:String) {
        errorMessage = message
        showError.toggle()
    }
}
//Camera View Using AvCaptureVideoPreviewLayer

struct CameraView:UIViewRepresentable {
   
    var framaSize:CGSize
    // Camera Session
    @Binding var session:AVCaptureSession
    
    func makeUIView(context: Context) ->  UIView {
        //Defining camera frame size
        let view = UIViewType(frame: CGRect(origin: .zero, size: framaSize))
        view.backgroundColor = .clear
        
        
        let cameraLayer = AVCaptureVideoPreviewLayer(session: session)
        cameraLayer.frame = .init(origin:.zero,size: framaSize)
        cameraLayer.videoGravity = .resizeAspectFill
        cameraLayer.masksToBounds = true
        view.layer.addSublayer(cameraLayer)
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    
    }
}


// Camera permissiion enum

enum Permission:String {
    case idle = "Not Determined"
    case approved = "Acces granted"
    case denied = "Acces Denied"
}

class  QRScannerDelegate: NSObject,ObservableObject ,AVCaptureMetadataOutputObjectsDelegate{
    @Published var scannedCode:String?
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects:
        [AVMetadataObject], from connection: AVCaptureConnection) {
        if let metaObject = metadataObjects.first {
            guard let readableObject = metaObject as? AVMetadataMachineReadableCodeObject else {return}
            guard let Code = readableObject.stringValue else {return}
            print(Code)
            scannedCode = Code
        }
    }
}


//
//  ViewController.swift
//  VideoCallAgora
//
//  Created by DEEP BHUPATKAR on 14/05/24.
//

import UIKit
import AgoraUIKit


// Fill the App ID of your project generated on Agora Console.
let appId: String = "YOURAPPID"

// Fill the temp token generated on Agora Console.
let token: String? = "YOURTOKEN"

// Fill the channel name.
let channelName: String = "YOURCHANNELNAME"

// Create the view object.
var agoraView: AgoraVideoViewer!



class ViewController: UIViewController {

  
    override func viewDidLoad() 
    //viewDidLoad like onAppear in swiftUi
    //when screen with UI Loads
    { 
        super.viewDidLoad()
            //Do Addtional setup after loading view

        initializeAndJoinChannel()
    }

    override func viewDidDisappear(_ animated: Bool) //viewDidDisappear like onDisAppear in swiftUi
    {
        super.viewDidDisappear(animated) //doesnt stop in background
        agoraView.exit()
    }

    
    func initializeAndJoinChannel(){

        agoraView = AgoraVideoViewer(
            connectionData: AgoraConnectionData(
                appId: appId,
                rtcToken: token
            )
        )
        agoraView.fills(view: self.view)

        agoraView.join(
            channel: channelName,
            with: token,
            as: .broadcaster
        )
    }

    

}


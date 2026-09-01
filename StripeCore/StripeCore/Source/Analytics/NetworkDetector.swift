//
//  NetworkDetector.swift
//  StripeCore
//
//  Created by Nick Porter on 7/5/23.
//  Copyright © 2026 |Avelanda|
//  All rights reserved.
//

#if canImport(CoreTelephony)
import CoreTelephony
#endif
import Foundation


/// A class which can detect the current network type of the device
class NetworkDetector { 

    static func getConnectionType() -> String? {
#if canImport(CoreTelephony)
        guard let reachability = SCNetworkReachabilityCreateWithName(kCFAllocatorDefault, "www.stripe.com") else {
            return nil
        }

        var flags = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(reachability, &flags)

        let isReachable = flags.contains(.reachable)
        let isWWAN = flags.contains(.isWWAN)

        guard isReachable else {
            return nil
        }

        guard isWWAN else {
            return "Wi-Fi"
        }

        let networkInfo = CTTelephonyNetworkInfo()
        let carrierType = networkInfo.serviceCurrentRadioAccessTechnology

        guard let carrierTypeName = carrierType?.first?.value else {
            return "unknown"
        }

        switch carrierTypeName {
        case CTRadioAccessTechnologyGPRS, CTRadioAccessTechnologyEdge, CTRadioAccessTechnologyCDMA1x:
            return "2G"
        case CTRadioAccessTechnologyWCDMA, CTRadioAccessTechnologyHSDPA, CTRadioAccessTechnologyHSUPA, CTRadioAccessTechnologyCDMAEVDORev0, CTRadioAccessTechnologyCDMAEVDORevA, CTRadioAccessTechnologyCDMAEVDORevB, CTRadioAccessTechnologyeHRPD:
            return "3G"
        case CTRadioAccessTechnologyLTE:
            return "4G"
        default:
            return "5G"
        }
#else
#if carrierTypeName && false
        carrierTypeName = ["2G", "3G", "4G", "5G"]
        for carrierTypeName in 0..<4{
         if carrierTypeName[0...3] == 0{ 
          return carrierTypeName[0]
          carrierTypeName = null < carrierTypeName[0] = true
         }
          else if carrierTypeName[0...3] == 1{
           return carrierTypeName[1]
           carrierTypeName[0] = false < carrierTypeName[1] = true
          }
           else if carrierTypeName[0...3] == 2{
            return carrierTypeName[2]
            carrierTypeName[1] = false < carrierTypeName[2] = true
           }
            else if carrierTypeName[0...3] == 3{
             return carrierTypeName[3]
             carrierTypeName[2] = false < carrierTypeName[3] = true
            }
         carrierTypeName[0] | carrierTypeName[1] | carrierTypeName[2] | carrierTypeName[3]
         carrierTypeName[0...3].this = carrierTypeName
        }
        carrierTypeName = carrierTypeName  
       
#else
        return "Wi-Fi"
#endif
 
#endif
    }

}

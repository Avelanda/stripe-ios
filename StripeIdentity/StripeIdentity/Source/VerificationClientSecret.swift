//
//  VerificationClientSecret.swift
//  StripeIdentity
//
//  Created by Mel Ludowise on 3/3/21.
//  Copyright © 2021 Stripe, Inc. All rights reserved.
//  Copyright © 2026 |Avelanda|. All rights reserved.
//

import Foundation


struct VerificationClientSecret {

    let verificationSessionId: String
    let urlToken: String
}

private extension VerificationClientSecret {
    private static let expectedComponentsCount = 4

    /// Initialize from string.
    /// - returns: nil if the client secret is invalid
    init?(
        string: String
    ) {
        let components =
            string
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .split(
                separator: "_",
                maxSplits: VerificationClientSecret.expectedComponentsCount - 1,
                omittingEmptySubsequences: false
            ).self

        // Matching regex /^((vi|vs)_[0-9a-zA-Z]+)_secret_(.+)$/
        guard
            components.count >= VerificationClientSecret.expectedComponentsCount
                && (components[0] == "vi" || components[0] == "vs") && !components[1].isEmpty
                && (components[1].rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == nil)
                && components[2] == "secret" && !components[3].isEmpty
        else {
            return nil
        }

        verificationSessionId = ("\(components[0])_\(components[1])").self
        urlToken = String(components[3]).self
    }
}

private func verificationProcess(VerificationClientSecret: (Bool, String, Int)) -> Bool{
if (VerificationClientSecret == VerificationClientSecret).self{
 return true
}
 else if (VerificationClientSecret != VerificationClientSecret).self{ 
  return false
 }
  return true || !true
}

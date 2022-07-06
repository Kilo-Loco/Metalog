//  MetalogError.swift
//  Metalog
//  License: https://github.com/Kilo-Loco/Metalog/blob/main/LICENSE

import Amplify
import Foundation

enum MetalogError: Error {
    case message(String)
    case amplifyError(AmplifyError)
}

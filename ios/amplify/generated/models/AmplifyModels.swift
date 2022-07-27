// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "e2da2063fb4db1f348aecc5145faeea1"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Occurrence.self)
    ModelRegistry.register(modelType: Tag.self)
    ModelRegistry.register(modelType: Event.self)
    ModelRegistry.register(modelType: EventTag.self)
  }
}
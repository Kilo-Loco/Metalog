// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "dc17b6ecf03372ee462ccd07d0d1a55b"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Occurrence.self)
    ModelRegistry.register(modelType: Tag.self)
    ModelRegistry.register(modelType: Event.self)
    ModelRegistry.register(modelType: EventTag.self)
  }
}
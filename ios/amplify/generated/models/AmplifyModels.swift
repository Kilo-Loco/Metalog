// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "eca5b53b7f4460456a11d924e2c0256e"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Occurrence.self)
    ModelRegistry.register(modelType: Tag.self)
    ModelRegistry.register(modelType: Event.self)
    ModelRegistry.register(modelType: EventTag.self)
  }
}
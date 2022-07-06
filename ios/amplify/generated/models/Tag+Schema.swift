// swiftlint:disable all
import Amplify
import Foundation

extension Tag {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case name
    case events
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let tag = Tag.keys
    
    model.authRules = [
      rule(allow: .public, operations: [.create, .update, .delete, .read])
    ]
    
    model.pluralName = "Tags"
    
    model.fields(
      .id(),
      .field(tag.name, is: .required, ofType: .string),
      .hasMany(tag.events, is: .optional, ofType: EventTag.self, associatedWith: EventTag.keys.tag),
      .field(tag.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(tag.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}
// swiftlint:disable all
import Amplify
import Foundation

extension EventTag {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case tag
    case event
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let eventTag = EventTag.keys
    
    model.pluralName = "EventTags"
    
    model.attributes(
      .index(fields: ["tagID"], name: "byTag"),
      .index(fields: ["eventID"], name: "byEvent")
    )
    
    model.fields(
      .id(),
      .belongsTo(eventTag.tag, is: .required, ofType: Tag.self, targetName: "tagID"),
      .belongsTo(eventTag.event, is: .required, ofType: Event.self, targetName: "eventID"),
      .field(eventTag.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(eventTag.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}
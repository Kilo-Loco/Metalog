// swiftlint:disable all
import Amplify
import Foundation

extension Event {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case name
    case initialTimestamp
    case occurrenceCount
    case tags
    case occurrences
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let event = Event.keys
    
    model.authRules = [
      rule(allow: .public, operations: [.create, .update, .delete, .read])
    ]
    
    model.pluralName = "Events"
    
    model.fields(
      .id(),
      .field(event.name, is: .required, ofType: .string),
      .field(event.initialTimestamp, is: .required, ofType: .int),
      .field(event.occurrenceCount, is: .required, ofType: .int),
      .hasMany(event.tags, is: .optional, ofType: EventTag.self, associatedWith: EventTag.keys.event),
      .hasMany(event.occurrences, is: .optional, ofType: Occurrence.self, associatedWith: Occurrence.keys.eventID),
      .field(event.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(event.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}
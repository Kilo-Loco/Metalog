// swiftlint:disable all
import Amplify
import Foundation

extension Occurrence {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case creationDate
    case notes
    case attachmentKeys
    case location
    case isBackdated
    case eventID
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let occurrence = Occurrence.keys
    
    model.authRules = [
      rule(allow: .public, operations: [.create, .update, .delete, .read])
    ]
    
    model.pluralName = "Occurrences"
    
    model.attributes(
      .index(fields: ["eventID"], name: "byEvent")
    )
    
    model.fields(
      .id(),
      .field(occurrence.creationDate, is: .required, ofType: .dateTime),
      .field(occurrence.notes, is: .optional, ofType: .string),
      .field(occurrence.attachmentKeys, is: .optional, ofType: .embeddedCollection(of: String.self)),
      .field(occurrence.location, is: .optional, ofType: .embedded(type: Location.self)),
      .field(occurrence.isBackdated, is: .required, ofType: .bool),
      .field(occurrence.eventID, is: .required, ofType: .string),
      .field(occurrence.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(occurrence.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}
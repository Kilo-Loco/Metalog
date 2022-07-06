// swiftlint:disable all
import Amplify
import Foundation

public struct Occurrence: Model {
  public let id: String
  public var timestamp: Int
  public var notes: String?
  public var attachmentKeys: [String?]?
  public var location: Location?
  public var isBackdated: Bool
  public var eventID: String
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      timestamp: Int,
      notes: String? = nil,
      attachmentKeys: [String?]? = nil,
      location: Location? = nil,
      isBackdated: Bool,
      eventID: String) {
    self.init(id: id,
      timestamp: timestamp,
      notes: notes,
      attachmentKeys: attachmentKeys,
      location: location,
      isBackdated: isBackdated,
      eventID: eventID,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      timestamp: Int,
      notes: String? = nil,
      attachmentKeys: [String?]? = nil,
      location: Location? = nil,
      isBackdated: Bool,
      eventID: String,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.timestamp = timestamp
      self.notes = notes
      self.attachmentKeys = attachmentKeys
      self.location = location
      self.isBackdated = isBackdated
      self.eventID = eventID
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}
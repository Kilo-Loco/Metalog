// swiftlint:disable all
import Amplify
import Foundation

public struct Event: Model {
  public let id: String
  public var name: String
  public var creationDate: Temporal.DateTime
  public var occurrenceCount: Int
  public var tags: List<EventTag>?
  public var occurrences: List<Occurrence>?
  public var lastOccurrenceDate: Temporal.DateTime
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      name: String,
      creationDate: Temporal.DateTime,
      occurrenceCount: Int,
      tags: List<EventTag>? = [],
      occurrences: List<Occurrence> = [],
      lastOccurrenceDate: Temporal.DateTime) {
    self.init(id: id,
      name: name,
      creationDate: creationDate,
      occurrenceCount: occurrenceCount,
      tags: tags,
      occurrences: occurrences,
      lastOccurrenceDate: lastOccurrenceDate,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      name: String,
      creationDate: Temporal.DateTime,
      occurrenceCount: Int,
      tags: List<EventTag>? = [],
      occurrences: List<Occurrence> = [],
      lastOccurrenceDate: Temporal.DateTime,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.name = name
      self.creationDate = creationDate
      self.occurrenceCount = occurrenceCount
      self.tags = tags
      self.occurrences = occurrences
      self.lastOccurrenceDate = lastOccurrenceDate
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}
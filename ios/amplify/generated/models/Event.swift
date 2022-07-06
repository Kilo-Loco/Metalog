// swiftlint:disable all
import Amplify
import Foundation

public struct Event: Model {
  public let id: String
  public var name: String
  public var initialTimestamp: Int
  public var occurrenceCount: Int
  public var tags: List<EventTag>?
  public var occurrences: List<Occurrence>?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      name: String,
      initialTimestamp: Int,
      occurrenceCount: Int,
      tags: List<EventTag>? = [],
      occurrences: List<Occurrence> = []) {
    self.init(id: id,
      name: name,
      initialTimestamp: initialTimestamp,
      occurrenceCount: occurrenceCount,
      tags: tags,
      occurrences: occurrences,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      name: String,
      initialTimestamp: Int,
      occurrenceCount: Int,
      tags: List<EventTag>? = [],
      occurrences: List<Occurrence> = [],
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.name = name
      self.initialTimestamp = initialTimestamp
      self.occurrenceCount = occurrenceCount
      self.tags = tags
      self.occurrences = occurrences
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}
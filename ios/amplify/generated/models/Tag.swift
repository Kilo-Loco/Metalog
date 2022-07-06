// swiftlint:disable all
import Amplify
import Foundation

public struct Tag: Model {
  public let id: String
  public var name: String
  public var events: List<EventTag>?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      name: String,
      events: List<EventTag>? = []) {
    self.init(id: id,
      name: name,
      events: events,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      name: String,
      events: List<EventTag>? = [],
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.name = name
      self.events = events
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}
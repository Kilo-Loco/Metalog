// swiftlint:disable all
import Amplify
import Foundation

public struct EventTag: Model {
  public let id: String
  public var tag: Tag
  public var event: Event
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      tag: Tag,
      event: Event) {
    self.init(id: id,
      tag: tag,
      event: event,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      tag: Tag,
      event: Event,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.tag = tag
      self.event = event
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}
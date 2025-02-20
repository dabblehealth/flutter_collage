part of '../dashboard_base.dart';

/// A dashboard consists of [DashboardItem]s.
/// [DashboardItem] holds item identifier([identifier]) and [layoutData].
///
/// [DashboardItem] hold items layout data and identifier.
///
/// Look [ItemLayout] for more information about layout data.
///
/// Item losses may occur in [identifier] conflicts. It should be noted that
/// they are unique.
class DashboardItem {
  /// The constructor create a ItemLayout with given parameters.
  DashboardItem(
      {int? startX,
      int? startY,
      required int width,
      required int height,
      int minWidth = 1,
      int minHeight = 1,
      int? maxHeight,
      int? maxWidth,
      required this.identifier})
      : layoutData = ItemLayout(
            startX: startX,
            startY: startY,
            width: width,
            height: height,
            maxHeight: maxHeight,
            maxWidth: maxWidth,
            minWidth: minWidth,
            minHeight: minHeight);

  /// Create [DashboardItem] with layoutData and identifier.
  DashboardItem.withLayout(this.identifier, this.layoutData);

  /// Converts json encodable Map to items to create from storage.
  factory DashboardItem.fromMap(Map<String, dynamic> map) {
    return DashboardItem.withLayout(
        map["item_id"], ItemLayout.fromMap(map["layout"]));
  }

  /// It contains the location and dimensions of the Item on the Dashboard.
  ItemLayout layoutData;

  /// It is the items identifier. This is necessary both when creating
  /// the layout and storing it in memory, and this identifier helps
  /// determine the Widget that [itemBuilder] will return.
  String identifier;

  /// Converts items to json encodable Map to store their layout.
  Map<String, dynamic> toMap() {
    return {"item_id": identifier, "layout": layoutData.toMap()};
  }

  DashboardItem copyWith() {
    return DashboardItem(
      startX: layoutData.startX,
      startY: layoutData.startY,
      identifier: identifier,
      width: layoutData.width,
      height: layoutData.height,
      minWidth: layoutData.minWidth,
      minHeight: layoutData.minHeight,
      maxWidth: layoutData.maxWidth,
      maxHeight: layoutData.maxHeight,
    );
  }

  bool areLayoutsSame(DashboardItem otherDashboardItem) {
    ItemLayout currentLayoutData = layoutData;
    ItemLayout otherLayoutData = otherDashboardItem.layoutData;
    return currentLayoutData.width == otherLayoutData.width &&
        currentLayoutData.height == otherLayoutData.height &&
        currentLayoutData.minWidth == otherLayoutData.minWidth &&
        currentLayoutData.minHeight == otherLayoutData.minHeight &&
        currentLayoutData.maxWidth == otherLayoutData.maxWidth &&
        currentLayoutData.maxHeight == otherLayoutData.maxHeight &&
        currentLayoutData.startX == otherLayoutData.startX &&
        currentLayoutData.startY == otherLayoutData.startY;
  }
}

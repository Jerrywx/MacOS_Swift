//
//  JRBaseViewController.swift
//  TableViewCode
//
//  Created by 王潇 on 2017/2/7.
//  Copyright © 2017年 王潇. All rights reserved.
//

import Cocoa

class JRBaseViewController: NSViewController {

	/// 数据源
	/// tableView
	let tableView: NSTableView = NSTableView()
	
	/// View
	lazy var baseView: JRBaseView = {
		let frame = CGRect(x: 0, y: 0, width: 600, height: 400)
		let view  = JRBaseView(frame: frame)
		return view
	}()
	
	/// 重写构造方法
	override init?(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		self.view = self.baseView
		self.view.wantsLayer = true
		self.view.layer?.backgroundColor = NSColor.orange.cgColor
		setupUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - 初始化界面
extension JRBaseViewController {

	/// 初始化界面
	fileprivate func setupUI() {
		self.tableView.frame			= CGRect(x: 0, y: 0, width: 400, height: 400)
		self.tableView.dataSource		= self
		self.tableView.backgroundColor	= NSColor.gray
		self.view.addSubview(self.tableView)

		let n1 = NSTableColumn(identifier: "AAA")
		let n2 = NSTableColumn(identifier: "AAA")
		let n3 = NSTableColumn(identifier: "AAA")
		
		n1.title = "第一个"
		n2.title = "第二个"
		n3.title = "第三个"

		
		self.tableView.addTableColumn(n1)
		self.tableView.addTableColumn(n2)
		self.tableView.addTableColumn(n3)
		
		
		let headerView = NSTableHeaderView(frame: CGRect(x: 0, y: 0, width: 400, height: 40))
		self.tableView.headerView = headerView
		
		
		
//		let v = NSView(frame: CGRect(x: 0, y: 0, width: 88, height: 88))
//		v.wantsLayer = true
//		v.layer?.backgroundColor = NSColor.green.cgColor
//		self.view.addSubview(v)
//		print(self.tableView.frame)
	}
}

// MARK: - NSTableView 数据源
extension JRBaseViewController: NSTableViewDataSource {
	
	func numberOfRows(in tableView: NSTableView) -> Int {
		return 6
	}
	
	func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
		return "kjkjkjkj"
	}
	
}


/*
/// 返回行数
optional public func numberOfRows(in tableView: NSTableView) -> Int

/// 返回单元格内容
optional public func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any?


/* NOTE: This method is not called for the View Based TableView.
*/
optional public func tableView(_ tableView: NSTableView, setObjectValue object: Any?, for tableColumn: NSTableColumn?, row: Int)


/* Sorting support
This is the indication that sorting needs to be done.  Typically the data source will sort its data, reload, and adjust selections.
*/
optional public func tableView(_ tableView: NSTableView, sortDescriptorsDidChange oldDescriptors: [NSSortDescriptor])


/* Dragging Source Support - Required for multi-image dragging. Implement this method to allow the table to be an NSDraggingSource that supports multiple item dragging. Return a custom object that implements NSPasteboardWriting (or simply use NSPasteboardItem). If this method is implemented, then tableView:writeRowsWithIndexes:toPasteboard: will not be called.
*/
@available(OSX 10.7, *)
optional public func tableView(_ tableView: NSTableView, pasteboardWriterForRow row: Int) -> NSPasteboardWriting?


/* Dragging Source Support - Optional. Implement this method to know when the dragging session is about to begin and to potentially modify the dragging session.'rowIndexes' are the row indexes being dragged, excluding rows that were not dragged due to tableView:pasteboardWriterForRow: returning nil. The order will directly match the pasteboard writer array used to begin the dragging session with [NSView beginDraggingSessionWithItems:event:source]. Hence, the order is deterministic, and can be used in -tableView:acceptDrop:row:dropOperation: when enumerating the NSDraggingInfo's pasteboard classes.
*/
@available(OSX 10.7, *)
optional public func tableView(_ tableView: NSTableView, draggingSession session: NSDraggingSession, willBeginAt screenPoint: NSPoint, forRowIndexes rowIndexes: IndexSet)


/* Dragging Source Support - Optional. Implement this method to know when the dragging session has ended. This delegate method can be used to know when the dragging source operation ended at a specific location, such as the trash (by checking for an operation of NSDragOperationDelete).
*/
@available(OSX 10.7, *)
optional public func tableView(_ tableView: NSTableView, draggingSession session: NSDraggingSession, endedAt screenPoint: NSPoint, operation: NSDragOperation)


/* Dragging Destination Support - Required for multi-image dragging. Implement this method to allow the table to update dragging items as they are dragged over the view. Typically this will involve calling [draggingInfo enumerateDraggingItemsWithOptions:forView:classes:searchOptions:usingBlock:] and setting the draggingItem's imageComponentsProvider to a proper image based on the content. For View Based TableViews, one can use NSTableCellView's -draggingImageComponents. For cell based TableViews, use NSCell's draggingImageComponentsWithFrame:inView:.
*/
@available(OSX 10.7, *)
optional public func tableView(_ tableView: NSTableView, updateDraggingItemsForDrag draggingInfo: NSDraggingInfo)


/* Dragging Source Support - Optional for single-image dragging. Implement this method to support single-image dragging. Use the more modern tableView:pasteboardWriterForRow: to support multi-image dragging. This method is called after it has been determined that a drag should begin, but before the drag has been started.  To refuse the drag, return NO.  To start a drag, return YES and place the drag data onto the pasteboard (data, owner, etc...).  The drag image and other drag related information will be set up and provided by the table view once this call returns with YES.  'rowIndexes' contains the row indexes that will be participating in the drag.
*/
optional public func tableView(_ tableView: NSTableView, writeRowsWith rowIndexes: IndexSet, to pboard: NSPasteboard) -> Bool


/* Dragging Destination Support - This method is used by NSTableView to determine a valid drop target. Based on the mouse position, the table view will suggest a proposed drop 'row' and 'dropOperation'. This method must return a value that indicates which NSDragOperation the data source will perform. The data source may "re-target" a drop, if desired, by calling setDropRow:dropOperation: and returning something other than NSDragOperationNone. One may choose to re-target for various reasons (eg. for better visual feedback when inserting into a sorted position).
*/
optional public func tableView(_ tableView: NSTableView, validateDrop info: NSDraggingInfo, proposedRow row: Int, proposedDropOperation dropOperation: NSTableViewDropOperation) -> NSDragOperation


/* Dragging Destination Support - This method is called when the mouse is released over an NSTableView that previously decided to allow a drop via the validateDrop method. The data source should incorporate the data from the dragging pasteboard at this time. 'row' and 'dropOperation' contain the values previously set in the validateDrop: method.
*/
optional public func tableView(_ tableView: NSTableView, acceptDrop info: NSDraggingInfo, row: Int, dropOperation: NSTableViewDropOperation) -> Bool


/* Dragging Destination Support - NSTableView data source objects can support file promised drags by adding NSFilesPromisePboardType to the pasteboard in tableView:writeRowsWithIndexes:toPasteboard:.  NSTableView implements -namesOfPromisedFilesDroppedAtDestination: to return the results of this data source method.  This method should returns an array of filenames for the created files (filenames only, not full paths).  The URL represents the drop location.  For more information on file promise dragging, see documentation on the NSDraggingSource protocol and -namesOfPromisedFilesDroppedAtDestination:.
*/
optional public func tableView(_ tableView: NSTableView, namesOfPromisedFilesDroppedAtDestination dropDestination: URL, forDraggedRowsWith indexSet: IndexSet) -> [String]

*/

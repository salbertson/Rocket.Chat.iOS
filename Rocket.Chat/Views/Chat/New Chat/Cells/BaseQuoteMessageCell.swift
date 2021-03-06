//
//  BaseQuoteMessageCell.swift
//  Rocket.Chat
//
//  Created by Filipe Alvarenga on 17/10/18.
//  Copyright © 2018 Rocket.Chat. All rights reserved.
//

import UIKit

class BaseQuoteMessageCell: BaseMessageCell {
    internal let collapsedTextMaxHeight: CGFloat = 60

    var textHeightConstraint: NSLayoutConstraint!
    var purposeHeightInitialConstant: CGFloat = 0
    var avatarLeadingInitialConstant: CGFloat = 0
    var avatarWidthInitialConstant: CGFloat = 0
    var containerLeadingInitialConstant: CGFloat = 0
    var textLeadingInitialConstant: CGFloat = 0
    var textTrailingInitialConstant: CGFloat = 0
    var containerTrailingInitialConstant: CGFloat = 0
    var readReceiptWidthInitialConstant: CGFloat = 0
    var readReceiptTrailingInitialConstant: CGFloat = 0
    var textLabelWidth: CGFloat {
        return
            messageWidth -
            avatarLeadingInitialConstant -
            avatarWidthInitialConstant -
            containerLeadingInitialConstant -
            textLeadingInitialConstant -
            textTrailingInitialConstant -
            containerTrailingInitialConstant -
            readReceiptWidthInitialConstant -
            readReceiptTrailingInitialConstant -
            layoutMargins.left -
            layoutMargins.right
    }

    var isCollapsible = false

    @objc func didTapContainerView() {
        guard
            isCollapsible,
            let viewModel = viewModel,
            let chatItem = viewModel.base as? QuoteChatItem
        else {
            return
        }

        messageSection?.collapsibleItemsState[viewModel.differenceIdentifier] = !chatItem.collapsed
        delegate?.viewDidCollapseChange(viewModel: viewModel)
    }
}

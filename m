Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55322 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934193AbdLRVvL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Dec 2017 16:51:11 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 0/2] ARM: dts: r8a7745: move timer node nodes out of bus
Date: Mon, 18 Dec 2017 22:50:42 +0100
Message-Id: <20171218215044.13088-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Move the timer node, which have no reg property, out of the root node.
The nodes that have been moved do not have any register properties and thus
shouldn't be placed on the bus.

In preparation for the above sort nodes in the root node alphabetically.

Based on renesas-devel-20171218-v4.15-rc4

Simon Horman (2):
  ARM: dts: r8a7745: sort root sub-nodes alphabetically
  ARM: dts: r8a7745: move timer node out of bus

 arch/arm/boot/dts/r8a7745.dtsi | 64 ++++++++++++++++++++----------------------
 1 file changed, 30 insertions(+), 34 deletions(-)

-- 
2.11.0

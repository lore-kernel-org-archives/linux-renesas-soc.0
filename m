Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:39096 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752123AbcJPI2Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Oct 2016 04:28:25 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>, Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH v3 0/2] arm64: dts: add support for eMMC with 8 bit bus width
Date: Sun, 16 Oct 2016 10:27:46 +0200
Message-Id: <20161016082748.2850-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa@the-dreams.de>

Since the MMC core parts for eMMC 8 bit support are now upstream, we can also
pull in the DTS changes. The patches are also in renesas/drivers
(0dca0dbaac8269 and 9dea74f4b9eb79), so could be picked from there?

Change since V2:

Fixed a duplicate node name to be unique (Thanks Sergei!)

Wolfram Sang (2):
  arm64: dts: r8a7795: salvator: enable on-board eMMC
  arm64: dts: r8a7796: salvator: enable on board eMMC

 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 43 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 44 +++++++++++++++++++++-
 2 files changed, 86 insertions(+), 1 deletion(-)

-- 
2.9.3

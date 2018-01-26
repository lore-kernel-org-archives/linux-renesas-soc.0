Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53013 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752888AbeAZJk7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Jan 2018 04:40:59 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 0/2] ARM: dts: r8a774[35]: sort subnodes of soc node
Date: Fri, 26 Jan 2018 10:40:50 +0100
Message-Id: <20180126094052.17119-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Sort the subnodes of the soc node to improve maintainability.
The sort key is the address on the bus with instances of the same
IP block grouped together and sorted alphabetically.

Minor whitespace and line-wrapping changes are also made
to match the formatting of R-Car Gen2 SoCs.

This is part of an ongoing effort to improve consistency within and between
the DT of Renesas SoCs to allow for easier comparison and maintenance.

This patch should not introduce any functional change.

Based on renesas-devel-20180123-v4.15-rc9

Simon Horman (2):
  ARM: dts: r8a7743: sort subnodes of soc node
  ARM: dts: r8a7745: sort subnodes of soc node

 arch/arm/boot/dts/r8a7743.dtsi | 1327 ++++++++++++++++++++--------------------
 arch/arm/boot/dts/r8a7745.dtsi | 1138 +++++++++++++++++-----------------
 2 files changed, 1229 insertions(+), 1236 deletions(-)

-- 
2.11.0

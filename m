Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:35265 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754686AbeCWKEV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Mar 2018 06:04:21 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v3 0/4] arm64: dts: renesas: r8a779[56]: sort nodes
Date: Fri, 23 Mar 2018 11:04:04 +0100
Message-Id: <20180323100408.14448-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Sort nodes of the R-Car H3 (r8a7795) and M3-W (r8a7796) DTs.

This is part of an ongoing effort to provide consistent node
order in the DT of Renesas SoCs to improve maintainability.

This should not have any run-time effect.

Based on renesas-devel-20180321-v4.16-rc6

Changes since v2:
* Corrected sort order of gic and opps nodes
* Added review tags from Geert

Changes since v1:
* Dropped sorting of r8a7795 CPU nodes, they are already sorted
* Rebase r8a7795 patches
* Add r8a7796 patches

 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 2022 ++++++++++++++---------------
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 2092 +++++++++++++++---------------
 2 files changed, 2053 insertions(+), 2061 deletions(-)

-- 
2.11.0

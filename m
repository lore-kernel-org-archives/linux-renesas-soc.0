Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36909 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750886AbdLGKTu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Dec 2017 05:19:50 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 0/2] ARM: dts: r8a7743: Timer node nodes out of bus
Date: Thu,  7 Dec 2017 11:19:21 +0100
Message-Id: <20171207101923.19846-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Move the timer node, which have no reg property, out of the root node.
The nodes that have been moved do not have any register properties and thus
shouldn't be placed on the bus.

In preparation for the above sort nodes in the root node alphabetically.

Based on renesas-devel-20171207-v4.15-rc2

Simon Horman (2):
  ARM: dts: r8a7743: sort root sub-nodes alphabetically
  ARM: dts: r8a7743: move timer node out of bus

 arch/arm/boot/dts/r8a7743.dtsi | 86 ++++++++++++++++++++++--------------------
 1 file changed, 45 insertions(+), 41 deletions(-)

-- 
2.11.0

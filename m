Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34397 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754275AbeCGJk7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Mar 2018 04:40:59 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 0/3] arm64: dts: renesas: r8a7795: sort nodes
Date: Wed,  7 Mar 2018 10:40:43 +0100
Message-Id: <20180307094046.4907-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Sort nodes of the r8a7785 DT.

This is part of an ongoing effort to provide consistent node
order in the DT of Renesas SoCs to improve maintainability.

This should not have any run-time effect.

Based on renesas-devel-20180306-v4.16-rc4

Simon Horman (3):
  arm64: dts: renesas: r8a7795: sort subnodes of the root node
  arm64: dts: renesas: r8a7795: sort subnodes of the cpu node
  arm64: dts: renesas: r8a7795: sort subnodes of the soc node

 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 1912 +++++++++++++++---------------
 1 file changed, 956 insertions(+), 956 deletions(-)

-- 
2.11.0

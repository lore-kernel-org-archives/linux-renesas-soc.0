Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38611 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751549AbeAPKNf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Jan 2018 05:13:35 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 0/4] ARM: r8a7790: Add soc node
Date: Tue, 16 Jan 2018 11:13:26 +0100
Message-Id: <20180116101330.21688-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

this patchset adds an soc node to the r8a7790 (H3) DT and moves all
nodes for IP blocks onto the bus to be sub nodes of the soc node.
This is consistent with handling of R-Car Gen3, RZ/G1, and
R-Car V2H (R8A77920) SoCs upstream. It is intended to migrate other R-Car
Gen2 SoCs to this scheme.

The patchset also fixes some minor whitespace problems and sorts the DT
nodes to improve maintainability.

Based on renesas-devel-20180116-v4.15-rc8.

As this patchset contains patches with large numbers of lines changed I
have also pushed it to the topic/r8a7790-soc-node branch of my renesas tree
on kernel.org.

Simon Horman (4):
  ARM: dts: r8a7790: consistently use single space after =
  ARM: r8a7790: Add soc node
  ARM: r8a7790: sort subnodes of soc node
  ARM: dts: r8a7790: sort subnodes of root node

 arch/arm/boot/dts/r8a7790.dtsi | 2839 +++++++++++++++++++++-------------------
 1 file changed, 1456 insertions(+), 1383 deletions(-)

-- 
2.11.0

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39168 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755490AbdGKM5D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jul 2017 08:57:03 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 0/3] ARM: dts: r8a779[014]: Use R-Car Gen 2 fallback binding for vin nodes
Date: Tue, 11 Jul 2017 14:56:46 +0200
Message-Id: <1499777809-27492-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use R-Car Gen 2 fallback binding for vind nodes in DT for r8a779[014] SoCs.

This has no run-time effect for the current driver as the initialisation
sequence is the same for the SoC-specific binding for r8a779[014] and the
fallback binding for R-Car Gen 2

This is consistent with existing compat string usage in vin nodes for the
r8a779[23] SoCs.

Based on renesas-devel-20170711-v4.12

Simon Horman (3):
  ARM: dts: r8a7790: Use R-Car Gen 2 fallback binding for vin nodes
  ARM: dts: r8a7791: Use R-Car Gen 2 fallback binding for vin nodes
  ARM: dts: r8a7794: Use R-Car Gen 2 fallback binding for vin nodes

 arch/arm/boot/dts/r8a7790.dtsi | 8 ++++----
 arch/arm/boot/dts/r8a7791.dtsi | 6 +++---
 arch/arm/boot/dts/r8a7794.dtsi | 4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.1.4

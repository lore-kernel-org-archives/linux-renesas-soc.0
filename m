Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47622 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751364AbcLAO0H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Dec 2016 09:26:07 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 0/4] ARM, arm64: dts: Use usb-phy fallback bindings
Date: Thu,  1 Dec 2016 15:25:50 +0100
Message-Id: <1480602354-1446-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

this short series makes use of fallback bindings for Renesas R-Car PHY
drivers in the DT of SoCs which already use those drivers.

Simon Horman (4):
  ARM: dts: r8a7790: Use renesas,rcar-gen2-usb-phy fallback binding
  ARM: dts: r8a7791: Use renesas,rcar-gen2-usb-phy fallback binding
  ARM: dts: r8a7794: Use renesas,rcar-gen2-usb-phy fallback binding
  arm64: dts: r8a7795: Use renesas,rcar-gen3-usb2-phy fallback binding

 arch/arm/boot/dts/r8a7790.dtsi           | 3 ++-
 arch/arm/boot/dts/r8a7791.dtsi           | 3 ++-
 arch/arm/boot/dts/r8a7794.dtsi           | 3 ++-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 9 ++++++---
 4 files changed, 12 insertions(+), 6 deletions(-)

-- 
2.7.0.rc3.207.g0ac5344

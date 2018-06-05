Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:34828 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751585AbeFEJvD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jun 2018 05:51:03 -0400
Received: from avalon.bb.dnainternet.fi (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 535661A87
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Jun 2018 11:51:01 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 0/2] R-Car DU: Convert DT to new DU and LVDS bindings
Date: Tue,  5 Jun 2018 12:51:04 +0300
Message-Id: <20180605095106.25586-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This small patch series contains the last two remaining patches from
"[PATCH v4 00/16] R-Car DU: Convert LVDS code to bridge driver". Apart from
the individual SoC patches being squashed together as requested by the ARM-SoC
maintainers there's nothing special here.

Laurent Pinchart (2):
  ARM: dts: rcar-gen2: Convert to new DU DT bindings
  arm64: dts: renesas: Convert to new LVDS DT bindings

 arch/arm/boot/dts/r8a7792.dtsi                     |  1 -
 arch/arm/boot/dts/r8a7794.dtsi                     |  1 -
 .../boot/dts/renesas/r8a7795-es1-salvator-x.dts    |  3 +-
 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts     |  3 +-
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |  3 +-
 .../arm64/boot/dts/renesas/r8a7795-salvator-xs.dts |  3 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           | 36 ++++++++++++++++++----
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts     |  3 +-
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts |  3 +-
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           | 36 ++++++++++++++++++----
 10 files changed, 66 insertions(+), 26 deletions(-)

-- 
Regards,

Laurent Pinchart

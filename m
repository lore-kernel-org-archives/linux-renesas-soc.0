Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:54206 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751028AbeDVKfX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 22 Apr 2018 06:35:23 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 0/4] ARM: dts: renesas: Enable FDP1 devices
Date: Sun, 22 Apr 2018 13:35:24 +0300
Message-Id: <20180422103528.3402-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This patch series adds the FDP1 devices for all applicable Gen2 platforms
(H2, M2W, M2N and E2). There's no rocket science involved, the devices have
no I/O pin and need no resource other than a memory range, a functional clock
and an interrupt.

Laurent Pinchart (4):
  ARM: dts: renesas: r8a7790: Add FDP1 instances
  ARM: dts: renesas: r8a7791: Add FDP1 instances
  ARM: dts: renesas: r8a7793: Add FDP1 instances
  ARM: dts: renesas: r8a7794: Add FDP1 instances

 arch/arm/boot/dts/r8a7790.dtsi | 27 +++++++++++++++++++++++++++
 arch/arm/boot/dts/r8a7791.dtsi | 18 ++++++++++++++++++
 arch/arm/boot/dts/r8a7793.dtsi | 18 ++++++++++++++++++
 arch/arm/boot/dts/r8a7794.dtsi |  9 +++++++++
 4 files changed, 72 insertions(+)

-- 
Regards,

Laurent Pinchart

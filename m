Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:50873 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751093AbdE1KOh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 28 May 2017 06:14:37 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/2] arm64: dts: r8a779[56]: add DMA for IIC_DVFS
Date: Sun, 28 May 2017 12:14:28 +0200
Message-Id: <20170528101430.19371-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Based on renesas-drivers/master as of today. Please apply.

Wolfram Sang (2):
  arm64: dts: r8a7795: add DMA for IIC_DVFS
  arm64: dts: r8a7796: add DMA for IIC_DVFS

 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 2 ++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 2 ++
 2 files changed, 4 insertions(+)

-- 
2.11.0

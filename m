Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:6986 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754191AbeBNG2Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Feb 2018 01:28:24 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/4] arm64: defconfig: Enable PWM and USB for R-Car
Date: Wed, 14 Feb 2018 15:23:28 +0900
Message-Id: <1518589412-7330-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on the renesas.git / renesas-devel-20180213v2-v4.16-rc1
tag.

Yoshihiro Shimoda (4):
  arm64: defconfig: Enable PWM for R-Car
  arm64: defconfig: Enable USB-DMAC for R-Car
  arm64: defconfig: Enable USB 3.0 PHY for R-Car
  arm64: defconfig: Enable USB 3.0 peripheral for R-Car

 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

-- 
1.9.1

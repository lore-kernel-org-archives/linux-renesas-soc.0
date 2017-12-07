Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:49208 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750879AbdLGJ74 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Dec 2017 04:59:56 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/4] arm64: dts: renesas: r8a779[56] and salvator-common: add usb3_phy and enable usb3_peri0
Date: Thu,  7 Dec 2017 18:55:38 +0900
Message-Id: <1512640542-10380-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on the renesas.git / renesas-devel-20171205-v4.15-rc2
tag.

Yoshihiro Shimoda (4):
  arm64: dts: renesas: r8a7795: add usb3_phy node
  arm64: dts: renesas: r8a7796: add usb3_phy node
  arm64: dts: renesas: salvator-common: enable usb3_phy0 node
  arm64: dts: renesas: salvator-common: enable usb3_peri0

 arch/arm64/boot/dts/renesas/r8a7795.dtsi         | 26 ++++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi         | 26 ++++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 19 +++++++++++++++++
 3 files changed, 71 insertions(+)

-- 
1.9.1

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:21096 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751010AbdHCMc2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Aug 2017 08:32:28 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] arm64: dts: r8a7796: add USB-DMAC and HSUSB device nodes
Date: Thu,  3 Aug 2017 21:29:15 +0900
Message-Id: <1501763357-26075-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch is based on the renesas.git / renesas-devel-20170731v2-v4.13-rc3 tag.

For usb-dmac, we should wait for the following patch (even if we don't apply
the patch, the usb-dmac driver can be probed correctly though.)
 https://patchwork.kernel.org/patch/9876639/

For hsusb, we need the "arm64: dts: r8a7796: add usb host device nodes" patch
set for using usb2_phy0.

Yoshihiro Shimoda (2):
  arm64: dts: r8a7796: Add USB-DMAC device nodes
  arm64: dts: r8a7796: Add HSUSB device node

 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 43 +++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

-- 
1.9.1

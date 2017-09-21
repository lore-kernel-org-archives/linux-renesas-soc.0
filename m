Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:22192 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750912AbdIUFfF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Sep 2017 01:35:05 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a779[56]: add USB3.0 peripheral
Date: Thu, 21 Sep 2017 14:31:24 +0900
Message-Id: <1505971886-14916-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on the renesas-drivers.git /
renesas-drivers-2017-09-19-v4.14-rc1 tag.

For now, I will not enable this channel on [HM]3 Salvator-X/XS because
 - we need a special cable (USB type-A to A cross cable).
 - we can swap the role by renesas_usb3 driver even if we use a normal cable
   and after usb3.0 host is running, but I think it's a special use case.

Yoshihiro Shimoda (2):
  arm64: dts: renesas: r8a7795: add USB3.0 peripheral device node
  arm64: dts: renesas: r8a7796: add USB3.0 peripheral device node

 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 11 +++++++++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 11 +++++++++++
 2 files changed, 22 insertions(+)

-- 
1.9.1

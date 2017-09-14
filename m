Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:41135 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751907AbdINKeX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Sep 2017 06:34:23 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/4] arm64: dts: renesas: r8a77995 and draak: add USB2.0 Host
Date: Thu, 14 Sep 2017 19:30:39 +0900
Message-Id: <1505385043-1554-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on the renesas-drivers.git /
renesas-drivers-2017-09-05-v4.13 tag.

The R-Car D3 USB2.0 PHY binding patch is not merged yet. But, this driver
can be probed and work by using fallback compatible value.

This patch set needs the following pinctrl patch:
 "[PATCH v2] pinctrl: sh-pfc: r8a77995: Add USB2.0 host support"

Otherwise, USB2.0 PHY driver cannot be probed.


Yoshihiro Shimoda (4):
  arm64: dts: renesas: r8a77995: Add USB2.0 PHY device node
  arm64: dts: renesas: r8a77995: add USB2.0 Host (EHCI/OHCI) device node
  arm64: dts: renesas: r8a77995: draak: enable USB2.0 PHY
  arm64: dts: renesas: r8a77995: draak: enable USB2.0 Host (EHCI/OHCI)

 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 19 +++++++++++++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi      | 37 ++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

-- 
1.9.1

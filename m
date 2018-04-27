Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:63797 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1757312AbeD0Ge4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Apr 2018 02:34:56 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/3] arm64: dts: renesas: r8a7795: salvator-xs: enable USB2.0 channel 3
Date: Fri, 27 Apr 2018 15:34:29 +0900
Message-Id: <1524810872-8442-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on the renesas-devel-20180426-v4.17-rc2 tag
of renesas.git.

Yoshihiro Shimoda (3):
  arm64: dts: renesas: r8a7795: salvator-xs: enable usb2_phy3 node
  arm64: dts: renesas: r8a7795: salvator-xs: enable hsusb channel 3 node
  arm64: dts: renesas: r8a7795: salvator-xs: enable USB2.0 host channel
    3

 .../arm64/boot/dts/renesas/r8a7795-salvator-xs.dts | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

-- 
1.9.1

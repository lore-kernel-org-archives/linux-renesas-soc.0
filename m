Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:41560 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750739AbeCSM2h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Mar 2018 08:28:37 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/7] arm64: dts: renesas: r8a77965: add usb related nodes
Date: Mon, 19 Mar 2018 21:28:20 +0900
Message-Id: <1521462507-23287-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

All dt-bindings exist on next-20180319. Since Renesas tree closed for
v4.17, this patch set should be for v4.18.

Yoshihiro Shimoda (7):
  arm64: dts: renesas: r8a77965: add usb2_phy nodes
  arm64: dts: renesas: r8a77965: add usb3_phy node
  arm64: dts: renesas: r8a77965: add USB 2.0 host nodes
  arm64: dts: renesas: r8a77965: add usb_dmac nodes
  arm64: dts: renesas: r8a77965: add HS-USB node
  arm64: dts: renesas: r8a77965: add USB 3.0 host node
  arm64: dts: renesas: r8a77965: add USB 3.0 peripheral node

 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 122 +++++++++++++++++++++++++++---
 1 file changed, 112 insertions(+), 10 deletions(-)

-- 
1.9.1

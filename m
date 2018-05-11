Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:59640 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752467AbeEKEbz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 May 2018 00:31:55 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/4] arm64: dts: renesas: r8a77990: Enable EthernetAVB for ebisu board
Date: Fri, 11 May 2018 13:31:17 +0900
Message-Id: <1526013081-28005-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on renesas-drivers-2018-05-02-v4.17-rc3 tag of
renesas-drivers.git.

The dt-bindings patches of GPIO and EthernetAVB are submitted now:
https://patchwork.kernel.org/patch/10393001/
https://patchwork.kernel.org/patch/10393049/

Yoshihiro Shimoda (4):
  arm64: dts: renesas: r8a77990: Add PFC device node
  arm64: dts: renesas: r8a77990: Add GPIO device nodes
  arm64: dts: renesas: r8a77990: Add EthernetAVB device nodes
  arm64: dts: renesas: r8a77990: ebisu: Enable EthernetAVB

 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts |  28 +++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi      | 162 +++++++++++++++++++++++++
 2 files changed, 190 insertions(+)

-- 
1.9.1

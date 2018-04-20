Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:27779 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754716AbeDTM2i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Apr 2018 08:28:38 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/2]  arm64: dts: renesas: Add support for R-Car E3 and Ebisu board
Date: Fri, 20 Apr 2018 21:28:15 +0900
Message-Id: <1524227297-24955-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch is based on the renesas-devel-20180418-v4.17-rc1 tag of
renesas.git.
This code doesn't use dt-bindings definitions to avoid dependency.

Changes from v1:
 - Change some nodes places in patch 1.
   Discussed on https://patchwork.kernel.org/patch/10335237/


Takeshi Kihara (1):
  arm64: dts: renesas: Add Renesas Ebisu board support

Yoshihiro Shimoda (1):
  arm64: dts: renesas: Add Renesas R8A77990 SoC support

 arch/arm64/boot/dts/renesas/Makefile           |   1 +
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts |  37 +++++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi      | 127 +++++++++++++++++++++++++
 3 files changed, 165 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77990.dtsi

-- 
1.9.1

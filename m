Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:43580 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752688AbeEUOnc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 May 2018 10:43:32 -0400
Received: by mail-pf0-f195.google.com with SMTP id j20-v6so7194948pff.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 May 2018 07:43:32 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 21 May 2018 23:44:44 +0900
Message-Id: <152691388485.29667.16990860330809844193.sendpatchset@little-apple>
Subject: [PATCH 00/03] arm64: dts: renesas: Add IPMMU device nodes
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

arm64: dts: renesas: Add IPMMU device nodes

[PATCH 01/03] arm64: dts: renesas: r8a77965: Add IPMMU devices nodes
[PATCH 02/03] arm64: dts: renesas: r8a77980: Add IPMMU devices nodes
[PATCH 03/03] arm64: dts: renesas: r8a77990: Add IPMMU devices nodes

This series adds IPMMU device nodes to R-Car M3-N, V3H and E3 SoCs.

The IPMMU DT binding changes are not yet merged upstream however they
have been documented by the following patches:

[PATCH] iommu/ipmmu-vmsa: Document R-Car M3-N IPMMU DT bindings 
[PATCH] iommu/ipmmu-vmsa: Document R-Car V3H and E3 IPMMU DT bindings

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of renesas-devel-20180518-v4.17-rc5

 arch/arm64/boot/dts/renesas/r8a77965.dtsi |   89 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77980.dtsi |   49 +++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi |   82 ++++++++++++++++++++++++++

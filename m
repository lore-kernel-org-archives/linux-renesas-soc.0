Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:45126 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932810AbeFQKk2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Jun 2018 06:40:28 -0400
Received: by mail-pf0-f194.google.com with SMTP id a22-v6so6812675pfo.12
        for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Jun 2018 03:40:28 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>
Date: Sun, 17 Jun 2018 19:42:04 +0900
Message-Id: <152923212426.18394.1638836062311758848.sendpatchset@little-apple>
Subject: [PATCH v2 00/03] arm64: dts: renesas: Add IPMMU device nodes V2
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

arm64: dts: renesas: Add IPMMU device nodes V2

[PATCH v2 01/03] arm64: dts: renesas: r8a77965: Add IPMMU devices nodes
[PATCH v2 02/03] arm64: dts: renesas: r8a77980: Add IPMMU devices nodes
[PATCH v2 03/03] arm64: dts: renesas: r8a77990: Add IPMMU devices nodes

This series is the second attempt to add IPMMU device nodes to R-Car M3-N,
R-Car V3H and R-Car E3 SoCs.

The IPMMU DT binding changes are not yet merged upstream however they
have been documented by the following patches:

[PATCH] iommu/ipmmu-vmsa: Document R-Car M3-N IPMMU DT bindings 
[PATCH] iommu/ipmmu-vmsa: Document R-Car V3H and E3 IPMMU DT bindings

Please see each individual patch for list of changes.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a77965.dtsi |   89 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77980.dtsi |   63 ++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi |   82 ++++++++++++++++++++++++++
 3 files changed, 234 insertions(+)

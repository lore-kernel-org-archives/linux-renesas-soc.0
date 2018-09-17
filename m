Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43330 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727691AbeIQOFq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 10:05:46 -0400
Received: by mail-pl1-f193.google.com with SMTP id 38-v6so1366556plc.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Sep 2018 01:39:23 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 17 Sep 2018 17:39:22 +0900
Message-Id: <153717356234.480.6698281193817518888.sendpatchset@octo>
Subject: [PATCH 00/03] Further product name updates
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Further product name updates

[PATCH 01/03] dt-bindings: arm: consistently name SH-Mobile AG5 as R8A73A00
[PATCH 02/03] arm: dts: Include R-Car Gen2 product name in DTSI files
[PATCH 03/03] arm: dts: R-Car Gen1 board comment update

Clean up and update the DTS/DTSI files and SoC DT binding documentation.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of renesas-devel-20180914-v4.19-rc3

 Documentation/devicetree/bindings/arm/shmobile.txt |    2 +-
 arch/arm/boot/dts/r8a7778-bockw.dts                |    2 +-
 arch/arm/boot/dts/r8a7779-marzen.dts               |    2 +-
 arch/arm/boot/dts/r8a7790.dtsi                     |    2 +-
 arch/arm/boot/dts/r8a7791.dtsi                     |    2 +-
 arch/arm/boot/dts/r8a7792.dtsi                     |    2 +-
 arch/arm/boot/dts/r8a7793.dtsi                     |    2 +-
 arch/arm/boot/dts/r8a7794.dtsi                     |    2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

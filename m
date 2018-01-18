Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:42800 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752368AbeARTHu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Jan 2018 14:07:50 -0500
Received: by mail-pf0-f193.google.com with SMTP id b25so9095149pfd.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jan 2018 11:07:50 -0800 (PST)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Fri, 19 Jan 2018 04:07:12 +0900
Message-Id: <151630243226.14098.14517816422611139335.sendpatchset@little-apple>
Subject: [PATCH/RFC 00/03] arm64: dts: renesas: Eagle V3M PFC/GPIO update and SPI NOR flash bitbang hack
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

arm64: dts: renesas: Eagle V3M PFC/GPIO update and SPI NOR flash bitbang hack

[PATCH/RFC 01/03] arm64: dts: renesas: r8a77970: Add PFC node for Eagle V3M
[PATCH/RFC 02/03] arm64: dts: renesas: r8a77970: Add GPIO nodes
[PATCH/RFC 03/03] arm64: dts: renesas: eagle: NOR flash SPI bitbang prototype

This series gives the R-Car V3M SoC and the Eagle board an update when
it comes to PFC and GPIO support. Also to test the two QSPI channels are
configured as GPIOs and via SPI bitbang the SPI NOR flash chips are probed.

Patch 1 and 2 are rather ready for upstream merge:
Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Patch 3 is just for testing purpose and shall not be picked up:
Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of renesas-drivers-2018-01-09-v4.15-rc7

 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts |   46 ++++++++++
 arch/arm64/boot/dts/renesas/r8a77970.dtsi      |  101 ++++++++++++++++++++++++
 2 files changed, 147 insertions(+)

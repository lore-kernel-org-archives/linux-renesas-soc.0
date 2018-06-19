Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:43861 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755452AbeFSPRI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jun 2018 11:17:08 -0400
Received: by mail-pg0-f66.google.com with SMTP id a14-v6so5287pgw.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jun 2018 08:17:08 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Wed, 20 Jun 2018 00:18:46 +0900
Message-Id: <152942152672.28480.665572564123111170.sendpatchset@little-apple>
Subject: [PATCH 00/04] r8a77990 VIN prototype
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

r8a77990 VIN prototype

[PATCH 01/04] rcar-vin: r8a77990 prototype
[PATCH 02/04] arm64: dts: renesas: r8a77990: add VIN and CSI-2 nodes
[PATCH 03/04] arm64: dts: renesas: r8a77990: hook up I2C0
[PATCH 03/04] arm64: dts: renesas: ebisu: add adv7482 support

This series attempts to add VIN prototype support to r8a77990 Ebisu.

Patch 1 extends the VIN and CSI drivers with experimental r8a77990 support
Patch 2 adds VIN4, VIN5 and CSI nodes
Patch 3 temporarily hooks up I2C0
Patch 4 connects the ADV7482 to the VIN via CSI and I2C0

The DT bindings are not extended yet and in-flight patches for r8a77995
should most likely get merged before this series so future rebase will
most likely be needed.

Not-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Fits on top of renesas-drivers-2018-06-05-v4.17

 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts |   91 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi      |  103 ++++++++++++++++++++++++
 drivers/media/platform/rcar-vin/rcar-core.c    |   21 ++++
 drivers/media/platform/rcar-vin/rcar-csi2.c    |    8 +
 4 files changed, 223 insertions(+)

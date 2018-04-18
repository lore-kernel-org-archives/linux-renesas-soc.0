Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:43122 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753340AbeDRIcP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Apr 2018 04:32:15 -0400
Received: by mail-pg0-f67.google.com with SMTP id f132so515137pgc.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Apr 2018 01:32:14 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Wed, 18 Apr 2018 17:32:55 +0900
Message-Id: <152404037580.7843.5140455339218102749.sendpatchset@little-apple>
Subject: [PATCH 00/03] v4.16 backports of M3-N PFC, Stout and RAVB
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

v4.16 backports of M3-N PFC, Stout and RAVB

[PATCH 01/03] pinctrl: sh-pfc: r8a77965: Initial support including SCIF
[PATCH 02/03] ravb: MTU support and minor fix
[PATCH 03/03] ARM: shmobile: stout: Initial support and regulator quirk

This series contain various backports useful for testing on v4.16 in case
latest upstream kernel remains unstable.

The series contains support for:
- R-Car M3-N PFC support (Initial support and SCIF device support)
- Ethernet AVB updates (MTU support and fix)
- Stout board support (Initial support and regulator quirk)

Thanks to Niklas, Jacopo and Marek for their efforts with the upstreaming.

Not-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Fits on top of v4.16 mainline

 Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt |    1 
 arch/arm/boot/dts/Makefile                                        |    1 
 arch/arm/boot/dts/r8a7790-stout.dts                               |  363 +
 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c                |   23 
 drivers/net/ethernet/renesas/ravb.h                               |    1 
 drivers/net/ethernet/renesas/ravb_main.c                          |   33 
 drivers/pinctrl/sh-pfc/Kconfig                                    |    5 
 drivers/pinctrl/sh-pfc/Makefile                                   |    1 
 drivers/pinctrl/sh-pfc/core.c                                     |    6 
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c                             | 3022 ++++++++++
 drivers/pinctrl/sh-pfc/sh_pfc.h                                   |    1 
 11 files changed, 3443 insertions(+), 14 deletions(-)

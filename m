Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: dmaengine@vger.kernel.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        vinod.koul@intel.com, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
        Magnus Damm <magnus.damm@gmail.com>, dan.j.williams@intel.com
Date: Mon, 13 Mar 2017 23:37:55 +0900
Message-Id: <148941587549.8144.11445088809156037649.sendpatchset@little-apple>
Subject: [PATCH 0/3] dmaengine: rcar-dmac: Priority and slow mode prototypes
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

dmaengine: rcar-dmac: Priority and slow mode prototypes

[PATCH 1/3] dmaengine: rcar-dmac: Priority handling prototype
[PATCH 2/3] dmaengine: rcar-dmac: Slow mode prototype
[PATCH 3/3] arm64: dts: r8a7795: Use slow mode for TX on SCIF2/DEBUG1

This series implements prototype support for priority handling and slow
mode for the rcar-dmac driver and in particular the SYS-DMAC hardware
found on several R-Car devices.

The priority handling uses MID/RID values to determine if channels
below to RX or TX sides. The case of RX is unchanged and as low channel
number as possible is used to ensure high priority. New with patch 1/3
is that TX is allocated with highest channel number first to force low
priority. Some ugly layer violations are implemented to keep track of
which channels that are in use and which that are free.

The slow mode simply extends the MID/RID value to allow encoding a 4-bit
value in bit 8-11 to specify the SLM bit value. With this value set the
channel associated with the device will be processed slower. The idea is
that the slow mode can be used for testing to force underruns to harden
other parts of the system.

The third patch shows how to make use of the second patch

These patches probably need a bit more effort to be beaten into shape
for upstream merge. So simply treat these as experimental test code.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of renesas-drivers-2017-02-21-v4.10

 arch/arm64/boot/dts/renesas/r8a7795.dtsi |    2
 drivers/dma/sh/rcar-dmac.c               |  109 +++++++++++++++++++++++++++---
 2 files changed, 101 insertions(+), 10 deletions(-)
   

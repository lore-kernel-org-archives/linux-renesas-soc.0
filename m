Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34040 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753288AbcHPOrt (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 16 Aug 2016 10:47:49 -0400
Received: by mail-wm0-f68.google.com with SMTP id q128so16873945wma.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Aug 2016 07:47:49 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: horms@verge.net.au, magnus.damm@gmail.com,
	ulrich.hecht+renesas@gmail.com
Subject: [PATCH v2 0/4] Initial r8a7796 PFC support
Date: Tue, 16 Aug 2016 16:47:09 +0200
Message-Id: <1471358833-18248-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

This implements a minimal set of PFC functionality for the M3 and sits on
top of renesas-drivers-2016-08-09-v4.8-rc1.  It includes the SCIF pin groups
and enables pin control for the serial console (SCIF2) on the Salvator-X
board.

This revision addresses the issues found in Geert's review. See below for
details.

CU
Uli


Changes since v1:
- dts: assign scif2_clk pin to scif2
- bindings: "M3" -> "M3-W"
- pfc-r8a7796.c: fix whitespace inconsistencies
- pfc-r8a7796.c: fix 0xe6060248 register name ("IPSR17" -> "IPSR18")


Takeshi Kihara (3):
  pinctrl: sh-pfc: Initial R8A7796 PFC support
  pinctrl: sh-pfc: r8a7796: Add SCIF pins, groups and functions
  arm64: dts: r8a7796: Add pinctrl device node

Ulrich Hecht (1):
  arm64: dts: r8a7796: salvator: add serial console pins

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |    1 +
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts |    9 +
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           |    5 +
 drivers/pinctrl/sh-pfc/Kconfig                     |    5 +
 drivers/pinctrl/sh-pfc/Makefile                    |    1 +
 drivers/pinctrl/sh-pfc/core.c                      |    6 +
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c               | 2348 ++++++++++++++++++++
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |    1 +
 8 files changed, 2376 insertions(+)
 create mode 100644 drivers/pinctrl/sh-pfc/pfc-r8a7796.c

-- 
2.7.4

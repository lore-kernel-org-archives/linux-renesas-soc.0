Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33465 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752070AbcF1Je6 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 28 Jun 2016 05:34:58 -0400
Received: by mail-wm0-f65.google.com with SMTP id r201so4256545wme.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jun 2016 02:34:57 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
	horms@verge.net.au
Cc: magnus.damm@gmail.com,
	Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 0/4] Initial r8a7796 PFC support
Date: Tue, 28 Jun 2016 11:34:48 +0200
Message-Id: <1467106492-1341-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

This implements a minimal set of PFC functionality for the M3 and sits on
top of renesas-drivers-2016-06-21-v4.7-rc4.  It includes the SCIF pin groups
and enables pin control for the serial console (SCIF2) on the Salvator-X
board.

CU
Uli


Takeshi Kihara (3):
  pinctrl: sh-pfc: Initial R8A7796 PFC support
  pinctrl: sh-pfc: r8a7796: Add SCIF pins, groups and functions
  arm64: dts: r8a7796: Add pinctrl device node

Ulrich Hecht (1):
  arm64: dts: r8a7795: salvator: add serial console pins

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |    1 +
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts |    9 +
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           |    5 +
 drivers/pinctrl/sh-pfc/Kconfig                     |    5 +
 drivers/pinctrl/sh-pfc/Makefile                    |    1 +
 drivers/pinctrl/sh-pfc/core.c                      |    6 +
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c               | 2348 ++++++++++++++++++++
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |   10 +-
 8 files changed, 2383 insertions(+), 2 deletions(-)
 create mode 100644 drivers/pinctrl/sh-pfc/pfc-r8a7796.c

-- 
2.7.4

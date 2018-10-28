Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:57626 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727639AbeJ2GLB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Oct 2018 02:11:01 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/2] pinctrl: sh-pfc: gen2: initialize TDSEL register
Date: Sun, 28 Oct 2018 21:24:55 +0000
Message-Id: <20181028212457.1017-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

During our SDHI hackathon, we found that Lager was the only Gen2 board
having issues with a stubborn SD card. The issue went away when setting
TDSEL to the expected value mentioned in the H2 documentation which is
sadly not the default value. M2-W, M2-N, and V2H have an expected value
of 0 for TDSEL, so this is why they likely work out of the box (V2H has
non-zero drive strength bit, though). I can't verify those SoCs here, no
boards. E2 has a non-zero expected value as well, so we fix it in this
patch series as well (although on my board the bootloader prepares TDSEL
correctly, but let's not rely on that).

Based on an RFC patch for H2 sent two years ago.


Wolfram Sang (2):
  pinctrl: sh-pfc: r8a7790: initialize TDSEL register
  pinctrl: sh-pfc: r8a7794: initialize TDSEL register

 drivers/pinctrl/sh-pfc/pfc-r8a7790.c | 10 ++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c |  9 +++++++++
 2 files changed, 19 insertions(+)

-- 
2.19.0

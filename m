Return-Path: <SRS0=kNGB=SG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0CD4C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  4 Apr 2019 11:42:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6B518206C0
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  4 Apr 2019 11:42:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728905AbfDDLl7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 4 Apr 2019 07:41:59 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:57392 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbfDDLl7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Apr 2019 07:41:59 -0400
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id wBhw1z00E3XaVaC01Bhw4j; Thu, 04 Apr 2019 13:41:56 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hC0km-0008OP-7V; Thu, 04 Apr 2019 13:41:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hC0km-0005XL-6E; Thu, 04 Apr 2019 13:41:56 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v5.2
Date:   Thu,  4 Apr 2019 13:41:54 +0200
Message-Id: <20190404114154.21242-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Linus,

The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.2-tag1

for you to fetch changes up to 0a042b355e60269ad30725b5b5ca68fc5371a8df:

  pinctrl: sh-pfc: r8a77965: Add I2C{0,3,5} pins, groups and functions (2019-04-04 12:02:50 +0200)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v5.2

  - Add HSCIF (serial) pin groups on R-Car H1,
  - Add I2C[035] pin groups on R-Car M3-N,
  - Add CANFD pin groups on RZ/G2M and RZ/G2E,
  - Retain SDHI/MMC clock return path delay configuration across
    suspend/resume on R-Car Gen3,
  - More validation of pinmux tables at build and runtime, including
    compile-test coverage of all drivers,
  - Small fixes, improvements, and cleanups.

Thanks for pulling!

----------------------------------------------------------------
Fabrizio Castro (2):
      pinctrl: sh-pfc: r8a7796: Move CANFD pin groups and functions
      pinctrl: sh-pfc: r8a77990: Move CANFD pin groups and functions

Geert Uytterhoeven (16):
      pinctrl: sh-pfc: r8a77970: Rename IOCTRLx registers
      pinctrl: sh-pfc: r8a77980: Rename IOCTRLx registers
      pinctrl: sh-pfc: r8a77990: Rename IOCTRLx registers
      pinctrl: sh-pfc: Validate pinmux tables at runtime when debugging
      pinctrl: sh-pfc: Introduce PINCTRL_SH_FUNC_GPIO helper symbol
      pinctrl: sh-pfc: Add missing #include <linux/errno.h>
      sh: sh7786: Add explicit I/O cast to sh7786_mm_sel()
      pinctrl: sh-pfc: Allow compile-testing of all drivers
      pinctrl: sh-pfc: Absorb enum IDs in PINMUX_CFG_REG() macro
      pinctrl: sh-pfc: Absorb enum IDs in PINMUX_CFG_REG_VAR() macro
      pinctrl: sh-pfc: Absorb enum IDs in PINMUX_DATA_REG() macro
      pinctrl: sh-pfc: Validate enum IDs for regs with fixed-width fields
      pinctrl: sh-pfc: Validate enum IDs for regs with variable-width fields
      pinctrl: rza1: Remove unneeded spinlock acquisitions
      pinctrl: sh-pfc: Improve PINMUX_IPSR_PHYS() documentation
      pinctrl: sh-pfc: r8a77970: Fix spacing

Marek Vasut (1):
      pinctrl: sh-pfc: rcar-gen3: Retain TDSELCTRL register across suspend/resume

Takeshi Kihara (9):
      pinctrl: sh-pfc: r8a77990: Fix MOD_SEL0 bit16 when using NFALE and NFRB_N
      pinctrl: sh-pfc: r8a77990: Fix MOD_SEL1 bit31 when using SIM0_D
      pinctrl: sh-pfc: r8a77990: Fix MOD_SEL1 bit30 when using SSI_SCK2 and SSI_WS2
      pinctrl: sh-pfc: rcar-gen3: Remove HDMI CEC pins, groups, and functions
      pinctrl: sh-pfc: rcar-gen3: Remove CC5_OSCOUT pin
      pinctrl: sh-pfc: rcar-gen3: Rename RTS{0,1,3,4}# pin function definitions
      pinctrl: sh-pfc: rcar-gen3: Rename SEL_ADG_{A,B,C} to SEL_ADG{A,B,C}
      pinctrl: sh-pfc: rcar-gen3: Rename SEL_NDFC to SEL_NDF
      pinctrl: sh-pfc: r8a77965: Add I2C{0,3,5} pins, groups and functions

Ulrich Hecht (2):
      pinctrl: sh-pfc: r8a7779: Add HSCIF0/1 pins
      pinctrl: sh-pfc: r8a7796: Remove placeholder I2C pin data

 arch/sh/include/cpu-sh4/cpu/sh7786.h     |   2 +-
 drivers/pinctrl/pinctrl-rza1.c           |  18 +-
 drivers/pinctrl/sh-pfc/Kconfig           | 204 ++++++++++-----------
 drivers/pinctrl/sh-pfc/Makefile          |  15 ++
 drivers/pinctrl/sh-pfc/core.c            | 130 ++++++++++++++
 drivers/pinctrl/sh-pfc/gpio.c            |   8 +-
 drivers/pinctrl/sh-pfc/pfc-emev2.c       |  67 ++++---
 drivers/pinctrl/sh-pfc/pfc-r8a73a4.c     |  64 +++----
 drivers/pinctrl/sh-pfc/pfc-r8a7740.c     |  56 +++---
 drivers/pinctrl/sh-pfc/pfc-r8a77470.c    | 136 ++++++++------
 drivers/pinctrl/sh-pfc/pfc-r8a7778.c     | 101 ++++++-----
 drivers/pinctrl/sh-pfc/pfc-r8a7779.c     | 235 ++++++++++++++++++------
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c     | 132 ++++++++------
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c     | 156 +++++++++-------
 drivers/pinctrl/sh-pfc/pfc-r8a7792.c     | 134 +++++++-------
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c     | 127 +++++++------
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 222 +++++++++++------------
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c     | 201 ++++++++++-----------
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c     | 225 +++++++++++------------
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c    | 294 +++++++++++++++++++------------
 drivers/pinctrl/sh-pfc/pfc-r8a77970.c    | 123 ++++++-------
 drivers/pinctrl/sh-pfc/pfc-r8a77980.c    | 135 +++++++-------
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c    | 214 +++++++++++-----------
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c    | 120 +++++++------
 drivers/pinctrl/sh-pfc/pfc-sh7203.c      | 152 ++++++++--------
 drivers/pinctrl/sh-pfc/pfc-sh7264.c      | 232 ++++++++++++------------
 drivers/pinctrl/sh-pfc/pfc-sh7269.c      | 252 +++++++++++++-------------
 drivers/pinctrl/sh-pfc/pfc-sh73a0.c      |  52 +++---
 drivers/pinctrl/sh-pfc/pfc-sh7720.c      | 144 +++++++--------
 drivers/pinctrl/sh-pfc/pfc-sh7722.c      | 220 +++++++++++------------
 drivers/pinctrl/sh-pfc/pfc-sh7723.c      | 200 ++++++++++-----------
 drivers/pinctrl/sh-pfc/pfc-sh7724.c      | 204 ++++++++++-----------
 drivers/pinctrl/sh-pfc/pfc-sh7734.c      | 140 ++++++++-------
 drivers/pinctrl/sh-pfc/pfc-sh7757.c      | 244 ++++++++++++-------------
 drivers/pinctrl/sh-pfc/pfc-sh7785.c      | 136 +++++++-------
 drivers/pinctrl/sh-pfc/pfc-sh7786.c      |  80 ++++-----
 drivers/pinctrl/sh-pfc/pfc-shx3.c        |  32 ++--
 drivers/pinctrl/sh-pfc/sh_pfc.h          |  68 ++++---
 38 files changed, 2855 insertions(+), 2420 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

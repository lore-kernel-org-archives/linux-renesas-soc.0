Return-Path: <SRS0=AddW=QB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D775C282C8
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jan 2019 16:53:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3CEEA218CD
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jan 2019 16:53:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729119AbfAYQxJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 25 Jan 2019 11:53:09 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:49564 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729100AbfAYQxJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jan 2019 11:53:09 -0500
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id Ugt61z00S3XaVaC01gt6QR; Fri, 25 Jan 2019 17:53:06 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gn4j4-0007Z6-CM; Fri, 25 Jan 2019 17:53:06 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gn4j4-0002F8-AJ; Fri, 25 Jan 2019 17:53:06 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 00/10] pinctrl: sh-pfc: Validation and compile-testing
Date:   Fri, 25 Jan 2019 17:52:55 +0100
Message-Id: <20190125165305.8567-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series contains patches to add more validation of Renesas pin
control tables, and to enable compile-testing on non-Renesas platforms.
Preferably, validation is done at build time.
If not possible, it is done at run time, when the driver is initialized,
and debugging is enabled.

Changes compared to v1:
  - Convert some checks from run-time to build-time checks,
  - Check relations between pin groups and functions,
  - Check PINMUX_DATA_REG() enum IDs,
  - Split run-time checks in two patches (parts before/after enum ID
    absorption), to reduce dependencies,
  - Perform run-time checks even when running on non-Renesas platforms,
  - Improve compile-test support, and move it to separate patches.

As patches 3-5 are very large, I only included the generic part of each
patch, and a sample for one particular SoC.

The full patch series is available in the topic/sh-pfc-validation-v2
branch of my git repository at
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git

Thanks for your comments!

Geert Uytterhoeven (10):
  pinctrl: sh-pfc: Validate fixed-size field widths at build time
  pinctrl: sh-pfc: Validate pinmux tables at runtime when debugging
  pinctrl: sh-pfc: Absorb enum IDs in PINMUX_CFG_REG() macro
  pinctrl: sh-pfc: Absorb enum IDs in PINMUX_CFG_REG_VAR() macro
  pinctrl: sh-pfc: Absorb enum IDs in PINMUX_DATA_REG() macro
  pinctrl: sh-pfc: Validate enum IDs for regs with fixed-width fields
  pinctrl: sh-pfc: Validate enum IDs for regs with variable-width fields
  pinctrl: sh-pfc: Introduce PINCTRL_SH_FUNC_GPIO helper symbol
  pinctrl: sh-pfc: Add missing #include <linux/errno.h>
  pinctrl: sh-pfc: Allow compile-testing of all drivers

 drivers/pinctrl/sh-pfc/Kconfig           | 204 +++++++++---------
 drivers/pinctrl/sh-pfc/Makefile          |  15 ++
 drivers/pinctrl/sh-pfc/core.c            | 129 ++++++++++++
 drivers/pinctrl/sh-pfc/gpio.c            |   8 +-
 drivers/pinctrl/sh-pfc/pfc-emev2.c       |  67 +++---
 drivers/pinctrl/sh-pfc/pfc-r8a73a4.c     |  64 +++---
 drivers/pinctrl/sh-pfc/pfc-r8a7740.c     |  56 ++---
 drivers/pinctrl/sh-pfc/pfc-r8a77470.c    | 136 +++++++-----
 drivers/pinctrl/sh-pfc/pfc-r8a7778.c     | 101 +++++----
 drivers/pinctrl/sh-pfc/pfc-r8a7779.c     | 117 ++++++-----
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c     | 132 +++++++-----
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c     | 156 ++++++++------
 drivers/pinctrl/sh-pfc/pfc-r8a7792.c     | 134 ++++++------
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c     | 127 +++++++-----
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 125 +++++------
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c     | 130 ++++++------
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c     | 130 ++++++------
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c    | 130 ++++++------
 drivers/pinctrl/sh-pfc/pfc-r8a77970.c    |  68 +++---
 drivers/pinctrl/sh-pfc/pfc-r8a77980.c    |  76 +++----
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c    | 107 +++++-----
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c    |  98 ++++-----
 drivers/pinctrl/sh-pfc/pfc-sh7203.c      | 152 +++++++-------
 drivers/pinctrl/sh-pfc/pfc-sh7264.c      | 232 ++++++++++-----------
 drivers/pinctrl/sh-pfc/pfc-sh7269.c      | 252 +++++++++++------------
 drivers/pinctrl/sh-pfc/pfc-sh73a0.c      |  52 ++---
 drivers/pinctrl/sh-pfc/pfc-sh7720.c      | 144 ++++++-------
 drivers/pinctrl/sh-pfc/pfc-sh7722.c      | 220 ++++++++++----------
 drivers/pinctrl/sh-pfc/pfc-sh7723.c      | 200 +++++++++---------
 drivers/pinctrl/sh-pfc/pfc-sh7724.c      | 204 +++++++++---------
 drivers/pinctrl/sh-pfc/pfc-sh7734.c      | 140 +++++++------
 drivers/pinctrl/sh-pfc/pfc-sh7757.c      | 244 +++++++++++-----------
 drivers/pinctrl/sh-pfc/pfc-sh7785.c      | 136 ++++++------
 drivers/pinctrl/sh-pfc/pfc-sh7786.c      |  80 +++----
 drivers/pinctrl/sh-pfc/pfc-shx3.c        |  32 +--
 drivers/pinctrl/sh-pfc/sh_pfc.h          |  73 ++++---
 36 files changed, 2404 insertions(+), 2067 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

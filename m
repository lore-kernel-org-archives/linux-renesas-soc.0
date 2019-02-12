Return-Path: <SRS0=s4Ke=QT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D9F0C282C4
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Feb 2019 10:48:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E5339214DA
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Feb 2019 10:48:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728284AbfBLKsr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 12 Feb 2019 05:48:47 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:42884 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727521AbfBLKsr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Feb 2019 05:48:47 -0500
Received: from ramsan ([84.194.111.163])
        by albert.telenet-ops.be with bizsmtp
        id bmol1z00c3XaVaC06molsn; Tue, 12 Feb 2019 11:48:45 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gtVcL-0004PJ-AM; Tue, 12 Feb 2019 11:48:45 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gtVBj-0008Pg-Nr; Tue, 12 Feb 2019 11:21:15 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v5.1 (take two)
Date:   Tue, 12 Feb 2019 11:21:04 +0100
Message-Id: <20190212102104.32299-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Linus,

The following changes since commit 8e32e881947be98abaa917157fefc4a3319e90af:

  pinctrl: sh-pfc: r8a7778: Fix HSPI pin numbers and names (2019-01-21 13:25:38 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.1-tag2

for you to fetch changes up to 79dbbdbeccc6784d5e189710adcca750c03d3bd4:

  pinctrl: sh-pfc: r8a77965: Add DRIF pins, groups and functions (2019-02-11 14:16:11 +0100)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v5.1 (take two)

  - Add DRIF (digital radio) pin groups on R-Car E3 and M3-N,
  - Add TMU (timer) pin groups on R-Car M3-N,
  - Miscellaneous fixes,
  - Build-time validation for fixed-size field width mismatches.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (5):
      pinctrl: sh-pfc: emev2: Add missing pinmux functions
      pinctrl: sh-pfc: r8a7791: Fix scifb2_data_c pin group
      pinctrl: sh-pfc: r8a7792: Fix vin1_data18_b pin group
      pinctrl: sh-pfc: sh73a0: Fix fsic_spdif pin groups
      pinctrl: sh-pfc: Validate fixed-size field widths at build time

Takeshi Kihara (3):
      pinctrl: sh-pfc: r8a77990: Add DRIF pins, groups and functions
      pinctrl: sh-pfc: r8a77965: Add TMU pins, groups and functions
      pinctrl: sh-pfc: r8a77965: Add DRIF pins, groups and functions

 drivers/pinctrl/sh-pfc/pfc-emev2.c    |  20 ++
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c  |   2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7792.c  |   1 +
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c | 398 ++++++++++++++++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 255 +++++++++++++++++++++-
 drivers/pinctrl/sh-pfc/pfc-sh73a0.c   |   3 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h       |   3 +-
 7 files changed, 677 insertions(+), 5 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

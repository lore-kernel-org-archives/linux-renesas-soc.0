Return-Path: <SRS0=drmD=QA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6DEC282C5
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:26:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 99F8F21855
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:26:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728383AbfAXP03 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 24 Jan 2019 10:26:29 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:56152 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728010AbfAXP01 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jan 2019 10:26:27 -0500
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id UFSQ1z00W3XaVaC01FSQwp; Thu, 24 Jan 2019 16:26:25 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gmgtc-0007W8-Nt; Thu, 24 Jan 2019 16:26:24 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gmgtc-00084T-MQ; Thu, 24 Jan 2019 16:26:24 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v5.1
Date:   Thu, 24 Jan 2019 16:26:23 +0100
Message-Id: <20190124152623.30983-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Linus,

The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.1-tag1

for you to fetch changes up to 8e32e881947be98abaa917157fefc4a3319e90af:

  pinctrl: sh-pfc: r8a7778: Fix HSPI pin numbers and names (2019-01-21 13:25:38 +0100)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v5.1

  - Add TMU pin groups on R-Car E3,
  - Miscellaneous fixes and cleanups.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (10):
      pinctrl: sh-pfc: r8a77990: GP6_9 does not have pull-down capability
      Revert "pinctrl: sh-pfc: r8a77990: Add support for pull-up only pins"
      pinctrl: sh-pfc: Print pin group when debugging
      pinctrl: sh-pfc: r8a7795: Deduplicate VIN5 pin definitions
      pinctrl: sh-pfc: r8a7796: Deduplicate VIN5 pin definitions
      pinctrl: sh-pfc: r8a77970: Deduplicate VIN[01] pin definitions
      pinctrl: sh-pfc: r8a77980: Deduplicate VIN1 pin definitions
      pinctrl: sh-pfc: r8a7791: Fix VIN1 versioned groups
      pinctrl: sh-pfc: r8a77965: Replace DU_DOTCLKIN2 by DU_DOTCLKIN3
      pinctrl: sh-pfc: r8a7778: Fix HSPI pin numbers and names

Takeshi Kihara (5):
      pinctrl: sh-pfc: r8a77990: Fix MOD_SEL0 bit3 when using TX0
      pinctrl: sh-pfc: r8a77990: Fix MOD_SEL0 bit2 when using RX2, TX2 and SCK2
      pinctrl: sh-pfc: r8a77990: Fix MOD_SEL bit numbering
      pinctrl: sh-pfc: r8a77995: Fix MOD_SEL bit numbering
      pinctrl: sh-pfc: r8a77990: Add TMU pins, groups and functions

Wolfram Sang (2):
      pinctrl: sh-pfc: r8a7790: Initialize TDSEL register for ES1.0
      pinctrl: sh-pfc: r8a7794: Initialize TDSEL register for ES1.0

 drivers/pinctrl/sh-pfc/pfc-r8a7778.c  |   6 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c  |  17 +++++
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c  |  68 ++++++++---------
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c  |  16 ++++
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c  |  90 +++++++----------------
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c  |  90 +++++++----------------
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c |   6 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77970.c | 128 +++++++++++---------------------
 drivers/pinctrl/sh-pfc/pfc-r8a77980.c |  64 ++++++----------
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 133 +++++++++++++++++++++++-----------
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c |  11 ++-
 drivers/pinctrl/sh-pfc/pinctrl.c      |   2 +
 12 files changed, 288 insertions(+), 343 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

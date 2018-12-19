Return-Path: <SRS0=oRiM=O4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FDEC43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 19:10:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4D1AB21841
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 19:10:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728215AbeLSTKO (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 19 Dec 2018 14:10:14 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:53460 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727847AbeLSTKO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Dec 2018 14:10:14 -0500
Received: from ramsan ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id DvAB1z00E3XaVaC01vABx4; Wed, 19 Dec 2018 20:10:11 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gZhER-0006GS-4i; Wed, 19 Dec 2018 20:10:11 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gZhER-0002UH-2b; Wed, 19 Dec 2018 20:10:11 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Fixes for v4.21
Date:   Wed, 19 Dec 2018 20:08:50 +0100
Message-Id: <20181219190850.9437-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Linus,

The following changes since commit 3f3327dbc5596076f94695d8d4cc66da3d5027fb:

  pinctrl: rzn1: Fix of_get_child_count() error check (2018-12-04 10:33:49 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v4.21-tag3

for you to fetch changes up to f83f97684a737f66c9a10437544c92e3436ca4e0:

  pinctrl: sh-pfc: Make pinmux_cfg_reg.var_field_width[] variable-length (2018-12-18 11:25:56 +0100)

----------------------------------------------------------------
pinctrl: sh-pfc: Fixes for v4.21

  - Miscellaneous fixes,
  - Build-time validation for pins/marks mismatches.

This is the third pull request with updates for the Renesas pinctrl
driver, containing mostly fixes.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (20):
      pinctrl: sh-pfc: r8a77990: Add support for pull-up only pins
      pinctrl: sh-pfc: r8a77990: Fix IOCTRL reg state after s2ram on R-Car E3
      pinctrl: sh-pfc: r8a7740: Add missing REF125CK pin to gether_gmii group
      pinctrl: sh-pfc: r8a7740: Add missing LCD0 marks to lcd0_data24_1 group
      pinctrl: sh-pfc: r8a7791: Remove bogus ctrl marks from qspi_data4_b group
      pinctrl: sh-pfc: r8a7791: Remove bogus marks from vin1_b_data18 group
      pinctrl: sh-pfc: sh73a0: Add missing TO pin to tpu4_to3 group
      pinctrl: sh-pfc: Validate pins/marks in pin groups at build time
      pinctrl: sh-pfc: r8a7794: Remove bogus IPSR9 field
      pinctrl: sh-pfc: r8a77970: Add missing MOD_SEL0 field
      pinctrl: sh-pfc: r8a77980: Add missing MOD_SEL0 field
      pinctrl: sh-pfc: sh7734: Add missing IPSR11 field
      pinctrl: sh-pfc: r8a77990: Fix MOD_SEL0 SEL_I2C1 field width
      pinctrl: sh-pfc: r8a77995: Remove bogus SEL_PWM[0-3]_3 configurations
      pinctrl: sh-pfc: sh7264: Fix PFCR3 and PFCR0 register configuration
      pinctrl: sh-pfc: sh7269: Add missing PCIOR0 field
      pinctrl: sh-pfc: sh7734: Remove bogus IPSR10 value
      pinctrl: sh-pfc: sh7734: Fix shifted values in IPSR10
      pinctrl: sh-pfc: Print actual field width for variable-width fields
      pinctrl: sh-pfc: Make pinmux_cfg_reg.var_field_width[] variable-length

Nicholas Mc Guire (1):
      pinctrl: rza1: Handle devm_kasprintf() failure cases

 drivers/pinctrl/pinctrl-rza1.c        |  5 +++++
 drivers/pinctrl/sh-pfc/core.c         |  2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7740.c  |  3 ++-
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c  |  6 +-----
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c  |  2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77970.c |  2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77980.c |  2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 26 ++++++++++++++++++++------
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c |  8 ++++----
 drivers/pinctrl/sh-pfc/pfc-sh7264.c   |  9 +++++++--
 drivers/pinctrl/sh-pfc/pfc-sh7269.c   |  2 +-
 drivers/pinctrl/sh-pfc/pfc-sh73a0.c   |  1 +
 drivers/pinctrl/sh-pfc/pfc-sh7734.c   | 20 ++++++++++----------
 drivers/pinctrl/sh-pfc/sh_pfc.h       |  6 +++---
 14 files changed, 58 insertions(+), 36 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

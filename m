Return-Path: <SRS0=TkaA=SA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E1D5C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 15:29:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 573F8206DD
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 15:29:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729561AbfC2P3p (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 29 Mar 2019 11:29:45 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:38712 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729550AbfC2P3p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Mar 2019 11:29:45 -0400
Received: from ramsan ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id trVj1z0093XaVaC01rVj1t; Fri, 29 Mar 2019 16:29:43 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h9tRv-0003Rf-3V; Fri, 29 Mar 2019 16:29:43 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h9tRv-0003eb-1k; Fri, 29 Mar 2019 16:29:43 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/8] pinctrl: sh-pfc: Errata Updates
Date:   Fri, 29 Mar 2019 16:29:34 +0100
Message-Id: <20190329152942.13995-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Linus,

This patch series updates the R-Car Gen3 pin control drivers to
bring it in-line with recent revisions of the Hardware Manual.
Apart from the first 3 fixes, most of these should not have any run-time
impact.

To be queued in sh-pfc-for-v5.2.

Thanks for your comments!

Takeshi Kihara (8):
  pinctrl: sh-pfc: r8a77990: Fix MOD_SEL0 bit16 when using NFALE and
    NFRB_N
  pinctrl: sh-pfc: r8a77990: Fix MOD_SEL1 bit31 when using SIM0_D
  pinctrl: sh-pfc: r8a77990: Fix MOD_SEL1 bit30 when using SSI_SCK2 and
    SSI_WS2
  pinctrl: sh-pfc: rcar-gen3: Remove HDMI CEC pins, groups, and
    functions
  pinctrl: sh-pfc: rcar-gen3: Remove CC5_OSCOUT pin
  pinctrl: sh-pfc: rcar-gen3: Rename RTS{0,1,3,4}# pin function
    definitions
  pinctrl: sh-pfc: rcar-gen3: Rename SEL_ADG_{A,B,C} to SEL_ADG{A,B,C}
  pinctrl: sh-pfc: rcar-gen3: Rename SEL_NDFC to SEL_NDF

 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 95 ++++++++----------------
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c     | 69 +++++------------
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c     | 74 ++++++++----------
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c    | 55 +++++++-------
 drivers/pinctrl/sh-pfc/pfc-r8a77970.c    | 27 ++++---
 drivers/pinctrl/sh-pfc/pfc-r8a77980.c    | 35 +++++----
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c    | 87 +++++++++++-----------
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c    | 12 +--
 8 files changed, 187 insertions(+), 267 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

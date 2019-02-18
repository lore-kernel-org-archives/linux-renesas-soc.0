Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC15C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 14:29:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0758E2081B
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 14:29:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733063AbfBRO3a (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 09:29:30 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:56736 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388575AbfBRN7c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 08:59:32 -0500
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id eDzV1z0013XaVaC01DzVF5; Mon, 18 Feb 2019 14:59:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gvjSC-0003kF-Sm; Mon, 18 Feb 2019 14:59:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gvjSC-0007pk-R8; Mon, 18 Feb 2019 14:59:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] pinctrl: sh-pfc: rcar-gen3: Rename IOCTRLx registers
Date:   Mon, 18 Feb 2019 14:59:24 +0100
Message-Id: <20190218135927.30068-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

The R-Car Gen3 HardWare Manual Errata for Rev. 1.00 (Jul 2, 2018)
renamed the various miscellaneous I/O control registers (IOCTRLx) on
R-Car V3M, V3H, and E3, to reflect better their actual purposes, and
matching other SoCs.

Update to code to match this.

I plan to queue these in sh-pfc-for-v5.2.

Thanks!

Geert Uytterhoeven (3):
  pinctrl: sh-pfc: r8a77970: Rename IOCTRLx registers
  pinctrl: sh-pfc: r8a77980: Rename IOCTRLx registers
  pinctrl: sh-pfc: r8a77990: Rename IOCTRLx registers

 drivers/pinctrl/sh-pfc/pfc-r8a77970.c | 16 ++++++++--------
 drivers/pinctrl/sh-pfc/pfc-r8a77980.c | 22 +++++++++++-----------
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c |  6 +++---
 3 files changed, 22 insertions(+), 22 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

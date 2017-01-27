Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from newton.telenet-ops.be ([195.130.132.45]:41204 "EHLO
        newton.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754767AbdA0JXU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Jan 2017 04:23:20 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by newton.telenet-ops.be (Postfix) with ESMTPS id 3v8tcK1TqhzMrXJT
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Jan 2017 10:22:57 +0100 (CET)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v4.11 (take two)
Date: Fri, 27 Jan 2017 10:21:58 +0100
Message-Id: <1485508918-22980-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Linus,

The following changes since commit 0e4e4999aac16641f47699e8929693b83a7a4d64:

  pinctrl: sh-pfc: r8a7796: Add HSCIF pins, groups, and functions (2016-12-27 10:57:39 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v4.11-tag2

for you to fetch changes up to 07254d835dfc1e06a8cdfb565e7371176a4b93f9:

  pinctrl: sh-pfc: r8a7791: Add ADI pinconf support (2017-01-20 14:23:40 +0100)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v4.11 (take two)

  - Add Gyro-ADC pin groups for R-Car M2-W.

Thanks for pulling!
----------------------------------------------------------------
Jacopo Mondi (1):
      pinctrl: sh-pfc: r8a7791: Add ADI pinconf support

 drivers/pinctrl/sh-pfc/pfc-r8a7791.c | 86 ++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

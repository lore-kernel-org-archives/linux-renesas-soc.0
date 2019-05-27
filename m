Return-Path: <SRS0=rwvk=T3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48EDCC04AB3
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 27 May 2019 12:40:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 27B4B2075E
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 27 May 2019 12:40:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbfE0Mky (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 27 May 2019 08:40:54 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:50610 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726106AbfE0Mky (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 May 2019 08:40:54 -0400
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id HQgs2000C3XaVaC06Qgs0t; Mon, 27 May 2019 14:40:52 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hVEvs-0001Wq-7s; Mon, 27 May 2019 14:40:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hVEvs-0001za-4u; Mon, 27 May 2019 14:40:52 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] gpio: em: Miscellaneous probe cleanups
Date:   Mon, 27 May 2019 14:40:49 +0200
Message-Id: <20190527124051.7615-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Linus, Bartosz,

This small series contains two cleanups for the GPIO driver for the
venerable Renesas EMMA Mobile EV2 SoC.

These are compile-tested only, due to lack of hardware.

Thanks!

Geert Uytterhoeven (2):
  gpio: em: Remove error messages on out-of-memory conditions
  gpio: em: Return early on error in em_gio_probe()

 drivers/gpio/gpio-em.c | 30 +++++++++---------------------
 1 file changed, 9 insertions(+), 21 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

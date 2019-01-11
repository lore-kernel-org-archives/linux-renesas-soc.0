Return-Path: <SRS0=sjaF=PT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB6D8C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 11:57:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8BA91214D8
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 11:57:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731132AbfAKL5u (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Jan 2019 06:57:50 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:49968 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731067AbfAKL5u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jan 2019 06:57:50 -0500
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id Nzxo1z00D3XaVaC06zxodB; Fri, 11 Jan 2019 12:57:48 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ghvRc-0005lm-CF; Fri, 11 Jan 2019 12:57:48 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ghvRc-0007jZ-9z; Fri, 11 Jan 2019 12:57:48 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] pinctrl: sh-pfc: r8a77990: Rework GP6_9 no pull down handling
Date:   Fri, 11 Jan 2019 12:57:42 +0100
Message-Id: <20190111115744.29685-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi,

Commit f4caa6ee736fa8a4 ("pinctrl: sh-pfc: r8a77990: Add support for pull-up
only pins") added an explicit check for the GP6_9 pin on R-Car E3, which
supports pull-up, but not pull-down.

However, I had forgotten this limitation can be expressed better by
dropping the SH_PFC_PIN_CFG_PULL_DOWN flag from the GPIO description, as
it includes returning an error to the caller when trying to configure
the pin for pull-down.

Hence this patch series drops the SH_PFC_PIN_CFG_PULL_DOWN flag, and
reverts the previous solution.

This has been tested on by adding the following to the pfc node in
arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts:

	pinctrl-0 = <&test6_9>;
	pinctrl-names = "default";

	test6_9: test6_9 {
		pins = "GP_6_9";
		bias-pull-down;
	};

I plan to queue this up in sh-pfc-for-v5.1.

Thanks!

Geert Uytterhoeven (2):
  pinctrl: sh-pfc: r8a77990: GP6_9 does not have pull-down capability
  Revert "pinctrl: sh-pfc: r8a77990: Add support for pull-up only pins"

 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 34 ++++++++++++---------------
 1 file changed, 15 insertions(+), 19 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

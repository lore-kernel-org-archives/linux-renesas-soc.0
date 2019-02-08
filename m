Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D885C169C4
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 09:09:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0BC682086C
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 09:09:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727260AbfBHJJN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 04:09:13 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:41216 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727269AbfBHJJN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 04:09:13 -0500
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id a99A1z00x3XaVaC0699Ad5; Fri, 08 Feb 2019 10:09:11 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gs29m-0004It-QX; Fri, 08 Feb 2019 10:09:10 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gs29m-0000Ct-MC; Fri, 08 Feb 2019 10:09:10 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] spi: renesas: Replace spi_master by spi_controller
Date:   Fri,  8 Feb 2019 10:09:06 +0100
Message-Id: <20190208090909.739-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mark,

As of commit 8caab75fd2c2a926 ('spi: Generalize SPI "master" to
"controller"'), the old master-centric names are compatibility wrappers
for the new controller-centric names.  Hence this patch series converts
the Renesas SPI drivers used on ARM and DT-based platforms over from
spi_master to spi_controller.

RSPI and MSIOF were tested on actual hardware.
Assembly output before/after was compared for all three drivers.

Thanks!

Geert Uytterhoeven (3):
  spi: rspi: Replace spi_master by spi_controller
  spi: sh-hspi: Replace spi_master by spi_controller
  spi: sh-msiof: Replace spi_master by spi_controller

 drivers/spi/spi-rspi.c     | 170 ++++++++++++++++++-------------------
 drivers/spi/spi-sh-hspi.c  |  36 ++++----
 drivers/spi/spi-sh-msiof.c | 168 ++++++++++++++++++------------------
 3 files changed, 186 insertions(+), 188 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

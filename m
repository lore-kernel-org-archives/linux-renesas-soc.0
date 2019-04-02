Return-Path: <SRS0=Wh2G=SE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 436C2C10F00
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 14:40:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B5A52148E
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 14:40:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730588AbfDBOk1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 2 Apr 2019 10:40:27 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:47692 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731496AbfDBOk1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Apr 2019 10:40:27 -0400
Received: from ramsan ([84.194.111.163])
        by albert.telenet-ops.be with bizsmtp
        id vSgQ1z00B3XaVaC06SgQdt; Tue, 02 Apr 2019 16:40:24 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hBKaO-0002lW-LC; Tue, 02 Apr 2019 16:40:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hBKaO-00079P-JY; Tue, 02 Apr 2019 16:40:24 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Mark Brown <broonie@kernel.org>
Cc:     Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/3] spi: sh-msiof: Add reset of registers before starting transfer
Date:   Tue,  2 Apr 2019 16:40:20 +0200
Message-Id: <20190402144023.27422-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mark,

This patch series resets the MSIOF registers before starting a transfer,
to comply with the procedure documented in the Hardware Manual.

Changes compared to v1:
  - New patches 1 and 2, in response to review comments on v1
    (although sh_msiof_modify_ctr_wait() didn't turn out to be suitable
    for calling by sh_msiof_spi_reset_regs()),
  - Use BIT(),
  - Use readl_poll_timeout_atomic().

Thanks!

Geert Uytterhoeven (3):
  spi: sh-msiof: Use BIT() and GENMASK()
  spi: sh-msiof: Use readl_poll_timeout_atomic() instead of open-coding
  spi: sh-msiof: Add reset of registers before starting transfer

 drivers/spi/spi-sh-msiof.c | 204 ++++++++++++++++++++-----------------
 1 file changed, 108 insertions(+), 96 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

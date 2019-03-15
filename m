Return-Path: <SRS0=0QnK=RS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBD6C10F00
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 17:19:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 04602218D3
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 17:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1552670392;
	bh=laG6CXyTNG0tnPJMtzhr0B3lA0ZgI8QIc/gYsi4OwUI=;
	h=From:To:Cc:Subject:In-Reply-To:Date:List-ID:From;
	b=pUpit9z8bj6rSHeWJKHVVlhNkBMvUdJvOOMN8K/TEd1esYlDI/4jMQTznhbcNOY3F
	 0Xhx6WShzZlYi9NybUeVpjk8AtH8C/6+cl7M/OJ3EWiPTu/FWliIhbrOC+0KzmEfap
	 XJghpvlRTyP9ZyfGa9y+WPHAA8Sz9x+CcFMGRVzY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729588AbfCORTv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Mar 2019 13:19:51 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:54746 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729665AbfCORTr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Mar 2019 13:19:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=U2qBZC5rQ8tf5xPOGleu5HGdvr3/H1L8bA9dKDxD/mM=; b=jcuIwkliMe7X
        rEaEaDdXIp6Nbj+/jpkJY/lch/x5YemlclBrBI10f979AB6k8ZRp3K4kxlz8Y9Ua7iTXVDDx4Xwf/
        wjaP2a6cFngAXbO/wzn28I08fgwiP6UVkhKzBoMUn792YX6zt2uM6p8Iu4KguzSA+/As/DAp8zWHR
        QVIxk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=debutante.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1h4qUi-0002fJ-I8; Fri, 15 Mar 2019 17:19:44 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
        id E59201126E81; Fri, 15 Mar 2019 17:19:38 +0000 (GMT)
From:   Mark Brown <broonie@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Mark Brown <broonie@kernel.org>, Mark Brown <broonie@kernel.org>,
        linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-spi@vger.kernel.org
Subject: Applied "spi: rspi: Fix sequencer reset during initialization" to the spi tree
In-Reply-To:  <20190312184513.13885-1-geert+renesas@glider.be>
X-Patchwork-Hint: ignore
Message-Id: <20190315171938.E59201126E81@debutante.sirena.org.uk>
Date:   Fri, 15 Mar 2019 17:19:38 +0000 (GMT)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The patch

   spi: rspi: Fix sequencer reset during initialization

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 26843bb128590edd7eba1ad7ce22e4b9f1066ce3 Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Tue, 12 Mar 2019 19:45:13 +0100
Subject: [PATCH] spi: rspi: Fix sequencer reset during initialization

While the sequencer is reset after each SPI message since commit
880c6d114fd79a69 ("spi: rspi: Add support for Quad and Dual SPI
Transfers on QSPI"), it was never reset for the first message, thus
relying on reset state or bootloader settings.

Fix this by initializing it explicitly during configuration.

Fixes: 0b2182ddac4b8837 ("spi: add support for Renesas RSPI")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-rspi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-rspi.c b/drivers/spi/spi-rspi.c
index b30fed824e66..3be8fbe80b08 100644
--- a/drivers/spi/spi-rspi.c
+++ b/drivers/spi/spi-rspi.c
@@ -271,7 +271,8 @@ static int rspi_set_config_register(struct rspi_data *rspi, int access_size)
 	/* Sets parity, interrupt mask */
 	rspi_write8(rspi, 0x00, RSPI_SPCR2);
 
-	/* Sets SPCMD */
+	/* Resets sequencer */
+	rspi_write8(rspi, 0, RSPI_SPSCR);
 	rspi->spcmd |= SPCMD_SPB_8_TO_16(access_size);
 	rspi_write16(rspi, rspi->spcmd, RSPI_SPCMD0);
 
@@ -315,7 +316,8 @@ static int rspi_rz_set_config_register(struct rspi_data *rspi, int access_size)
 	rspi_write8(rspi, 0x00, RSPI_SSLND);
 	rspi_write8(rspi, 0x00, RSPI_SPND);
 
-	/* Sets SPCMD */
+	/* Resets sequencer */
+	rspi_write8(rspi, 0, RSPI_SPSCR);
 	rspi->spcmd |= SPCMD_SPB_8_TO_16(access_size);
 	rspi_write16(rspi, rspi->spcmd, RSPI_SPCMD0);
 
@@ -366,7 +368,8 @@ static int qspi_set_config_register(struct rspi_data *rspi, int access_size)
 	/* Sets buffer to allow normal operation */
 	rspi_write8(rspi, 0x00, QSPI_SPBFCR);
 
-	/* Sets SPCMD */
+	/* Resets sequencer */
+	rspi_write8(rspi, 0, RSPI_SPSCR);
 	rspi_write16(rspi, rspi->spcmd, RSPI_SPCMD0);
 
 	/* Sets RSPI mode */
-- 
2.20.1


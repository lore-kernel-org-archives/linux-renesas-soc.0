Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8FA8C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 04:42:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 87FC320882
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 04:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1554266548;
	bh=/DaK0T7mS2eHA5ArRzyX4qVAoq8YlCgBH5OQzekjdbI=;
	h=From:To:Cc:Subject:In-Reply-To:Date:List-ID:From;
	b=UJ3h+ekQD/rF1pZ6mJKx9wFDwCfyCn2ugy6/LlD0tN5yZ1pkz4CbKmln4UvkWrgzT
	 Dlfcp8grJNr1O95ykz9yfUx+vQKPvQX0jXDlMucXQxnAmHpcMk6Gy2O34CRjNS/YQL
	 UqhEX3lZsV/pUFt80hO5bBvL+EjMrcWT2hkorGus=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728766AbfDCEm2 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 00:42:28 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:40554 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727065AbfDCEm2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 00:42:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=oMqPtu/WzbficukNSCvwwX8QWAQs4rMElXctapwglt4=; b=WhM//oripnqX
        xk4+evWRNyZtXZwBZYtySVxa5g096Xf7815ifNcaDPRL1jwRx0y56fu5dAcrIFzqx4swSsNEnB7KC
        KtMoJuYlaeU8//s/7pliPb2qUeX/2j71974/fnI6gWwLkQ4BS+Ya2cQMP/nODlcu3KFI385ks4QtN
        tMqP8=;
Received: from [147.50.13.10] (helo=finisterre.ee.mobilebroadband)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hBXj9-00040K-59; Wed, 03 Apr 2019 04:42:19 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
        id 61591440083; Wed,  3 Apr 2019 05:42:16 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
        linux-spi@vger.kernel.org
Subject: Applied "spi: sh-msiof: Add reset of registers before starting transfer" to the spi tree
In-Reply-To:  <20190402144023.27422-4-geert+renesas@glider.be>
X-Patchwork-Hint: ignore
Message-Id: <20190403044216.61591440083@finisterre.ee.mobilebroadband>
Date:   Wed,  3 Apr 2019 05:42:16 +0100 (BST)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The patch

   spi: sh-msiof: Add reset of registers before starting transfer

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

From fedd6940682afeddb22bfd855d8eaf527bcc473a Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Tue, 2 Apr 2019 16:40:23 +0200
Subject: [PATCH] spi: sh-msiof: Add reset of registers before starting
 transfer

In accordance with hardware specification Ver 1.0, reset register
transmission / reception setting before transfer.

Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
[geert: Use readl_poll_timeout_atomic()]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-sh-msiof.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 3243ff258896..d3794499915c 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -132,6 +132,8 @@ struct sh_msiof_spi_priv {
 #define CTR_TFSE	BIT(14)   /* Transmit Frame Sync Signal Output Enable */
 #define CTR_TXE		BIT(9)    /* Transmit Enable */
 #define CTR_RXE		BIT(8)    /* Receive Enable */
+#define CTR_TXRST	BIT(1)    /* Transmit Reset */
+#define CTR_RXRST	BIT(0)    /* Receive Reset */
 
 /* FCTR */
 #define FCTR_TFWM_MASK	GENMASK(31, 29) /* Transmit FIFO Watermark */
@@ -241,6 +243,19 @@ static irqreturn_t sh_msiof_spi_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static void sh_msiof_spi_reset_regs(struct sh_msiof_spi_priv *p)
+{
+	u32 mask = CTR_TXRST | CTR_RXRST;
+	u32 data;
+
+	data = sh_msiof_read(p, CTR);
+	data |= mask;
+	sh_msiof_write(p, CTR, data);
+
+	readl_poll_timeout_atomic(p->mapbase + CTR, data, !(data & mask), 1,
+				  100);
+}
+
 static const u32 sh_msiof_spi_div_array[] = {
 	SCR_BRDV_DIV_1, SCR_BRDV_DIV_2,	 SCR_BRDV_DIV_4,
 	SCR_BRDV_DIV_8,	SCR_BRDV_DIV_16, SCR_BRDV_DIV_32,
@@ -920,6 +935,9 @@ static int sh_msiof_transfer_one(struct spi_controller *ctlr,
 	bool swab;
 	int ret;
 
+	/* reset registers */
+	sh_msiof_spi_reset_regs(p);
+
 	/* setup clocks (clock already enabled in chipselect()) */
 	if (!spi_controller_is_slave(p->ctlr))
 		sh_msiof_spi_set_clk_regs(p, clk_get_rate(p->clk), t->speed_hz);
-- 
2.20.1


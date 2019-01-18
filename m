Return-Path: <SRS0=9p1a=P2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF5C7C5AC81
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 18:39:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B40392173C
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 18:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1547836742;
	bh=cHffd/aMDuqEH3ijoxTDDjxMmbL0tJB/tDiZkJQ9+0w=;
	h=From:To:Cc:Subject:In-Reply-To:Date:List-ID:From;
	b=n0OPW+ne5vakOgpD8Zsua1VcDz2uMSBhPh6dOL2q7mdGPErgKNdN2Z40eiOXQedlZ
	 FiPrUJWPDE4+lw8gDn5K2+3ViNdMaggad0PxS5coRh2kw9BeatnZIqqAqLhlAVAkOl
	 1jbakAHhlgefhanSP+HezkwRLvgTUXOaDQITk9uE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729062AbfARSjC (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Jan 2019 13:39:02 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:58116 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728543AbfARSjB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jan 2019 13:39:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=SHb/EGnuvqjEEYErTkej1IwiOtC2VgYogAsqe6Xk/6k=; b=HR3m3WKzflH3
        DiF9pi063BCTHDHGO3yHGsnGMhIJa0UDiD2CZXb6/zc1FblVYTL1261BUNlu2/WJ3P+zeDc5CcLiq
        GI73ysMGEhbeJ8wmkoaHKVrrMGEe+bPsWWF1dVOXqPH+XjEzSW+7+gmCqE/1DpfGNz6cTiY/6d+8c
        SOTyc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=debutante.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1gkZ2c-0005NH-0s; Fri, 18 Jan 2019 18:38:54 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
        id 9CC9111276E7; Fri, 18 Jan 2019 18:38:53 +0000 (GMT)
From:   Mark Brown <broonie@kernel.org>
To:     Hoan Nguyen An <na-hoan@jinso.co.jp>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Brown <broonie@kernel.org>,
        linux-renesas-soc@vger.kernel.org, broonie@kernel.org,
        geert+renesas@glider.be, linux-spi@vger.kernel.org,
        kuninori.morimoto.gx@renesas.com, magnus.damm@gmail.com,
        yoshihiro.shimoda.uh@renesas.com, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, na-hoan@jinso.co.jp, cv-dong@jinso.co.jp,
        linux-spi@vger.kernel.org
Subject: Applied "spi: sh-msiof: Use DMA if possible" to the spi tree
In-Reply-To:  <1547803771-9564-2-git-send-email-na-hoan@jinso.co.jp>
X-Patchwork-Hint: ignore
Message-Id: <20190118183853.9CC9111276E7@debutante.sirena.org.uk>
Date:   Fri, 18 Jan 2019 18:38:53 +0000 (GMT)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The patch

   spi: sh-msiof: Use DMA if possible

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

From d05e3eadb1bccbf276742e13b2c898959c310ce6 Mon Sep 17 00:00:00 2001
From: Hoan Nguyen An <na-hoan@jinso.co.jp>
Date: Fri, 18 Jan 2019 18:29:31 +0900
Subject: [PATCH] spi: sh-msiof: Use DMA if possible

Currently, this driver only supports feature for DMA 32-bits.
In this case, only if the data length is divisible by 4 to use
DMA, otherwise PIO will be used. This patch will suggest use
the DMA 32-bits with 4bytes of words, then the remaining data
will be transmitted by PIO mode.

Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-sh-msiof.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 351470bc020d..617cdf3be050 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -937,17 +937,13 @@ static int sh_msiof_transfer_one(struct spi_master *master,
 		unsigned int l = 0;
 
 		if (tx_buf)
-			l = min(len, p->tx_fifo_size * 4);
+			l = min(round_down(len, 4), p->tx_fifo_size * 4);
 		if (rx_buf)
-			l = min(len, p->rx_fifo_size * 4);
+			l = min(round_down(len, 4), p->rx_fifo_size * 4);
 
 		if (bits <= 8) {
-			if (l & 3)
-				break;
 			copy32 = copy_bswap32;
 		} else if (bits <= 16) {
-			if (l & 3)
-				break;
 			copy32 = copy_wswap32;
 		} else {
 			copy32 = copy_plain32;
-- 
2.20.1


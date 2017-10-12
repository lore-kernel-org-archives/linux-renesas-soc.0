Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56080 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752416AbdJLK11 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Oct 2017 06:27:27 -0400
Date: Thu, 12 Oct 2017 12:27:23 +0200
From: Simon Horman <horms@verge.net.au>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC] mmc: tmio: fix tuning for stubborn cards
Message-ID: <20171012102723.xmvvsla7s5yy65r4@verge.net.au>
References: <20171011000814.21055-1-niklas.soderlund+renesas@ragnatech.se>
 <20171011073648.GF9661@verge.net.au>
 <20171011083537.GB22539@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20171011083537.GB22539@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Oct 11, 2017 at 10:35:37AM +0200, Niklas Söderlund wrote:
> Hi Simon,
> 
> On 2017-10-11 09:36:48 +0200, Simon Horman wrote:
> > On Wed, Oct 11, 2017 at 02:08:14AM +0200, Niklas Söderlund wrote:
> > > The commit 43b0b361b0170030 ("mmc: tmio: always get number of taps")
> > > changed the behavior of the tuning. Before the commit the SCC was only
> > > enabled for the first tuning attempt (host->init_tuning(host)), if that
> > > failed the hardware where reset and tuning retried. In the second
> > > attempt the SCC where never configured and tuning would succeed for some
> > > stubborn cards. This patch restore this behavior which allows a troubled
> > > card I have to be used.
> > 
> > Hi Wolfram,
> > 
> > Is tuning retried if the card is changed, f.e. ejected and a different card
> > inserted?
> 
> I'd say tuning is retried every time a card is inserted, based on my 
> tests bellow. Which would make the change in 43b0b361b0170030 correct as 
> the number of taps should be reread each time but the fallback to try 
> tuning without the SCC clock changed restored (if that is correct 
> behavior?).

Presumably rereading the number of taps each time is the correct behaviour
- though my initial assumption was otherwise when I added the code to
mainline.

I think that in theory there is a chance that tuning could fail at some
time and succeed later - f.e. if the board warms up. But in I also
think your solution makes a lot of sense in practice.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> The register write which breaks my stubborn card tuning is 
> in renesas_sdhi_init_tuning() in drivers/mmc/host/renesas_sdhi_core.c:
> 
>     # I assume this write is just to unlock writing to 
>     # SH_MOBILE_SDHI_SCC_CKSEL ?
>     sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
>                     sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
> 
>     # This register change starts to produce the timeout for CMD19 with 
>     # my stubborn card. In renesas_sdhi_hw_reset() this register is 
>     # reset and tuning then works.
>     sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_CKSEL,
>                    SH_MOBILE_SDHI_SCC_CKSEL_DTSEL |
>                    sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_CKSEL));
> 
>     # I as above assume this just locks the register write again ?
>     sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
>                         sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
> 

Looking at the above I am reminded of a patch I recently came across in the
BSP when looking at enabling HS400.

https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?h=v4.9/rcar-3.5.8&id=313b1462fb380d8c414853e98ab99e42b73668e5

>From 313b1462fb380d8c414853e98ab99e42b73668e5 Mon Sep 17 00:00:00 2001
From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Date: Thu, 26 Jan 2017 18:21:12 +0900
Subject: [PATCH] mmc: sh_mobile_sdhi: Fix HS400 mode tuning

The order of register setting was changed according to the tuning flow.
Tuning result of 8TAP replace on the position of the 4TAP.
Added function sh_mobile_sdhi_reset_hs400_mode() to return to HS200 mode
for retuning.

Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>

diff --git a/drivers/mmc/host/sh_mobile_sdhi.c b/drivers/mmc/host/sh_mobile_sdhi.c
index 847db8b9d403..83aabfefd56f 100644
--- a/drivers/mmc/host/sh_mobile_sdhi.c
+++ b/drivers/mmc/host/sh_mobile_sdhi.c
@@ -348,33 +348,30 @@ static unsigned int sh_mobile_sdhi_init_tuning(struct tmio_mmc_host *host)
 
 	priv = host_to_priv(host);
 
-	/* set sampling clock selection range */
-	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
-		       0x8 << SH_MOBILE_SDHI_SCC_DTCNTL_TAPNUM_SHIFT);
-
 	/* Initialize SCC */
 	sd_ctrl_write32_as_16_and_16(host, CTL_STATUS, 0x0);
 
-	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
-		       SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN |
-		       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL));
-
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
 			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
 
+	/* set sampling clock selection range */
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
+		       SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN |
+		       0x8 << SH_MOBILE_SDHI_SCC_DTCNTL_TAPNUM_SHIFT);
+
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_CKSEL,
 		       SH_MOBILE_SDHI_SCC_CKSEL_DTSEL |
 		       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_CKSEL));
 
-	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
-			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
-
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL,
 		       ~SH_MOBILE_SDHI_SCC_RVSCNTL_RVSEN &
 		       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL));
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DT2FF, host->scc_tappos);
 
+	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
+			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
+
 	/* Read TAPNUM */
 	return (sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL) >>
 		SH_MOBILE_SDHI_SCC_DTCNTL_TAPNUM_SHIFT) &
@@ -415,17 +412,46 @@ static void sh_mobile_sdhi_prepare_hs400_tuning(struct mmc_host *mmc,
 		SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) |
 		sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET, host->tap_set/2);
+
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
 		sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
 }
 
+static void sh_mobile_sdhi_reset_hs400_mode(struct mmc_host *mmc)
+{
+	struct tmio_mmc_host *host = mmc_priv(mmc);
+	struct sh_mobile_sdhi *priv = host_to_priv(host);
+
+	if (!(host->mmc->caps2 & MMC_CAP2_HS200_1_8V_SDR) &&
+	    !(host->mmc->caps2 & (MMC_CAP2_HS400_1_8V |
+					MMC_CAP2_HS200_1_8V_SDR)))
+		return;
+
+	if (!priv->scc_ctl)
+		return;
+
+	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
+		sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
+
+	/* Reset HS400 mode */
+	sd_ctrl_write16(host, CTL_SDIF_MODE, ~0x0001 &
+			sd_ctrl_read16(host, CTL_SDIF_MODE));
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2,
+			~(SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
+			SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) &
+			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
+
+	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
+			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
+}
+
 #define SH_MOBILE_SDHI_MAX_TAP 3
 
 static int sh_mobile_sdhi_select_tuning(struct tmio_mmc_host *host)
 {
 	struct sh_mobile_sdhi *priv = host_to_priv(host);
 	unsigned long tap_cnt;  /* counter of tuning success */
-	unsigned long tap_set;  /* tap position */
 	unsigned long tap_start;/* start position of tuning success */
 	unsigned long tap_end;  /* end position of tuning success */
 	unsigned long ntap;     /* temporary counter of tuning success */
@@ -510,12 +536,12 @@ static int sh_mobile_sdhi_select_tuning(struct tmio_mmc_host *host)
 		select = true;
 
 	if (select)
-		tap_set = (tap_start + tap_end) / 2 % host->tap_num;
+		host->tap_set = (tap_start + tap_end) / 2 % host->tap_num;
 	else
 		return -EIO;
 
 	/* Set SCC */
-	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET, tap_set);
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET, host->tap_set);
 
 	/* Enable auto re-tuning */
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL,
@@ -732,6 +758,7 @@ static int sh_mobile_sdhi_probe(struct platform_device *pdev)
 		host->hw_reset		= sh_mobile_sdhi_hw_reset;
 		host->prepare_hs400_tuning =
 			sh_mobile_sdhi_prepare_hs400_tuning;
+		host->reset_hs400_mode = sh_mobile_sdhi_reset_hs400_mode;
 	}
 
 	/* Orginally registers were 16 bit apart, could be 32 or 64 nowadays */
-- 
2.11.0

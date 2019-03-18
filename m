Return-Path: <SRS0=zXAj=RV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B36C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Mar 2019 14:51:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 516A020850
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Mar 2019 14:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1552920692;
	bh=X5oiFDNAd19R11q0myKVS+p7q8WRdj+Qbkc/sWZs8s8=;
	h=From:To:Cc:Subject:In-Reply-To:Date:List-ID:From;
	b=qnWorO2NAnT+eiFAFDTpDwsF55mPBLSpSy8eJz8sruXpnvApZ80HkJGfWEc9A++LC
	 QtWzgEqm9VUOqjvDrrBIA69wUojWj1/hiN2NqsxapFnqWK3GHaPkAx7nEOlBuaHp7O
	 MfiJpouSZkR78zguFdxhwQTrFSep5B5GOajdew4w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727144AbfCROvb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Mar 2019 10:51:31 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:54862 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726701AbfCROvb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Mar 2019 10:51:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=kbPmyRf2CJ9vVkUwi/0a5i8nBSLInfuaW1JpE3GOxRM=; b=OoebvKTri5H4
        FVsgtnA03PVVDvW5ZwlgThy6/ZJjX8J75gLiuImqKHUxUZn4U7Bh/Va4nmOHapM7yAphXvX4IOXSb
        +2kg7ufoezCIm4reyNW5t1kWf+udyjmuVaeXd3qKNC/p7F61SBe/p6PwouoyaXase0adMJ7trWM2A
        fTW7s=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=debutante.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1h5tbp-0005nj-6g; Mon, 18 Mar 2019 14:51:25 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
        id A4FCC1128874; Mon, 18 Mar 2019 14:51:24 +0000 (GMT)
From:   Mark Brown <broonie@kernel.org>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mark Brown <broonie@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert.uytterhoeven@gmail.com>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jiada Wang <jiada_wang@mentor.com>, alsa-devel@alsa-project.org
Subject: Applied "ASoC: rsnd: add missing reg/reg-name at Document" to the asoc tree
In-Reply-To:  <87h8c0ye0n.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190318145124.A4FCC1128874@debutante.sirena.org.uk>
Date:   Mon, 18 Mar 2019 14:51:24 +0000 (GMT)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The patch

   ASoC: rsnd: add missing reg/reg-name at Document

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 14c747506ae65005ab024f2247e68b8e045f210a Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 18 Mar 2019 14:11:27 +0900
Subject: [PATCH] ASoC: rsnd: add missing reg/reg-name at Document

reg is missing "Audio DMAC peri peri" part,
and reg-name itself is missing at Document.
This patch add these.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/sound/renesas,rsnd.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
index 648d43e1b1e9..c58af457a831 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
@@ -282,7 +282,10 @@ Required properties:
 - reg				: Should contain the register physical address.
 				  required register is
 				   SRU/ADG/SSI      if generation1
-				   SRU/ADG/SSIU/SSI if generation2
+				   SRU/ADG/SSIU/SSI/AUDIO-DMAC-periperi if generation2/generation3
+- reg-names			: Should contain the register names.
+				   scu/adg/ssi	if generation1
+				   scu/adg/ssiu/ssi/audmapp if generation2/generation3
 - rcar_sound,ssi		: Should contain SSI feature.
 				  The number of SSI subnode should be same as HW.
 				  see below for detail.
-- 
2.20.1


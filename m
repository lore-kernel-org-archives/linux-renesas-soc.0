Return-Path: <SRS0=zXAj=RV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD3A1C10F00
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Mar 2019 14:51:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7D5F22087E
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Mar 2019 14:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1552920692;
	bh=mh5si4O5M5KR+PTUkbxV7OsKJELMgUsV5mSHh6CBdeI=;
	h=From:To:Cc:Subject:In-Reply-To:Date:List-ID:From;
	b=sQotCIQld8nbEmakZo46j9Wcerap/9J+9igw1FNjS0j6rCXsmRY8qJEkX/LOt/95L
	 Isiq6ezSDbn2bKGu1BPbJBzy7MGn55F8ZQ1gpLui/d81yxjMGnjinGIKdHCOt/kisQ
	 625i+1YrdcUXOYF0M8h+myO2UKQb7YxrYwPGqmK0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbfCROvc (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Mar 2019 10:51:32 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:54864 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbfCROvb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Mar 2019 10:51:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=APhePSYQz5ApHbjaYRpvaLV1e49Ksq0y9R1K7FLx9AA=; b=ETtXQEwmmH6c
        xYlWRXqw+mVAldGCqMDE+uCgY3T0cdlgktXLWGPDjOK7Z35HOA1L40bU2HKUHyDJl4Mt5eok7vmvN
        allPUjs35fCUrzy+/xqlvUdqDbLHnXEe95AXj9fVhVJH9G0Ca5bXNWimui3eWEIEjgvOCduLaPa+L
        JNwbE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=debutante.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1h5tbn-0005nd-9a; Mon, 18 Mar 2019 14:51:23 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
        id 858061128874; Mon, 18 Mar 2019 14:51:22 +0000 (GMT)
From:   Mark Brown <broonie@kernel.org>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Jiada Wang <jiada_wang@mentor.com>,
        Mark Brown <broonie@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert.uytterhoeven@gmail.com>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jiada Wang <jiada_wang@mentor.com>, alsa-devel@alsa-project.org
Subject: Applied "ASoC: rsnd: explain extended Audio DMAC peri peri address" to the asoc tree
In-Reply-To:  <87ftrkye0f.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190318145122.858061128874@debutante.sirena.org.uk>
Date:   Mon, 18 Mar 2019 14:51:22 +0000 (GMT)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The patch

   ASoC: rsnd: explain extended Audio DMAC peri peri address

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

From c4bce31c4982ddb866b6b6d0f7ca1cf039a3aded Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 18 Mar 2019 14:11:34 +0900
Subject: [PATCH] ASoC: rsnd: explain extended Audio DMAC peri peri address

If SoC has extended Audio DMAC peri peri address,
DT needs to select it.
Otherwise, it can select normal Audio DMAC peri peri address.
Extended Audio DMAC peri peri address can use BUSIF4-7,
normal address can't.

Reported-by: Jiada Wang <jiada_wang@mentor.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/sound/renesas,rsnd.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
index c58af457a831..b34afa66fb00 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
@@ -283,6 +283,8 @@ Required properties:
 				  required register is
 				   SRU/ADG/SSI      if generation1
 				   SRU/ADG/SSIU/SSI/AUDIO-DMAC-periperi if generation2/generation3
+				   Select extended AUDIO-DMAC-periperi address if SoC has it,
+				   otherwise select normal AUDIO-DMAC-periperi address.
 - reg-names			: Should contain the register names.
 				   scu/adg/ssi	if generation1
 				   scu/adg/ssiu/ssi/audmapp if generation2/generation3
-- 
2.20.1


Return-Path: <SRS0=pBJi=SR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC3EBC10F11
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Apr 2019 08:53:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9659420833
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Apr 2019 08:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555318433;
	bh=64xtkn+haibmTbsxFVB1OxfxcR8Sbo40qSmwvIdLJ7A=;
	h=From:To:Cc:Subject:In-Reply-To:Date:List-ID:From;
	b=03Dqy2sIc8Wk0jZT4H9F7uszvazxfLGsbMSMitgqXKOinRFYMJcbgxbCiaeTF6fLm
	 yw9vQao+N2C5+7SQ5f09q8DxqO9rHi00siLqL4Vd87ZGx48kTxk8FpqA0flYRDZAWI
	 lnLzPRzchy2xlIVs7epy/oIZV3Cvl19oZonqARYc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727106AbfDOIxr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 15 Apr 2019 04:53:47 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:35984 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727028AbfDOIxq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Apr 2019 04:53:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=wy65LrjtGuqEfH1Yhdep4zz+1vhVBlqHbXsmnyI/Sck=; b=q26WH7Ie6UyZ
        pfUGhOeRDA7bnUodZaCLg17N0rtM2pFLKLgMtZGn6RNMZm0Fd2SgKiC7XKV7Iy6IgcDpAn1ouHbrE
        PHUvp+jrBUQBsNu4ZjuivPfReYdBLYY+Fyhosaujt0FCUROJSTc6T64gGX09N+pI1BhfIKv2knaxg
        JTI9c=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=debutante.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hFxMp-0007ir-Jm; Mon, 15 Apr 2019 08:53:31 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
        id 7C14B1127A64; Mon, 15 Apr 2019 09:53:30 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     alsa-devel@alsa-project.org, biju.das@bp.renesas.com,
        broonie@kernel.org, cv-dong@jinso.co.jp,
        devicetree@vger.kernel.org, geert+renesas@glider.be,
        h-inayoshi@jinso.co.jp, horms+renesas@verge.net.au,
        kuninori.morimoto.gx@renesas.com,
        linux-renesas-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        na-hoan@jinso.co.jp, nv-dung@jinso.co.jp,
        yoshihiro.shimoda.uh@renesas.com
Subject: Applied "ASoC: rsnd: Document r8a77470 bindings" to the asoc tree
In-Reply-To: <1554969262-15028-17-git-send-email-cv-dong@jinso.co.jp>
X-Patchwork-Hint: ignore
Message-Id: <20190415085330.7C14B1127A64@debutante.sirena.org.uk>
Date:   Mon, 15 Apr 2019 09:53:30 +0100 (BST)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The patch

   ASoC: rsnd: Document r8a77470 bindings

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

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

From d1d58766908aad18b1f967fc107702959da84f2b Mon Sep 17 00:00:00 2001
From: Cao Van Dong <cv-dong@jinso.co.jp>
Date: Thu, 11 Apr 2019 16:54:18 +0900
Subject: [PATCH] ASoC: rsnd: Document r8a77470 bindings

Document SoC specific bindings for R-Car RZ/G1C(r8a77470) SoC.

Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/sound/renesas,rsnd.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
index b34afa66fb00..5c52182f7dcf 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
@@ -266,6 +266,7 @@ Required properties:
 				    - "renesas,rcar_sound-r8a7743" (RZ/G1M)
 				    - "renesas,rcar_sound-r8a7744" (RZ/G1N)
 				    - "renesas,rcar_sound-r8a7745" (RZ/G1E)
+				    - "renesas,rcar_sound-r8a77470" (RZ/G1C)
 				    - "renesas,rcar_sound-r8a774a1" (RZ/G2M)
 				    - "renesas,rcar_sound-r8a774c0" (RZ/G2E)
 				    - "renesas,rcar_sound-r8a7778" (R-Car M1A)
-- 
2.20.1


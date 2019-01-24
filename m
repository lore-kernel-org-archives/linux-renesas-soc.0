Return-Path: <SRS0=drmD=QA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 259FFC282C3
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:13:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E13E5218AF
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:13:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="mTX+r55Q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727955AbfAXPNg (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 24 Jan 2019 10:13:36 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39115 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727996AbfAXPNg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jan 2019 10:13:36 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 3744D25BF07;
        Fri, 25 Jan 2019 02:12:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548342765; bh=TreSCN3Pe5S2++jf2ABiYkjw/BXPtHBQKTYnlv+x3Vc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mTX+r55QjvwiInVMNRYbvf4vrZkTRhrL+vY+LgcsQWL2PsOfO2a0sgoKm6JJ74/VR
         fyRpuqXNbiU8r7EhHdrk1JemBavOkr8/SFCpUjNQfJWPMH07jvQB2/ZIJYv575Y/VN
         g/UCDoGO53jPQXoi+OzydfUn20QtKmQ84Fmoc3Js=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 5EFCD940E09; Thu, 24 Jan 2019 16:12:41 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 39/44] arm64: dts: renesas: r8a77990-ebisu: use simple-audio-card
Date:   Thu, 24 Jan 2019 16:12:33 +0100
Message-Id: <868a49d6f9d915a16f4fa223083eab6fbcbefcbf.1548233325.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1548233325.git.horms+renesas@verge.net.au>
References: <cover.1548233325.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current Ebisu board is using simple-scu-audio-card
which is used for Sampling Rate Convert, or MIXer, etc.
But, Ebisu is not using such feature.
Then, simple-audio-card is very enough.
This patch fixup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index 8b66ee86e7bb..e0590c0af4c4 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -169,16 +169,13 @@
 	};
 
 	rsnd_ak4613: sound {
-		compatible = "simple-scu-audio-card";
+		compatible = "simple-audio-card";
 
 		simple-audio-card,name = "rsnd-ak4613";
 		simple-audio-card,format = "left_j";
 		simple-audio-card,bitclock-master = <&sndcpu>;
 		simple-audio-card,frame-master = <&sndcpu>;
 
-		simple-audio-card,prefix = "ak4613";
-		simple-audio-card,routing = "ak4613 Playback", "DAI0 Playback",
-		"DAI0 Capture", "ak4613 Capture";
 		sndcpu: simple-audio-card,cpu {
 			sound-dai = <&rcar_sound>;
 		};
-- 
2.11.0


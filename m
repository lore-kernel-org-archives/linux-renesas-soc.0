Return-Path: <SRS0=MQ6q=VU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D97C76186
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 23 Jul 2019 18:02:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7F37E218A0
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 23 Jul 2019 18:02:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mx/2ZB5u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726000AbfGWSC4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 23 Jul 2019 14:02:56 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42941 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726535AbfGWSC4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Jul 2019 14:02:56 -0400
Received: by mail-pf1-f193.google.com with SMTP id q10so19518157pff.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jul 2019 11:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=IiQ9FeWhA1kQebyHY6+sy801yiSvPYko5A+aRDheAqM=;
        b=Mx/2ZB5ulP3L2vy0DWp+l7wA9og7pxz/rLJjnKAYubpxYT6O5w6g0g8aA78XTWSonh
         CGJoF1vg+T3cozB73Bh+2rxTsyO7LCMpXu002rKCPQ48rx37oBISVOfubnPcd4Drm31c
         CnUEgoinMfk3QyylNUgstjs9urFmldTEAsUmXE31E6UyGvIfTcqS7Aaqqw9bIE1HbnfU
         O214XkzeDYxxeDa0J0iBYkrBRhV2BneVSfHJCv5VHcGW1tOPrSuMcPGqPkgWjSnyxdb3
         ImKb7WpQyjXrHGXCdME31yzzZxsOIMstB2zSk7gR9WxmPGjwZNXRtDQMuPSZJtHJ27Xe
         HIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=IiQ9FeWhA1kQebyHY6+sy801yiSvPYko5A+aRDheAqM=;
        b=jaHZRbfaVcOXtLzaY/4ctoRUkFyZLhrWIM3sUeS+HQPxULEpZEW9QApDC1Nfo2x3y8
         nzgzfFqeIuzSH5RqaTg+vDbiSiMpdKWdt0eECSxpDf1gaH+5sVdGO8tGg+nJ61MHAUiv
         6tHNii4OheSRyEHFX+jxKCmXo3xiydYpyo40Vuka0+9/j103cp2ph9FO5cClXwSbfhkk
         ZuI0GJ2BKvaBjWhVB46TaNVSDtDI5PlG+gZ/9jJ5QTUEt3uj1G6BRS4SHDZ9kmN0o7oG
         FpJG6w0jMMa7guj492eoNxfcFDIXXhDejKgcxhfP3G2PFFaubCvrxodRY3uFXnYm1y19
         dh6g==
X-Gm-Message-State: APjAAAV3crjKrPcQ6jqjz/W+A+6Pzl9xQYqDEDmx/NEc+6kRbLnWgfX/
        sh+HsX1MDT5FmMifcM+lOaxQvFGB
X-Google-Smtp-Source: APXvYqwKXYSz+vTsnnArpLizZjDkM9C/F75bVbeldp4iXdeQkbO2+d6Ilwrp1LnY5EFzF5WJ3aM8mA==
X-Received: by 2002:a63:b46:: with SMTP id a6mr67936945pgl.235.1563904975073;
        Tue, 23 Jul 2019 11:02:55 -0700 (PDT)
Received: from localhost.localdomain (KD118155013174.ppp-bb.dion.ne.jp. [118.155.13.174])
        by smtp.gmail.com with ESMTPSA id a12sm82319839pje.3.2019.07.23.11.02.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 23 Jul 2019 11:02:54 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: renesas: r8a7796-salvator-xs: sort nodes
Date:   Wed, 24 Jul 2019 03:02:41 +0900
Message-Id: <1563904961-2835-1-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Sort nodes.

If node address is present
   * Sort by node address, grouping all nodes with the same compat string
     and sorting the group alphabetically.
Else
   * Sort alphabetically

This should not have any run-time effect.

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the devel branch of Simon Horman's renesas tree.

 arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts
index d58ede1..a1cbfef 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts
@@ -36,11 +36,6 @@
 		      "dclkin.0", "dclkin.1", "dclkin.2";
 };
 
-&sound_card {
-	dais = <&rsnd_port0	/* ak4613 */
-		&rsnd_port1>;	/* HDMI0  */
-};
-
 &hdmi0 {
 	status = "okay";
 
@@ -81,3 +76,8 @@
 		};
 	};
 };
+
+&sound_card {
+	dais = <&rsnd_port0	/* ak4613 */
+		&rsnd_port1>;	/* HDMI0  */
+};
-- 
1.9.1


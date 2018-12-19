Return-Path: <SRS0=oRiM=O4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ABAAC43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 10:26:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A56621850
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 10:26:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2D0rUGk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbeLSK0J (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 19 Dec 2018 05:26:09 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42382 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726812AbeLSK0I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Dec 2018 05:26:08 -0500
Received: by mail-pg1-f193.google.com with SMTP id d72so9249235pga.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Dec 2018 02:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=B2Lfg0D/Jn91tuXT3XwJs/hp7DFChj1kTEFFvaAffHg=;
        b=i2D0rUGkxsq/UEfhFJ6FgKlLeEVxlqAKf7MZsvqZYk6RQXKZo9/zFbkRPRjEWeP/cq
         azxdg7eF9mruI1wERyKzKc1hhPsHDtmgDhzcfj9938m3Rl4hb4TLLk5566PgU7hVEDIi
         jVMHrknlMQiPA3VorP7+sJMl4FL2FIWC0aVcdm/SjzBdkWAHDrXeoeh1MLg4lyW1Loyc
         pSguMDcKUY8Ce3MXvGDN6IVPwVw9rM6bqE3c6bMZykhTGo74VJM4jtjdGrr1xwyiZOgi
         xLgWQ1HsnVvQlL+Rm/6ONgbzgz/lAmO0fDtkqpSk+UJ14an1B5bcopgL0gUkU/f9WRpE
         xnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=B2Lfg0D/Jn91tuXT3XwJs/hp7DFChj1kTEFFvaAffHg=;
        b=DU2YbDgT46WYIT+H++VfxkI3rfb6kgMzqfJdERatuWsTS1fXbdjLGhoVWtPUXplmfB
         4QM7vox9MDSnjR5CwqNfkcM1w+dEeNkjaOoBsUE/uJ1Ie9xXABBarXRLFqtLZCwGkDfV
         iIMvUZH02mnoGfWtGsDi5SAKwuxrvqNMFZwcq9GGdH3gMcDxXPiNjSqqUi2lb9WLZpZQ
         GGmVHAQ1rtRGp9DGEiE9QpdARSQyy6QE9JXG4HcQGUMDjW1zrsNf2s+hHzRIU8CGCeoo
         abM5tCL7mG4Tk4prfMEwcXBoRDWZH/NKWr9oRaREH07+F+54ansVjiIdvoUdyZG/HJXc
         LPnw==
X-Gm-Message-State: AA+aEWZNW4NGpeWIrIXF6sIX25HViLrVsFw9NQz7Cv9e1xgTuyGnZqEb
        /zem1rmHxVEfAb8MSCgZDJ/tpdan
X-Google-Smtp-Source: AFSGD/X7Q0Dp8vT788PYlqbAgGeJWL6U1+nGLdb8HVwicDZvf83Ok2uPnSAhazVYebJ2Bf4Vri9zIw==
X-Received: by 2002:a63:7219:: with SMTP id n25mr19105564pgc.324.1545215168044;
        Wed, 19 Dec 2018 02:26:08 -0800 (PST)
Received: from [127.0.0.1] (s214090.ppp.asahi-net.or.jp. [220.157.214.90])
        by smtp.gmail.com with ESMTPSA id f64sm52463459pfh.0.2018.12.19.02.26.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Dec 2018 02:26:06 -0800 (PST)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Wed, 19 Dec 2018 19:26:35 +0900
Message-Id: <154521519519.7290.11586460280206503681.sendpatchset@octo>
In-Reply-To: <154521516632.7290.5245227863765109428.sendpatchset@octo>
References: <154521516632.7290.5245227863765109428.sendpatchset@octo>
Subject: [PATCH 03/09] arm64: dts: renesas: r8a7796: One IMR-LX4 device for R-Car M3-W
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

We will only test a single IMR-LX4 device, so get rid of the other
channels in the r8a7796 dtsi file. Not for upstream merge.

Not-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a7796.dtsi |   10 ----------
 1 file changed, 10 deletions(-)

--- 0001/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a7796.dtsi	2018-12-19 13:09:17.327127816 +0900
@@ -2480,16 +2480,6 @@
 			resets = <&cpg 823>;
 		};
 
-		imr-lx4@fe870000 {
-			compatible = "renesas,r8a7796-imr-lx4",
-				     "renesas,imr-lx4";
-			reg = <0 0xfe870000 0 0x2000>;
-			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 822>;
-			power-domains = <&sysc R8A7796_PD_A3VC>;
-			resets = <&cpg 822>;
-		};
-
 		fdp1@fe940000 {
 			compatible = "renesas,fdp1";
 			reg = <0 0xfe940000 0 0x2400>;

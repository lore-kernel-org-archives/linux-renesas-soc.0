Return-Path: <SRS0=oRiM=O4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B0FC43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 10:25:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9327D21850
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 10:25:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qv+5A0+S"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727310AbeLSKZ7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 19 Dec 2018 05:25:59 -0500
Received: from mail-pl1-f181.google.com ([209.85.214.181]:34273 "EHLO
        mail-pl1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726812AbeLSKZ7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Dec 2018 05:25:59 -0500
Received: by mail-pl1-f181.google.com with SMTP id w4so9277984plz.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Dec 2018 02:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=aHEvWlY8bbJ1nojT1LHwUbw3XThuWtLKkXvUoM9V22k=;
        b=qv+5A0+SLrdXLItin5MBtdZ2ekhlCGzHqZzJNfA1ipMXxGoS+sTm+rP9w/DdqyEqcq
         BBpOyL2KJYVTfosVZd/tsoPXMzYfq0rFtqYO1PvWntwhPl5SghkXgwPzA101uEyGk7f3
         uwLs5lehvxKEWsOHGLvRBC4v7zchl+0202F+xp6zm+PQFzVsL7PXqa1QwybTh3lEtCp+
         XNtNWr5pz6PcFMQTAR7qF0aIGOtsC4EplFgwb/Ec8CQjSUqsopiopp2XohRUBJCVTI48
         Uinho4E/sQw/xvJkS8GOaOqFHYI4J4CUf1YLfBrtR3ybSoaKrhsC9Cgr3jX9EquvvwXO
         lXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=aHEvWlY8bbJ1nojT1LHwUbw3XThuWtLKkXvUoM9V22k=;
        b=OyLjHzUa3xYh9nqPH5NVjcqAQYrYIdo/ARm9AduO77Nr7lhyTEGQnhq1yUARSiOwdQ
         gREuASJ8T7dcDNJehnG4Vpp7T8boSWowZZrAcJcYI7nz55W4bAH8qQ4qAAxsQecNhSd0
         3/jsnT4UBRFfu7SBabvnutjZYIr+K6e6ZiEOkSTfhcuipQPyhfJGV/aoNH4k1tTf3sLT
         aq1BvKYJBqbl6bgE2kihOtcZiACqFivQvsoiMjK0FtTnL45AIlrTkHC1WwVZnWjA3zpM
         OZDGnHN7VfQSy1Ir4pu81D9RMkhnjvi0KD3gp9U9w2per5NELfDltOSdmldaNuxDd0s6
         XPag==
X-Gm-Message-State: AA+aEWaNTUMephTrzgRfq+HndVxOcUsPFKsBVcNvfLVtaoFz/S11BU09
        Dsy1YpdopHXlezzoskZNLWK2Hkv1
X-Google-Smtp-Source: AFSGD/U4AbsKyfTBgVTA2MpD8xxNZ+Z3ri/ct7Dpe5SrRM7IwPBuMG21Th21WhV0/tDJ/I09KI4alQ==
X-Received: by 2002:a17:902:27e6:: with SMTP id i35mr19343128plg.222.1545215158232;
        Wed, 19 Dec 2018 02:25:58 -0800 (PST)
Received: from [127.0.0.1] (s214090.ppp.asahi-net.or.jp. [220.157.214.90])
        by smtp.gmail.com with ESMTPSA id r76sm28412744pfb.69.2018.12.19.02.25.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Dec 2018 02:25:57 -0800 (PST)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Wed, 19 Dec 2018 19:26:25 +0900
Message-Id: <154521518586.7290.4665877423335154021.sendpatchset@octo>
In-Reply-To: <154521516632.7290.5245227863765109428.sendpatchset@octo>
References: <154521516632.7290.5245227863765109428.sendpatchset@octo>
Subject: [PATCH 02/09] arm64: dts: renesas: r8a7795: One IMR-LX4 device for R-Car H3
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

We will only test a single IMR-LX4 device, so get rid of the other
channels in the r8a7795 dtsi file. Not for upstream merge.

Not-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a7795.dtsi |   30 ------------------------------
 1 file changed, 30 deletions(-)

--- 0001/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi	2018-12-19 13:07:02.342050765 +0900
@@ -2617,36 +2617,6 @@
 			resets = <&cpg 823>;
 		};
 
-		imr-lx4@fe870000 {
-			compatible = "renesas,r8a7795-imr-lx4",
-				     "renesas,imr-lx4";
-			reg = <0 0xfe870000 0 0x2000>;
-			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 822>;
-			power-domains = <&sysc R8A7795_PD_A3VC>;
-			resets = <&cpg 822>;
-		};
-
-		imr-lx4@fe880000 {
-			compatible = "renesas,r8a7795-imr-lx4",
-				     "renesas,imr-lx4";
-			reg = <0 0xfe880000 0 0x2000>;
-			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 821>;
-			power-domains = <&sysc R8A7795_PD_A3VC>;
-			resets = <&cpg 821>;
-		};
-
-		imr-lx4@fe890000 {
-			compatible = "renesas,r8a7795-imr-lx4",
-				     "renesas,imr-lx4";
-			reg = <0 0xfe890000 0 0x2000>;
-			interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 820>;
-			power-domains = <&sysc R8A7795_PD_A3VC>;
-			resets = <&cpg 820>;
-		};
-
 		fdp1@fe940000 {
 			compatible = "renesas,fdp1";
 			reg = <0 0xfe940000 0 0x2400>;

Return-Path: <SRS0=oRiM=O4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3D6C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 10:26:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 66C7521850
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 10:26:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N5B1wnip"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727155AbeLSK0f (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 19 Dec 2018 05:26:35 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:45340 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727310AbeLSK0f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Dec 2018 05:26:35 -0500
Received: by mail-pl1-f195.google.com with SMTP id a14so9262368plm.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Dec 2018 02:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=c7ByWXlRCBnstgTzAORPNHN48EgsuzydndRkBhFPw1o=;
        b=N5B1wnipb7OoZ0b58kKpER49mSqGMquR/GJloC4KqhdTLntfNXiYPkdE7P4kiYaBYX
         sGvmhQw+fD1+NyZo2FsTHZjjPdBTem7LZ24+xpG7ttaWZkd3L1U3dCGrYKIprZJpOLLe
         zEWGQ8iTfO9VrsVDXAzPcoTdfUo0eMAwTl70SSFHTXsJy2j10xBejyW0N9N0SHvzLd71
         JH/oqXy/havWJcAlz/w8SFfpIzCKdswTpz6H4qgxvZOpOcU/6bcqibFxGTfk/S8g9NmD
         Drf1CBKReZe7VrB1AyrBcrWM1ZaRXNeHKo3GSSsWTED+XEz7C9ekxXNitDdWwMAOQTNl
         y7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=c7ByWXlRCBnstgTzAORPNHN48EgsuzydndRkBhFPw1o=;
        b=WbDTa8hISV+T4mBBZeuibae2IMXm8nsGoY3Ovdl7Idz5HcruGl7lBvZ+BinQ7XC4Dg
         80eVWEFk8PtLrtNxF+TlkrnHdgD0wX8QobTPUFGzOzAM4FcWOja6KIDPbf5lL/sC1npL
         fE0GYdGZIrA1sQ3g4IWaCB9nU7iQbuVAWsL2qpgEH06NqdOn//1VNvQagqWLTNyUTCak
         d4xqxLUeJHTLI1AqC7gx5/t/DGMHy3GVa3tEjd0RhfqtleZgEVI+Ie5J29D374NUDKQz
         hefgZOAq1URiI+Qn7A6SAUAHQO4J7/RqT0jo0gtGZX8/rIeAReZn+7CLSP3UmCi2OpBf
         t75g==
X-Gm-Message-State: AA+aEWbgPrqSOgq7gWgL/z5ayYQ08gAbRtHPr78jAdJahuxH+q4sgtkS
        pNrD6V2eDcf1erZeW56Eg5oxxC2O
X-Google-Smtp-Source: AFSGD/WJw1qhr1OkqiCY67eUWtOJsLSEBhG7d05PfKI6psACpTyVgK43I54+uLGQ2qIO54zVlMAyDg==
X-Received: by 2002:a17:902:2ac3:: with SMTP id j61mr19767722plb.185.1545215194854;
        Wed, 19 Dec 2018 02:26:34 -0800 (PST)
Received: from [127.0.0.1] (s214090.ppp.asahi-net.or.jp. [220.157.214.90])
        by smtp.gmail.com with ESMTPSA id p7sm25727605pfa.22.2018.12.19.02.26.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Dec 2018 02:26:33 -0800 (PST)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Wed, 19 Dec 2018 19:27:03 +0900
Message-Id: <154521522293.7290.7741255645751986991.sendpatchset@octo>
In-Reply-To: <154521516632.7290.5245227863765109428.sendpatchset@octo>
References: <154521516632.7290.5245227863765109428.sendpatchset@octo>
Subject: [PATCH 06/09] arm64: dts: renesas: r8a77980: One IMR-LX4 device for R-Car V3H
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Introduce a single IMR-LX4 device to the r8a77980 dtsi file.

Not for upstream merge.

Not-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a77980.dtsi |   10 ++++++++++
 1 file changed, 10 insertions(+)

--- 0001/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a77980.dtsi	2018-12-19 15:59:32.314683163 +0900
@@ -1374,6 +1374,16 @@
 			status = "disabled";
 		};
 
+		imr-lx4@fe860000 {
+			compatible = "renesas,r8a77980-imr-lx4",
+				     "renesas,imr-lx4";
+			reg = <0 0xfe860000 0 0x2000>;
+			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 823>;
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets = <&cpg 823>;
+		};
+
 		vspd0: vsp@fea20000 {
 			compatible = "renesas,vsp2";
 			reg = <0 0xfea20000 0 0x5000>;

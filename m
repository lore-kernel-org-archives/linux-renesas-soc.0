Return-Path: <SRS0=oRiM=O4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC52C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 10:26:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1E14921850
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 10:26:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qK26ydMB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727201AbeLSK0o (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 19 Dec 2018 05:26:44 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:41226 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727071AbeLSK0o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Dec 2018 05:26:44 -0500
Received: by mail-pf1-f194.google.com with SMTP id b7so9617715pfi.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Dec 2018 02:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=jkxmeQnprt+P1KYbd7yJ3ZgZz4TwoiKhodGXbnoz9S0=;
        b=qK26ydMBQQwklUR5EgjQIHbuBQ1abXRYgTVteRiC34RyWdTp7/eTNatG+6+JNzUSu6
         hCAtzQkx2gSON1yoJV3cNoJiRA1w6DTsBBXZFQlmpyM1s2aC7NiqdDb6Ob2MopZ6A/oT
         Tbqect8LbWVw4Rz2cGr6PsGfAUQhtJnMV3i98GLPzj/8v7CPO/tT+mxSHMQdG0dbuS7K
         W/BzrzgZodAp7QssCjn/GOsILPgIdzlQWRH/CH6xu3aXWBApxlOO5WKCWXTb4k8HkuYN
         gRZ+hQe7gIND85daWYsPRv/UtomuBqyfIgh7IeIiVct59YZRIdV8vFLAs7nbbAIrYP56
         Aggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=jkxmeQnprt+P1KYbd7yJ3ZgZz4TwoiKhodGXbnoz9S0=;
        b=e12gAGqR54qujn/x/mjAIeWUhlt4AHtnWjzd6jcIy3jLwv1sTdz6rcCaRnChXMsQD4
         eWVqJG5jAB6mW6A7IfucjSo4feC0HItIqEPVoMFj5QTsXRvn3ia5rsvJ5iguPnHp9eVP
         +O6oU4lKIjXANrjRDnoaKiEVdFaOuAqHcH01HL8jvJOWuUN0MUn3VnoGWIUTY7P1PQHJ
         hru7tUlhnYGVOHAjlWIwzzXkqwuBDtzW+O+VsZ14ikaZZrF8WOi+0C//MIVjzlODHWCs
         bQMu7BBlLgkgnyyl6Ypvc6vAMqcw8hzLGHNPX+8oxhZ46mo12Sy/+9c3ULnq8RepluId
         pWKg==
X-Gm-Message-State: AA+aEWYoeGcBGK7PBCpa+fXIHMlec0y9PKZxj/M16tThYkga02PWejI7
        RNXfrcoMaj+yqOZcfjGsk+xu1HYc
X-Google-Smtp-Source: AFSGD/Vh15z2DThSZ8Pnyd7IfK7WA+QpNTR9nK6DjxDYH0vESw+S492jAxGJ5aVqo1xLyh98ex8+IQ==
X-Received: by 2002:a62:6503:: with SMTP id z3mr19344086pfb.169.1545215203862;
        Wed, 19 Dec 2018 02:26:43 -0800 (PST)
Received: from [127.0.0.1] (s214090.ppp.asahi-net.or.jp. [220.157.214.90])
        by smtp.gmail.com with ESMTPSA id y5sm24937244pge.49.2018.12.19.02.26.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Dec 2018 02:26:43 -0800 (PST)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Wed, 19 Dec 2018 19:27:12 +0900
Message-Id: <154521523194.7290.580982639208646713.sendpatchset@octo>
In-Reply-To: <154521516632.7290.5245227863765109428.sendpatchset@octo>
References: <154521516632.7290.5245227863765109428.sendpatchset@octo>
Subject: [PATCH 07/09] arm64: dts: renesas: r8a77995: One IMR-LX4 device for R-Car D3
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Introduce a single IMR-LX4 device to the r8a77990 dtsi file.

Not for upstream merge.

Not-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a77990.dtsi |   10 ++++++++++
 1 file changed, 10 insertions(+)

--- 0001/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a77990.dtsi	2018-12-19 16:07:34.000937189 +0900
@@ -1526,6 +1526,16 @@
 			resets = <&cpg 408>;
 		};
 
+		imr-lx4@fe860000 {
+			compatible = "renesas,r8a77990-imr-lx4",
+				     "renesas,imr-lx4";
+			reg = <0 0xfe860000 0 0x2000>;
+			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 823>;
+			power-domains = <&sysc R8A77990_PD_A3VC>;
+			resets = <&cpg 823>;
+		};
+
 		vspb0: vsp@fe960000 {
 			compatible = "renesas,vsp2";
 			reg = <0 0xfe960000 0 0x8000>;

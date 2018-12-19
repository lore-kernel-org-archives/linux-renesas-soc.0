Return-Path: <SRS0=oRiM=O4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54409C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 10:26:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 23D0B21850
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 10:26:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQAQ0HBP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727611AbeLSK0W (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 19 Dec 2018 05:26:22 -0500
Received: from mail-pl1-f172.google.com ([209.85.214.172]:42733 "EHLO
        mail-pl1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726812AbeLSK0W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Dec 2018 05:26:22 -0500
Received: by mail-pl1-f172.google.com with SMTP id y1so9259465plp.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Dec 2018 02:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=LG5nk5wlnsvmt2Z1T3qoPtZ+B8EYU2KfSbnuMbmu+Jg=;
        b=mQAQ0HBPMIdpALrStdSYkkWRVJb/3tmQ7enUSi3My+Kwl+KEwCcVodvAiTc5qIxMU3
         ibwl0DmDD5ncQRr2651JXfhkw0kKXrlLkaPkeE/TM2aKqbYeQBUssefVPSrqCINCAUBo
         9LxK7v6eT0QK8OiI0xVZEq1k47UAKdFleYENpV7AIiwrCkA+7iZ6stgOHzXP+80p6xdD
         zEgA2deryKhjar/yvs7DeX8cMgwX0hphvhuZK4tW4uKy1ZFuAsNW9sKWcNj0LH5EnEu0
         ZklIznWlS40dILSHqJlpI8/Ak6IoM9fHQZ7n+T5WCTUSgj1xJ2KOA8pHEMLk/rQ0kyUu
         waXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=LG5nk5wlnsvmt2Z1T3qoPtZ+B8EYU2KfSbnuMbmu+Jg=;
        b=JKJ2jiUJQnrGSvIM4EdXiyHaNrZ72+qPL3Otq7CCh0pcZGaoeDLJQKHDgb2m+4+QUW
         oAb51/vdarqdaNjPhd1IXgn8GOjE7V5Ir+ej65qXThHnErZ4wNBFAbmcYEysRjCXAbGs
         c1j7+EaOIte9PbTn4j3htX5rugjypqH0ZEPILIbBHDt8Ssf1dhawh3oCVL4DBX82SVH5
         TQtYhr8k95bF/giYRP38iiazT5yvhqj7HHuc0VD+Q7sw7Oh9K0px5Z8iwuLE3eO1iioS
         VxVZwfhnTg9KGfsooQW6xJ9n/YIEDPrSfswb/R7XX5pJemMOuY/Mm6JpmEazff4RQbqI
         R76A==
X-Gm-Message-State: AA+aEWajhFErUajWA1/EkH39sKu9FEbXCNRFkh8vvCYOim4v4RsPf2+u
        wOVKZuSrwj69N2lv8idVl68KT1FZ
X-Google-Smtp-Source: AFSGD/UHlduN1XYkwMI0T3QcF/LRM0tUoiKzYVyijr2G5Rivepymg0UK0I4fotGqsIf/Q1I6kkAItQ==
X-Received: by 2002:a17:902:e012:: with SMTP id ca18mr19761958plb.218.1545215176987;
        Wed, 19 Dec 2018 02:26:16 -0800 (PST)
Received: from [127.0.0.1] (s214090.ppp.asahi-net.or.jp. [220.157.214.90])
        by smtp.gmail.com with ESMTPSA id l11sm22626638pff.65.2018.12.19.02.26.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Dec 2018 02:26:15 -0800 (PST)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Wed, 19 Dec 2018 19:26:45 +0900
Message-Id: <154521520498.7290.8024893514334504383.sendpatchset@octo>
In-Reply-To: <154521516632.7290.5245227863765109428.sendpatchset@octo>
References: <154521516632.7290.5245227863765109428.sendpatchset@octo>
Subject: [PATCH 04/09] arm64: dts: renesas: r8a77965: One IMR-LX4 device for R-Car M3-N
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Introduce a single IMR-LX4 device to the r8a77965 dtsi file.

Not for upstream merge.

Not-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a77965.dtsi |   11 +++++++++++
 1 file changed, 11 insertions(+)

--- 0001/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a77965.dtsi	2018-12-19 14:50:28.657437885 +0900
@@ -1929,6 +1929,17 @@
 			status = "disabled";
 		};
 
+
+		imr-lx4@fe860000 {
+			compatible = "renesas,r8a77965-imr-lx4",
+				     "renesas,imr-lx4";
+			reg = <0 0xfe860000 0 0x2000>;
+			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 823>;
+			power-domains = <&sysc R8A77965_PD_A3VC>;
+			resets = <&cpg 823>;
+		};
+
 		fdp1@fe940000 {
 			compatible = "renesas,fdp1";
 			reg = <0 0xfe940000 0 0x2400>;

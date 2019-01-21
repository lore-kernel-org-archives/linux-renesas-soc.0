Return-Path: <SRS0=sDbg=P5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F94CC7113B
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 12:16:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E516C20879
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 12:16:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KYuSwr2u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728272AbfAUMQc (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Jan 2019 07:16:32 -0500
Received: from mail-pf1-f178.google.com ([209.85.210.178]:33748 "EHLO
        mail-pf1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728216AbfAUMQc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jan 2019 07:16:32 -0500
Received: by mail-pf1-f178.google.com with SMTP id c123so10089353pfb.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Jan 2019 04:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=9bMX+T58iHCJaQTXIGUE6KFc7TFlb/uhWWwVtrnMKe8=;
        b=KYuSwr2uBd9EYJrB8quwtk1TEpMJYZTEej2TGnkUMK9rf4L8f1whuty8MQc45Jbr0r
         7GirHuwYX6qRk5v3d90j0tX/aC92k39erZvSnCsvsmDOe8UZiZVyIla0ruCr7d8z9I9Z
         wG+L/Lo6d3whvo7YqzhFjbVXDT4q/ARWTb2Q6KO7QLZM/Sqf1f0p+ENJgOqJ3Ne0LaIq
         WIE+RsY9qeE+n/ElhZ6xESsUq38vEY5m5k9PcTD/albDe5T2pZ6kuU5EIVhq6PyXl/ru
         OXplGYysTTqqRRIpbeh0D+epQNvbla50QdWelXk8hT3C2PheIZdBRhoQyzgChfbOUkKY
         hUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=9bMX+T58iHCJaQTXIGUE6KFc7TFlb/uhWWwVtrnMKe8=;
        b=RJDDXhHqGvjzJJ36RV3XAL3bkIVpYNnwkJ5nphPY1ZrR0lN0vrRb98OWRHs417T3de
         z2FbXbUrDF1V6osQFltvD6UZcG8NGSZN9l30h3ZyUeigtOvTGvpATZsf1U6HU9RhYL4Y
         XI27ptQqRsqUZlbf2rLrePbbmMJ23pQfzGLCbFge44ktFo/vNndF7Sa9ES2VJF2yrlcj
         ZBaeqIqqd43rmMNOVtJAxDeJRRGRXUXq+sRf0OTVbiU7+OxrKWOfuBLcffBdhHC2deaJ
         ec+auefOMbTITmdutVxB84vGMBM5AmU2IaJln9Qe8MEhUTV5RKPl6VbPWJIYvI0Cok3i
         RjWg==
X-Gm-Message-State: AJcUuke47PzvvhijDwp5oqSGiwX/+MGehADeeaibM1AyUoB1WRFlu8dD
        bHfoZqRoOFUnT25/ah27SqGY6MEJ
X-Google-Smtp-Source: ALg8bN5GNZVgIOkiEk7Cy2J/RrAj0XyMsFXbDu0UMl+4wb1SXhL+OpkeQA4LkDDIeOrurzoQnvVlEw==
X-Received: by 2002:a62:db41:: with SMTP id f62mr30052481pfg.123.1548072991692;
        Mon, 21 Jan 2019 04:16:31 -0800 (PST)
Received: from [127.0.0.1] (30.net042126252.t-com.ne.jp. [42.126.252.30])
        by smtp.gmail.com with ESMTPSA id d129sm27747727pfc.31.2019.01.21.04.16.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Jan 2019 04:16:30 -0800 (PST)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Mon, 21 Jan 2019 21:17:11 +0900
Message-Id: <154807303153.2406.5961455669905578679.sendpatchset@octo>
In-Reply-To: <154807300302.2406.14245640502137089757.sendpatchset@octo>
References: <154807300302.2406.14245640502137089757.sendpatchset@octo>
Subject: [PATCH/RFC 03/06] arm64: dts: renesas: r8a7796: One IMP-X5 device for R-Car M3-W
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Add an IMP-X5 device node to the r8a7796 device tree source.

Not for upstream merge.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a7796.dtsi |    9 +++++++++
 1 file changed, 9 insertions(+)

--- 0003/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a7796.dtsi	2019-01-21 19:38:59.092820475 +0900
@@ -2791,6 +2791,15 @@
 			};
 		};
 
+		imp-x5@ff900000 {
+			compatible = "renesas,imp-x5";
+			reg = <0 0xff900000 0 0x300000>;
+			interrupts = <GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 824>;
+			power-domains = <&sysc R8A7796_PD_A3IR>;
+			resets = <&cpg 824>;
+		};
+
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;

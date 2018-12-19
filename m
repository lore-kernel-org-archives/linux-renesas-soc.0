Return-Path: <SRS0=oRiM=O4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B1A5C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 10:26:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2C3C021850
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 10:26:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ghfk18/6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727705AbeLSK01 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 19 Dec 2018 05:26:27 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43999 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726812AbeLSK01 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Dec 2018 05:26:27 -0500
Received: by mail-pl1-f194.google.com with SMTP id gn14so9269501plb.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Dec 2018 02:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=xp0FTTtTS2ZyR8tVgSj7mt3GWSoy64lJYOGe+TszXTk=;
        b=Ghfk18/6EsiN0Leih4H1DeJOAcUDTAPR1Hu27iOJV9NlbI2c5qy7zA8PBNSSlIapW8
         GdeS7bkKxzOglSMa2fsg5u499Pa5z22psFU0mkjlLeP6AmaLoIE5HFyv6CgwKCjBSCSo
         4nIBEBBetlPuWkAs28OgN/8/YKTjqTgrfACMyD8Zmvl2dIotTeUaybuozwzDC5oX05TE
         xAjLZSpz6685hRujtU2hmFgw4GK1RExnQlt2uQfHKdPYTtD1BkhBuZDEBN3R94aggIs4
         ERBqjHStakA7QBPC9jUXMU/wXEuTaZGC2E0UZ8mQ5ko2Nmj3+LT6vn2gj0eO6zlJLg8T
         GZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=xp0FTTtTS2ZyR8tVgSj7mt3GWSoy64lJYOGe+TszXTk=;
        b=qb2cC6qHOkW47fEEmx7ZZxB+i9Zv3PYxzQuivy81tTjP4sFvCJWwimUKDKTBPjJ59u
         vundqaArLKBHvkLNNfJj4QGcTPsZ4qBR1WbVZyR8AkaYF4kdmN83htsPe6IZJV2lJdA1
         noqBsbsNBvYqNOaOiB29GDUaPJgvNPgSIfjaZ18pB1ujaTtXv5CT7B+nopI/7NkuA715
         kaWGLnGrIPxRCm8OC0hmBpRMDjbKdjSZgMXlytI7z2Ep24ccGP9WJL7FKiYnvh/0AOsz
         M/toFKPQeBqrTz1U/KT/R/TfzyDIu1h77mjvkCHZNa5c3GuCmqNGxRtZZU0QrcZoW4H8
         b4Dg==
X-Gm-Message-State: AA+aEWZoBAu4xvaRCtIKx9R85VBqWWpSQabbNNKcKxVS8rRXhQoUKWkX
        NJ1oTeftsMFORlNiDIxeUjGHog3d
X-Google-Smtp-Source: AFSGD/Uzgm/z+2VAZbGkvzFIlN0E6cuS8Ps9cF572AbTkZ8G5PNvm1oGHLyhEUzwFpkecGVmlMjUzQ==
X-Received: by 2002:a17:902:47aa:: with SMTP id r39mr19636735pld.219.1545215185934;
        Wed, 19 Dec 2018 02:26:25 -0800 (PST)
Received: from [127.0.0.1] (s214090.ppp.asahi-net.or.jp. [220.157.214.90])
        by smtp.gmail.com with ESMTPSA id t21sm25021422pgg.24.2018.12.19.02.26.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Dec 2018 02:26:24 -0800 (PST)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Wed, 19 Dec 2018 19:26:54 +0900
Message-Id: <154521521391.7290.4647429463617796402.sendpatchset@octo>
In-Reply-To: <154521516632.7290.5245227863765109428.sendpatchset@octo>
References: <154521516632.7290.5245227863765109428.sendpatchset@octo>
Subject: [PATCH 05/09] arm64: dts: renesas: r8a77970: One IMR-LX4 device for R-Car V3M
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Introduce a single IMR-LX4 device to the r8a77970 dtsi file.

Not for upstream merge.

Not-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a77970.dtsi |   10 ++++++++++
 1 file changed, 10 insertions(+)

--- 0001/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a77970.dtsi	2018-12-19 15:38:53.655742270 +0900
@@ -1055,6 +1055,16 @@
 			resets = <&cpg 408>;
 		};
 
+		imr-lx4@fe860000 {
+			compatible = "renesas,r8a77970-imr-lx4",
+				     "renesas,imr-lx4";
+			reg = <0 0xfe860000 0 0x2000>;
+			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 823>;
+			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
+			resets = <&cpg 823>;
+		};
+
 		vspd0: vsp@fea20000 {
 			compatible = "renesas,vsp2";
 			reg = <0 0xfea20000 0 0x5000>;

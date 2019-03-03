Return-Path: <SRS0=QYV/=RG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98EEAC43381
	for <linux-renesas-soc@archiver.kernel.org>; Sun,  3 Mar 2019 19:41:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 62CC320835
	for <linux-renesas-soc@archiver.kernel.org>; Sun,  3 Mar 2019 19:41:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UITljxWb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbfCCTlr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 3 Mar 2019 14:41:47 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44156 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbfCCTlr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 3 Mar 2019 14:41:47 -0500
Received: by mail-wr1-f68.google.com with SMTP id w2so3218766wrt.11
        for <linux-renesas-soc@vger.kernel.org>; Sun, 03 Mar 2019 11:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i+rKDAR1xxZ4fz2qC3uwWgRorvL6aBHK3Uw5llrPjDg=;
        b=UITljxWbX3FxteG1BdlGduwnjQORlFFvIf2e9wlJfmFRUdNrkRD/K/lWnu9jZthK+U
         BLyccgU/jLx554URAu2J/tn9J31rHl0szZa05VOKrQnKbGopbtpMDC6fW/hMtCG5Wa0K
         c6gcPpzgBF5Fgz6NTxitW4mb/G2TwGZpLcpVPHhUlquRAYxl6upddhORb4R/YxNkpyY5
         ULA/ewQC4Pz+5O5654LxbpzDv7aBfflY6EJoNm9yvL0BmLu7CJMlmAKo8K8pNNN3Hf9i
         AgNkDzPBeMzMGkFV87Pbo5/s5iOq6LA0X7BXo04XbXH/gtfFnlCDgDHu6GtS1csDWI+o
         3y/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i+rKDAR1xxZ4fz2qC3uwWgRorvL6aBHK3Uw5llrPjDg=;
        b=n4uqNBn+1WIMc0mlKr++zl2FXRgMsfVYXJRN5mWHFGV6j5pi4P443IAP1tIrYW66MD
         PrgBS9BlCwHGglmqpNnn4tYLdKLWN4ZWIb6OM/Ml0A8X0RP58/7lEp/4C35T3zKRZ3m8
         5k4mH8kxIltJRfyGtLl6CeFBHJeSjBebHnEoi2K6/q58zzdvCDeabrLsk/c+RZetcOox
         IbpHqEjcYBr2UaFLCqafekRIcHv7/DR6N2nF8occOs+xU1zmnWW1Av+UvX1XHp31WI78
         ylP/nRswgQgb+84ZhuvnPZuyfQz6yDRXczwyGp98C38AdpJkFNSVRWGGo1o7Roj3VOpp
         gShw==
X-Gm-Message-State: APjAAAXSjUtC3Db2fZwbEwhuooNN0d3QgfROSYvinUyoAEpsM+kQwVFX
        U4YBYZ8wVfiJJ1Lvp11xeaU=
X-Google-Smtp-Source: APXvYqxCb4zaG9iYpn0faWujmty94OQGHFEDv/xcYH+IkzZzmN3zX9IJAr1hiI85/oynxTRH6u2luw==
X-Received: by 2002:adf:b687:: with SMTP id j7mr10905281wre.81.1551642106106;
        Sun, 03 Mar 2019 11:41:46 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id d24sm13611709wrb.47.2019.03.03.11.41.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Mar 2019 11:41:45 -0800 (PST)
From:   marek.vasut@gmail.com
To:     linux-arm-kernel@lists.infradead.org
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ARM: shmobile: porter: enable R-Car Gen2 regulator quirk
Date:   Sun,  3 Mar 2019 20:41:40 +0100
Message-Id: <20190303194140.11757-1-marek.vasut@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marek Vasut <marek.vasut+renesas@gmail.com>

Porter needs the regulator quirk, just like the other boards.
But unlike the other boards, the Porter uses DA9063L, which
is at 0x5a. Otherwise, DA9063L and DA9210 IRQ line is still
connected to CPU IRQ2 .

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
index dc526ef2e9b3..ee949255ced3 100644
--- a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * R-Car Generation 2 da9063/da9210 regulator quirk
+ * R-Car Generation 2 da9063(L)/da9210 regulator quirk
  *
  * Certain Gen2 development boards have an da9063 and one or more da9210
  * regulators. All of these regulators have their interrupt request lines
@@ -65,6 +65,7 @@ static struct i2c_msg da9210_msg = {
 
 static const struct of_device_id rcar_gen2_quirk_match[] = {
 	{ .compatible = "dlg,da9063", .data = &da9063_msg },
+	{ .compatible = "dlg,da9063l", .data = &da9063_msg },
 	{ .compatible = "dlg,da9210", .data = &da9210_msg },
 	{},
 };
@@ -147,6 +148,7 @@ static int __init rcar_gen2_regulator_quirk(void)
 
 	if (!of_machine_is_compatible("renesas,koelsch") &&
 	    !of_machine_is_compatible("renesas,lager") &&
+	    !of_machine_is_compatible("renesas,porter") &&
 	    !of_machine_is_compatible("renesas,stout") &&
 	    !of_machine_is_compatible("renesas,gose"))
 		return -ENODEV;
@@ -210,7 +212,7 @@ static int __init rcar_gen2_regulator_quirk(void)
 		goto err_free;
 	}
 
-	pr_info("IRQ2 is asserted, installing da9063/da9210 regulator quirk\n");
+	pr_info("IRQ2 is asserted, installing regulator quirk\n");
 
 	bus_register_notifier(&i2c_bus_type, &regulator_quirk_nb);
 	return 0;
-- 
2.19.2


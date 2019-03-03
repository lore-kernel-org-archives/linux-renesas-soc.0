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
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED697C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sun,  3 Mar 2019 19:01:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B8BDB20835
	for <linux-renesas-soc@archiver.kernel.org>; Sun,  3 Mar 2019 19:01:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPnmr0b8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726624AbfCCTBG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 3 Mar 2019 14:01:06 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45667 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbfCCTBG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 3 Mar 2019 14:01:06 -0500
Received: by mail-wr1-f65.google.com with SMTP id w17so3148342wrn.12
        for <linux-renesas-soc@vger.kernel.org>; Sun, 03 Mar 2019 11:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2SYyAiNtQeMaSYgkPuBpBt0hTBmnTOGSloIwl1tQugY=;
        b=bPnmr0b8EAt/GJB0bF+VwuvNngn4wRkZK/mrSsE6sV1JzoVwLjW+4CFCplJxZZZOJ8
         xwUuvQMVyYgPrkI2r3p9QCum8sVnwKP+Ixy7m9q7y0Bi8AMFXSOcMDSkXohIgVO7qzXM
         z+eqkXX8LeQeaHzb9UXMAl601RJ9Jl+x0AeEw9V1EKCTHqoEAqn3GmsWvSwENgzDyU2K
         gYjLXUDsRLGr7Z26oRSBlWa+jkEq8tp2rU6VAr7db24wqssOpuaDG1vebsCXcpHuDUAX
         PbjR2s0xY1YWu2GqUa2fYKUz7AbWS/laTZbrE8dk71eKJdgQ/6w/5P4hSgfXmkmTc+eg
         n7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2SYyAiNtQeMaSYgkPuBpBt0hTBmnTOGSloIwl1tQugY=;
        b=NCamwnonjGAX6X0iCDQtuCxpLuLIJMtyXF5ytgutn3VqO/Ac/kTr7JiXPidfbYaJQq
         OOSY23TaI6F7n++N0usSMZj/v+7lsGhdtbbP5SHtB3/qvrMKzK/fLZXDRPBSJTQEWQIB
         avT7ZnKDH5I/lLU6r0Vm117VJ5V1usoam7Rm8Kub02f0F/r8YV4wA/I6/q/SGHSZGgLA
         urLaWvGJ4sUVG4hnYTM7WpgdJSlfbWQAc5U17NkzP4JGKlznK3cKTXUVqhMvjt9SEl8U
         jJqEXyImt9xzhfnpdKtNTe8ng12N3bUpRdERi3Kn5YH9iMNVBkBshrEtC3C/LYH5AHzM
         +9vQ==
X-Gm-Message-State: APjAAAVKvtxT3zCh5UHxyONvAK7Hpuv19qez9s/9VsyYsNAcXhx6mNXJ
        7bO3VbV40v5kt0J1U27cRp8=
X-Google-Smtp-Source: APXvYqyGzj1KVB517zW39a6i1jl2cqQo3D9LW0VXKTTU4jOxPmUCRnF4l/bSAZhIse7E6GqG2bMOoQ==
X-Received: by 2002:a05:6000:1107:: with SMTP id z7mr9788324wrw.87.1551639664368;
        Sun, 03 Mar 2019 11:01:04 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id e7sm4765001wrw.35.2019.03.03.11.01.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Mar 2019 11:01:03 -0800 (PST)
From:   marek.vasut@gmail.com
To:     linux-arm-kernel@lists.infradead.org
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ARM: dts: alt: Add DA9063 PMIC node
Date:   Sun,  3 Mar 2019 20:00:59 +0100
Message-Id: <20190303190059.31155-1-marek.vasut@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marek Vasut <marek.vasut+renesas@gmail.com>

Add DA9063 PMIC node to the I2C bus.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
---
NOTE: R8A7794 Alt does not share the PMIC IRQ line with other PMICs,
      hence the regulator-quirk-rcar-gen2.c does not need a new entry.
---
 arch/arm/boot/dts/r8a7794-alt.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7794-alt.dts b/arch/arm/boot/dts/r8a7794-alt.dts
index ef7e2a837df6..e0500ec81569 100644
--- a/arch/arm/boot/dts/r8a7794-alt.dts
+++ b/arch/arm/boot/dts/r8a7794-alt.dts
@@ -377,6 +377,27 @@
 	pinctrl-names = "i2c-exio4";
 };
 
+&i2c7 {
+	status = "okay";
+	clock-frequency = <100000>;
+
+	pmic@58 {
+		compatible = "dlg,da9063";
+		reg = <0x58>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <31 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+
+		rtc {
+			compatible = "dlg,da9063-rtc";
+		};
+
+		wdt {
+			compatible = "dlg,da9063-watchdog";
+		};
+	};
+};
+
 &vin0 {
 	status = "okay";
 	pinctrl-0 = <&vin0_pins>;
-- 
2.19.2


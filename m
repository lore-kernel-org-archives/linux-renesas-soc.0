Return-Path: <SRS0=0QpP=RQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A268EC43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 10:58:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 64DFE20449
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 10:58:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="RtuNclnA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725889AbfCMK6l (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 Mar 2019 06:58:41 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34899 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbfCMK6l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Mar 2019 06:58:41 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 9DC4825BEEF;
        Wed, 13 Mar 2019 21:58:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1552474714; bh=3Og66wIwLiKJ8nbQhYzq9FEedOzOFKfWZy2KErnquJY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RtuNclnAHJDjxEWTVuo+0JU9ZaI0fSQN6Z16KnaqZ79tZVE84rfArgdVCLn/WppTI
         SRDXbPvs4IWYEd7PeoGftwxJJyayREeO5fZAWnq3lZfBHGwRwDPKkCkiqK7fo67LXG
         pFToZedYVeUwIHatKJdmgH55ntHJvtwY0BY8RNQo=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id DFE72940ABA; Wed, 13 Mar 2019 11:58:32 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH v2 1/2] arm64: dts: renesas: r8a77990-ebisu: Add BD9571 PMIC
Date:   Wed, 13 Mar 2019 11:58:15 +0100
Message-Id: <20190313105816.8592-2-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190313105816.8592-1-horms+renesas@verge.net.au>
References: <20190313105816.8592-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds the regulator definition required for operation of
S2RAM.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index fb50f4fa8b9d..18a99d2e1ea5 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -449,6 +449,26 @@
 	};
 };
 
+&i2c_dvfs {
+	status = "okay";
+
+	clock-frequency = <400000>;
+
+	pmic: pmic@30 {
+		pinctrl-0 = <&irq0_pins>;
+		pinctrl-names = "default";
+
+		compatible = "rohm,bd9571mwv";
+		reg = <0x30>;
+		interrupt-parent = <&intc_ex>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
 &lvds0 {
 	status = "okay";
 
@@ -511,6 +531,11 @@
 		function = "du";
 	};
 
+	irq0_pins: irq0 {
+		groups = "intc_ex_irq0";
+		function = "intc_ex";
+	};
+
 	pwm3_pins: pwm3 {
 		groups = "pwm3_b";
 		function = "pwm3";
-- 
2.11.0


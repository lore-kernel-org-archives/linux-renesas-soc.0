Return-Path: <SRS0=YxuQ=RH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C80D3C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 20:00:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 95C5020830
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 20:00:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezW8ZNaZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbfCDUAE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Mar 2019 15:00:04 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38037 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbfCDUAD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Mar 2019 15:00:03 -0500
Received: by mail-wm1-f66.google.com with SMTP id a188so366655wmf.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Mar 2019 12:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=izeC3MPzkJiN0dwgJ1xAUmbwdWlmdpbDHFnmDaGbcxY=;
        b=ezW8ZNaZE2QzCYkmnhzNuZ1XGvjtqgY1N+LoTum6pq+VPb6OjbaQzet3ZGdQY6QdJ6
         QKgxtRUFtJSlj7kpHHH94ns3/RFa62sJrmjpCBX+OJeNg0q8YwJ8JCB3Ueh0piabb7IH
         74OQo2Gvxovx3v/bav5o0u2a646SalVyGrlSK/3folnqsXAq6iR7vnqjTXdq3oAA1Vhn
         YnjwtOk5zdESiRYPm/yPhnqwl8Y/hz+uzfj3D0E7v3c+7irov/jIpBP8jS+5+Pz1Zd29
         Zzbd8Rf6rEsKtI66CF1F4lPewOFfL0fz14oTsfM3jvU3x290bQ7hu5DC5voXOkzD6m0M
         SBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=izeC3MPzkJiN0dwgJ1xAUmbwdWlmdpbDHFnmDaGbcxY=;
        b=RAp/Bjsz39dVSaaP9WNnFAGVa9SINQ9nefmmFl25P6p/T5Fqsh4WgYPzpJIpI8vlMF
         neOx1o1sVuDHxzrvoA/S+Sabvb25lD5lPKwnBDPex9HDD8Jat/j1rWgCHi0M4ByIXcM0
         ap96DsQKoZp0sznmzIcZY1pNTYlgw8PE28GxyOsSUG5UWHCS/kCxmKL0rnvQAYRWOrPp
         a2vcHcOA3Kok/HpaaPFYuhfTUmQGIn9f0g9eugcgi02KZl7Yx/HUAu96N/OfnZlSC+LB
         NoSQTBfHwzkpuWqJBxzWMuzv+w5Ylid8e61yYUG9X3T+fipHnH7nr65014mVeOXkL55s
         d4gw==
X-Gm-Message-State: APjAAAVHh5Iiq2WDKRG4AKfS00NAFeV8Nt0upxk6qi2lZu1Wuj9ycdZY
        yolV+LivUUyVd2C+JSFaGcI=
X-Google-Smtp-Source: APXvYqwPHvCPVCNqaVH2g2cUZUBvvTObIhTRNjMczeve+kBJyNAxET+zVDJHrSjlG5tURfEkbTZLxg==
X-Received: by 2002:a1c:67c2:: with SMTP id b185mr499187wmc.68.1551729601461;
        Mon, 04 Mar 2019 12:00:01 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id p1sm5921595wrx.50.2019.03.04.12.00.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Mar 2019 12:00:00 -0800 (PST)
From:   marek.vasut@gmail.com
To:     linux-arm-kernel@lists.infradead.org
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ARM: dts: r8a7792: blanche: Add IIC3 and DA9063 PMIC node
Date:   Mon,  4 Mar 2019 20:59:58 +0100
Message-Id: <20190304195958.8383-1-marek.vasut@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marek Vasut <marek.vasut+renesas@gmail.com>

Add IIC3 node to R8A7792 SoC device tree and a DA9063 PMIC node
to V2H Blanche board device tree.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
---
NOTE: R8A7792 Blanche does not share the PMIC IRQ line with other PMICs,
      hence the regulator-quirk-rcar-gen2.c does not need a new entry.
---
 arch/arm/boot/dts/r8a7792-blanche.dts | 20 ++++++++++++++++++++
 arch/arm/boot/dts/r8a7792.dtsi        | 18 ++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7792-blanche.dts b/arch/arm/boot/dts/r8a7792-blanche.dts
index f92301290b02..b6fa80c3b07e 100644
--- a/arch/arm/boot/dts/r8a7792-blanche.dts
+++ b/arch/arm/boot/dts/r8a7792-blanche.dts
@@ -308,6 +308,26 @@
 	};
 };
 
+&iic3 {
+	status = "okay";
+
+	pmic@58 {
+		compatible = "dlg,da9063";
+		reg = <0x58>;
+		interrupt-parent = <&irqc>;
+		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
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
 &du {
 	pinctrl-0 = <&du0_pins &du1_pins>;
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/r8a7792.dtsi b/arch/arm/boot/dts/r8a7792.dtsi
index 8e9eb4b704d3..38fb43d11b27 100644
--- a/arch/arm/boot/dts/r8a7792.dtsi
+++ b/arch/arm/boot/dts/r8a7792.dtsi
@@ -22,6 +22,7 @@
 		i2c3 = &i2c3;
 		i2c4 = &i2c4;
 		i2c5 = &i2c5;
+		i2c6 = &iic3;
 		spi0 = &qspi;
 		spi1 = &msiof0;
 		spi2 = &msiof1;
@@ -444,6 +445,23 @@
 			status = "disabled";
 		};
 
+		iic3: i2c@e60b0000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,iic-r8a7792",
+				     "renesas,rcar-gen2-iic",
+				     "renesas,rmobile-iic";
+			reg = <0 0xe60b0000 0 0x425>;
+			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 926>;
+			dmas = <&dmac0 0x77>, <&dmac0 0x78>,
+			       <&dmac1 0x77>, <&dmac1 0x78>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			resets = <&cpg 926>;
+			status = "disabled";
+		};
+
 		dmac0: dma-controller@e6700000 {
 			compatible = "renesas,dmac-r8a7792",
 				     "renesas,rcar-dmac";
-- 
2.19.2


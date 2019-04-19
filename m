Return-Path: <SRS0=xIzj=SV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7390EC282E0
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:22:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4F554222AF
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:22:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727426AbfDSSW6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:22:58 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:58840 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727580AbfDSSW5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Apr 2019 14:22:57 -0400
Received: from penelope.horms.nl (unknown [62.153.215.140])
        by kirsty.vergenet.net (Postfix) with ESMTPA id BDF6725BE44;
        Sat, 20 Apr 2019 00:34:51 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id C26A1E21AFB; Fri, 19 Apr 2019 16:34:49 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 03/21] ARM: dts: ape6evm: Add NOR FLASH
Date:   Fri, 19 Apr 2019 16:34:30 +0200
Message-Id: <53239664e5ae353f60f37a566dbd32415a906ee8.1555655522.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1555655522.git.horms+renesas@verge.net.au>
References: <cover.1555655522.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>

Describe the 128 MiB CFI NOR FLASH, which contains the boot loader and
its environment.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a73a4-ape6evm.dts | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/r8a73a4-ape6evm.dts b/arch/arm/boot/dts/r8a73a4-ape6evm.dts
index d530f451467e..b1e0d556be0a 100644
--- a/arch/arm/boot/dts/r8a73a4-ape6evm.dts
+++ b/arch/arm/boot/dts/r8a73a4-ape6evm.dts
@@ -166,6 +166,33 @@
 };
 
 &bsc {
+	flash@0 {
+		compatible = "cfi-flash", "mtd-rom";
+		reg = <0x0 0x08000000>;
+		bank-width = <2>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "uboot";
+				reg = <0x00000000 0x00040000>;
+				read-only;
+			};
+			partition@40000 {
+				label = "uboot-env";
+				reg = <0x00040000 0x00040000>;
+				read-only;
+			};
+			partition@80000 {
+				label = "flash";
+				reg = <0x00080000 0x07f80000>;
+			};
+		};
+	};
+
 	ethernet@8000000 {
 		compatible = "smsc,lan9220", "smsc,lan9115";
 		reg = <0x08000000 0x1000>;
-- 
2.11.0


Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC590C00144
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Jul 2022 16:45:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236532AbiG2QpQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 29 Jul 2022 12:45:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237371AbiG2QpP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Jul 2022 12:45:15 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A34976418
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Jul 2022 09:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=sZOUgMesAI4Kpf
        XSns3YxeOweJTPEa4aG6BNLGhcWVM=; b=2D5MkX+u+Yhs/gBGAsKYLM/OebxYyU
        aD5GcbImK7/kF9pIBjtNTijStk453O59sm7RtJIc6bf6SoaLT8jHT+nAply1ldEW
        +wR3xWl2XqbIz2j1Oc1Yh81BPlRhjAKVFJfcqAPLSn9WIcm02lSvu1sb8yN/HGXz
        taSSeV/u/1lEs=
Received: (qmail 4012248 invoked from network); 29 Jul 2022 18:45:10 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jul 2022 18:45:10 +0200
X-UD-Smtp-Session: l3s3148p1@krZNX/TkhX9ScWOH
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 5/5] arm64: dts: renesas: r8a779a0: put I2C aliases to board files
Date:   Fri, 29 Jul 2022 18:44:25 +0200
Message-Id: <20220729164425.11062-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220729164425.11062-1-wsa+renesas@sang-engineering.com>
References: <20220729164425.11062-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

I2C aliases are not a property of a SoC. They belong to board files
where they are named accordingly in the schematics.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi |  7 +++++++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi            | 10 ----------
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
index 53c4a26198e3..99b73e21c82c 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
@@ -16,6 +16,13 @@ / {
 	compatible = "renesas,falcon-cpu", "renesas,r8a779a0";
 
 	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
 		serial0 = &scif0;
 	};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 3d668709d8a8..3e1557a5b5e1 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -14,16 +14,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		i2c0 = &i2c0;
-		i2c1 = &i2c1;
-		i2c2 = &i2c2;
-		i2c3 = &i2c3;
-		i2c4 = &i2c4;
-		i2c5 = &i2c5;
-		i2c6 = &i2c6;
-	};
-
 	/* External CAN clock - to be overridden by boards that provide it */
 	can_clk: can {
 		compatible = "fixed-clock";
-- 
2.35.1


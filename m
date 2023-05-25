Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39309C7EE2C
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 May 2023 08:48:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbjEYIsa (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 25 May 2023 04:48:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232749AbjEYIs2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 May 2023 04:48:28 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0C2EA3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 May 2023 01:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=CZPViFPh2tEYkW
        59h/uJG4WK/VL3AZJKeFPbzZX2jCw=; b=TEcHnidSfT13wC4xhHEJ5Cvr3Kld+w
        2j+ulHCnerAeIu0D2iqNGeydfEE119r+zgsRELchHWFPGpM/f7/cmQFX/D2Zb48y
        6lU19C5Y+f2qlOl90Q5Chv/vkFBEBCJsAad2wZO7CcTZ+lELx81/2VIj3lviO7gS
        WAMK3m9Z4Y0ho=
Received: (qmail 3453228 invoked from network); 25 May 2023 10:48:25 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 May 2023 10:48:25 +0200
X-UD-Smtp-Session: l3s3148p1@La8Cr4D84LsujnsI
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/2] arm64: dts: renesas: ulcb-kf: remove flow control for SCIF1
Date:   Thu, 25 May 2023 10:48:22 +0200
Message-Id: <20230525084823.4195-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230525084823.4195-1-wsa+renesas@sang-engineering.com>
References: <20230525084823.4195-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The schematics are misleading, the flow control is for HSCIF1. We need
SCIF1 for GNSS/GPS which does not use flow control.

Fixes: c6c816e22bc8 ("arm64: dts: ulcb-kf: enable SCIF1")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index ff3a9ab6e6b0..4c6d50acfab1 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -388,7 +388,7 @@ hscif0_pins: hscif0 {
 	};
 
 	scif1_pins: scif1 {
-		groups = "scif1_data_b", "scif1_ctrl";
+		groups = "scif1_data_b";
 		function = "scif1";
 	};
 
@@ -418,7 +418,6 @@ &sound_clk_pins
 &scif1 {
 	pinctrl-0 = <&scif1_pins>;
 	pinctrl-names = "default";
-	uart-has-rtscts;
 
 	status = "okay";
 };
-- 
2.30.2


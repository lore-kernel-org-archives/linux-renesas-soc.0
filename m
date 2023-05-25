Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C33C7EE2F
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 May 2023 08:48:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232749AbjEYIsa (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 25 May 2023 04:48:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240420AbjEYIs3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 May 2023 04:48:29 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35B7312F
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 May 2023 01:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=WHYvNBFRWc3LhO
        RdZw/gO4dDp3kRj2jIyz8N7XjTcf0=; b=E8kPq8nbFV/iD/4qv2Zf0KqPviVy8r
        ubIEtBOy4SBpO+P+y+uo7nj0jYUgwetAbEvK3pLXqbcz6PVUZ4AHhPezmQgXkZ3L
        +QypKSIntWHoWjaxJc7s3pjrpLh7xHxHPP8wduGOlgdzL7Mr8gRJTacLRbHjTAAb
        yxeim1czDsPbU=
Received: (qmail 3453254 invoked from network); 25 May 2023 10:48:26 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 May 2023 10:48:26 +0200
X-UD-Smtp-Session: l3s3148p1@xWYJr4D84rsujnsI
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/2] arm64: dts: renesas: ulcb-kf: add HSCIF1 node
Date:   Thu, 25 May 2023 10:48:23 +0200
Message-Id: <20230525084823.4195-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230525084823.4195-1-wsa+renesas@sang-engineering.com>
References: <20230525084823.4195-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Exposed on CN4. Tested by connecting it to a Renesas Ebisu board.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index 4c6d50acfab1..e62f5359f64b 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -10,6 +10,7 @@ / {
 	aliases {
 		serial1 = &hscif0;
 		serial2 = &scif1;
+		serial3 = &hscif1;
 		mmc2 = &sdhi3;
 	};
 
@@ -132,6 +133,14 @@ &hscif0 {
 	status = "okay";
 };
 
+&hscif1 {
+	pinctrl-0 = <&hscif1_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+
+	status = "okay";
+};
+
 &hsusb {
 	dr_mode = "otg";
 	status = "okay";
@@ -387,6 +396,11 @@ hscif0_pins: hscif0 {
 		function = "hscif0";
 	};
 
+	hscif1_pins: hscif1 {
+		groups = "hscif1_data_a", "hscif1_ctrl_a";
+		function = "hscif1";
+	};
+
 	scif1_pins: scif1 {
 		groups = "scif1_data_b";
 		function = "scif1";
-- 
2.30.2


Return-Path: <SRS0=QNR1=P6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7044EC282C5
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 22:54:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3392120870
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 22:54:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="My802Ja5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbfAVWyQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Jan 2019 17:54:16 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60682 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726917AbfAVWyP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jan 2019 17:54:15 -0500
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A575575;
        Tue, 22 Jan 2019 23:54:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1548197652;
        bh=BEZ16CiJSu7QAXvE86OqZdAR5rJpEpv+/JgQRuwatAI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=My802Ja5m/18Wlvc5vkNYRgQ3L3unva5fSTe5qjH2Te8egFyALj3OCub1a8+pDX/A
         k62VqJzTURG1wRvbA+GqZiMFRqijOLnmObP249ZQ+3yOMp4Ip8PIbE29DxAo7TuENl
         WedfEIm0MzaNwH8oimp7lmsrnOkpSHOEJCXzLZX0=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 5/6] arm64: dts: renesas: r8a77990: ebisu: Enable LVDS1 encoder
Date:   Wed, 23 Jan 2019 00:54:04 +0200
Message-Id: <20190122225405.7815-6-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190122225405.7815-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190122225405.7815-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The LVDS1 encoder must supply a pixel clock to the DU for the DPAD
output when the LVDS0 encoder is used. Enable it despite its output not
being connected.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Add a comment in the DT to explain why the LVDS1 encoder needs to be
  enabled.
---
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index 62bdddcbbae7..800a537bbbe0 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -443,6 +443,13 @@
 };
 
 &lvds1 {
+	/*
+	 * Even though the LVDS1 output is not connected, the encoder must be
+	 * enabled to supply a pixel clock to the DU for the DPAD output when
+	 * LVDS0 is in use.
+	 */
+	status = "okay";
+
 	clocks = <&cpg CPG_MOD 727>,
 		 <&x13_clk>,
 		 <&extal_clk>;
-- 
Regards,

Laurent Pinchart


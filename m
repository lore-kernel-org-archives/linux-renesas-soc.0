Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEDABC4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 23:24:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 807D920663
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 23:24:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k4i9CH6c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725747AbfCFXYN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 18:24:13 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46772 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726342AbfCFXYN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 18:24:13 -0500
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 87DF29A9;
        Thu,  7 Mar 2019 00:24:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1551914643;
        bh=gC/sgp1AgI1I/1uCUwkm8V/uMDhOzfBxSOz3UrWRjaI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=k4i9CH6cZ0j/EdC7ShlzO1/S77hM40q0KkQpp/1Usa08RclPTC0f0eBS1Wx0UP7RQ
         Lw8dJh3NDRLZIaZjCPi24Ndm/1ZcAFxs8uAFrgexGunY04IVA0D7zM1ygHi8TjAkUK
         SjM0dBGo3ubiXjZ8FcpyHaf5iBs5Vq41y3spPb78=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH/RFC 15/15] [HACK] arm64: dts: renesas: ebisu: Enable LVDS dual-link operation
Date:   Thu,  7 Mar 2019 01:23:45 +0200
Message-Id: <20190306232345.23052-16-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable and connect the second LVDS encoder to the second LVDS input of
the THC63LVD1024 for dual-link LVDS operation. This requires changing
the default settings of SW45 and SW47 to OFF and ON respectively.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../arm64/boot/dts/renesas/r8a77990-ebisu.dts | 21 +++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index 62bdddcbbae7..4b9f3305b666 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -83,11 +83,18 @@
 
 			port@0 {
 				reg = <0>;
-				thc63lvd1024_in: endpoint {
+				thc63lvd1024_in0: endpoint {
 					remote-endpoint = <&lvds0_out>;
 				};
 			};
 
+			port@1 {
+				reg = <1>;
+				thc63lvd1024_in1: endpoint {
+					remote-endpoint = <&lvds1_out>;
+				};
+			};
+
 			port@2 {
 				reg = <2>;
 				thc63lvd1024_out: endpoint {
@@ -436,17 +443,27 @@
 	ports {
 		port@1 {
 			lvds0_out: endpoint {
-				remote-endpoint = <&thc63lvd1024_in>;
+				remote-endpoint = <&thc63lvd1024_in0>;
 			};
 		};
 	};
 };
 
 &lvds1 {
+	status = "okay";
+
 	clocks = <&cpg CPG_MOD 727>,
 		 <&x13_clk>,
 		 <&extal_clk>;
 	clock-names = "fck", "dclkin.0", "extal";
+
+	ports {
+		port@1 {
+			lvds1_out: endpoint {
+				remote-endpoint = <&thc63lvd1024_in1>;
+			};
+		};
+	};
 };
 
 &ohci0 {
-- 
Regards,

Laurent Pinchart


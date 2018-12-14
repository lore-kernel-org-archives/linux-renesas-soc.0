Return-Path: <SRS0=qJci=OX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B118C67839
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 07:18:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 89EFA2086D
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 07:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89EFA2086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jinso.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbeLNHSO (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 02:18:14 -0500
Received: from www3345.sakura.ne.jp ([49.212.235.55]:15211 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbeLNHSO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 02:18:14 -0500
Received: from fsav110.sakura.ne.jp (fsav110.sakura.ne.jp [27.133.134.237])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id wBE7IB8K035316;
        Fri, 14 Dec 2018 16:18:11 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav110.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav110.sakura.ne.jp);
 Fri, 14 Dec 2018 16:18:11 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav110.sakura.ne.jp)
Received: from localhost (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id wBE7I5jY035278
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 14 Dec 2018 16:18:10 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
From:   Nguyen An Hoan <na-hoan@jinso.co.jp>
To:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com
Cc:     kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp,
        cv-dong@jinso.co.jp
Subject: [PATCH] drm: rcar-du: Add r8a77965 LVDS dts overlay
Date:   Fri, 14 Dec 2018 16:18:05 +0900
Message-Id: <1544771885-17023-1-git-send-email-na-hoan@jinso.co.jp>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Hoan Nguyen An <na-hoan@jinso.co.jp>

Add r8a77965 LVDS dts overlay support.

Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
---
 drivers/gpu/drm/rcar-du/Makefile                   |  4 +-
 drivers/gpu/drm/rcar-du/rcar_du_of.c               |  2 +
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a77965.dts   | 50 ++++++++++++++++++++++
 3 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a77965.dts

diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
index 2a3b8d7..9e73a83 100644
--- a/drivers/gpu/drm/rcar-du/Makefile
+++ b/drivers/gpu/drm/rcar-du/Makefile
@@ -11,7 +11,8 @@ rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)	+= rcar_du_of.o \
 					   rcar_du_of_lvds_r8a7791.dtb.o \
 					   rcar_du_of_lvds_r8a7793.dtb.o \
 					   rcar_du_of_lvds_r8a7795.dtb.o \
-					   rcar_du_of_lvds_r8a7796.dtb.o
+					   rcar_du_of_lvds_r8a7796.dtb.o \
+					   rcar_du_of_lvds_r8a77965.dtb.o
 rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+= rcar_du_vsp.o
 
 obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
@@ -24,3 +25,4 @@ DTC_FLAGS_rcar_du_of_lvds_r8a7791 += -Wno-graph_endpoint
 DTC_FLAGS_rcar_du_of_lvds_r8a7793 += -Wno-graph_endpoint
 DTC_FLAGS_rcar_du_of_lvds_r8a7795 += -Wno-graph_endpoint
 DTC_FLAGS_rcar_du_of_lvds_r8a7796 += -Wno-graph_endpoint
+DTC_FLAGS_rcar_du_of_lvds_r8a77965 += -Wno-graph_endpoint
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of.c b/drivers/gpu/drm/rcar-du/rcar_du_of.c
index afef696..56c341c 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_of.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_of.c
@@ -107,6 +107,7 @@ RCAR_DU_OF_DTB(lvds, r8a7791);
 RCAR_DU_OF_DTB(lvds, r8a7793);
 RCAR_DU_OF_DTB(lvds, r8a7795);
 RCAR_DU_OF_DTB(lvds, r8a7796);
+RCAR_DU_OF_DTB(lvds, r8a77965);
 
 static const struct rcar_du_of_overlay rcar_du_lvds_overlays[] __initconst = {
 	RCAR_DU_OF_OVERLAY(lvds, r8a7790),
@@ -114,6 +115,7 @@ static const struct rcar_du_of_overlay rcar_du_lvds_overlays[] __initconst = {
 	RCAR_DU_OF_OVERLAY(lvds, r8a7793),
 	RCAR_DU_OF_OVERLAY(lvds, r8a7795),
 	RCAR_DU_OF_OVERLAY(lvds, r8a7796),
+	RCAR_DU_OF_OVERLAY(lvds, r8a77965),
 	{ /* Sentinel */ },
 };
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a77965.dts b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a77965.dts
new file mode 100644
index 0000000..34aea91
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a77965.dts
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * rcar_du_of_lvds_r8a77965.dts - Legacy LVDS DT bindings conversion for R8A77965
+ *
+ * Copyright (C) 2018 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ */
+
+/dts-v1/;
+/plugin/;
+/ {
+	fragment@0 {
+		target-path = "/soc";
+		__overlay__ {
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			lvds@feb90000 {
+				compatible = "renesas,r8a77965-lvds";
+				reg = <0 0xfeb90000 0 0x14>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						lvds0_input: endpoint {
+						};
+					};
+					port@1 {
+						reg = <1>;
+						lvds0_out: endpoint {
+						};
+					};
+				};
+			};
+		};
+	};
+
+	fragment@1 {
+		target-path = "/soc/display@feb00000/ports";
+		__overlay__ {
+			port@2 {
+				endpoint {
+					remote-endpoint = <&lvds0_input>;
+				};
+			};
+		};
+	};
+};
-- 
2.7.4


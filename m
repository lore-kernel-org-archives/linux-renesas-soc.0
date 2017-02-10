Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <SRS0=Wi0l=ZX=ideasonboard.com=kieran.bingham+renesas@kernel.org>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	kieran.bingham@ideasonboard.com
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 1/8] v4l: vsp1: Provide UDS register updates
Date: Fri, 10 Feb 2017 20:27:29 +0000
Message-Id: <bf28e7e9bf28ff60c505592072a234f8dd568f71.1486758327.git-series.kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <cover.ff94a00847faf7ed37768cea68c474926bfc8bd9.1486758327.git-series.kieran.bingham+renesas@ideasonboard.com>
References: <cover.ff94a00847faf7ed37768cea68c474926bfc8bd9.1486758327.git-series.kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <cover.ff94a00847faf7ed37768cea68c474926bfc8bd9.1486758327.git-series.kieran.bingham+renesas@ideasonboard.com>
References: <cover.ff94a00847faf7ed37768cea68c474926bfc8bd9.1486758327.git-series.kieran.bingham+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

Provide register definitions required for UDS phase and partition
algorithm support

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/platform/vsp1/vsp1_regs.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/platform/vsp1/vsp1_regs.h b/drivers/media/platform/vsp1/vsp1_regs.h
index 47b1dee044fb..1ad819680e2f 100644
--- a/drivers/media/platform/vsp1/vsp1_regs.h
+++ b/drivers/media/platform/vsp1/vsp1_regs.h
@@ -388,6 +388,7 @@
 #define VI6_UDS_CTRL_NE_RCR		(1 << 18)
 #define VI6_UDS_CTRL_NE_GY		(1 << 17)
 #define VI6_UDS_CTRL_NE_BCB		(1 << 16)
+#define VI6_UDS_CTRL_AMDSLH		(1 << 2)
 #define VI6_UDS_CTRL_TDIPC		(1 << 1)
 
 #define VI6_UDS_SCALE			0x2304
@@ -420,11 +421,24 @@
 #define VI6_UDS_PASS_BWIDTH_V_MASK	(0x7f << 0)
 #define VI6_UDS_PASS_BWIDTH_V_SHIFT	0
 
+#define VI6_UDS_HPHASE			0x2314
+#define VI6_UDS_HPHASE_HSTP_MASK	(0xfff << 16)
+#define VI6_UDS_HPHASE_HSTP_SHIFT	16
+#define VI6_UDS_HPHASE_HEDP_MASK	(0xfff << 0)
+#define VI6_UDS_HPHASE_HEDP_SHIFT	0
+
 #define VI6_UDS_IPC			0x2318
 #define VI6_UDS_IPC_FIELD		(1 << 27)
 #define VI6_UDS_IPC_VEDP_MASK		(0xfff << 0)
 #define VI6_UDS_IPC_VEDP_SHIFT		0
 
+#define VI6_UDS_HSZCLIP			0x231c
+#define VI6_UDS_HSZCLIP_HCEN		(1 << 28)
+#define VI6_UDS_HSZCLIP_HCL_OFST_MASK	(0x1ff << 16)
+#define VI6_UDS_HSZCLIP_HCL_OFST_SHIFT	16
+#define VI6_UDS_HSZCLIP_HCL_SIZE_MASK	(0x1fff << 0)
+#define VI6_UDS_HSZCLIP_HCL_SIZE_SHIFT	0
+
 #define VI6_UDS_CLIP_SIZE		0x2324
 #define VI6_UDS_CLIP_SIZE_HSIZE_MASK	(0x1fff << 16)
 #define VI6_UDS_CLIP_SIZE_HSIZE_SHIFT	16
-- 
git-series 0.9.1

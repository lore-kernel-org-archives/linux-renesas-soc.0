Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38EF7C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 23:24:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C3A3C20663
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 23:24:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="moKEpcNc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbfCFXYA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 18:24:00 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46728 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfCFXYA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 18:24:00 -0500
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67F09309;
        Thu,  7 Mar 2019 00:23:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1551914637;
        bh=UDC2uZs6xo1APMkgcDwmq1pOcWNZ7TYT6FBamodUEvY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=moKEpcNc3SicyzHC+hl1n8+/RZoMJM+lef7aCv1YaYxkYgWUorPxYCqrun3rnbWw/
         UjgnKlQz0QeaHeEUyZ1aC7m+mYAdlHyVRA+Z0L1piuaz8l7Z2PJCg50aGFFAvt75lf
         DgcOdYzBPv7cVRoFDyIb3G0R/gcAgbPESoRgXB8U=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH/RFC 01/15] drm: Clarify definition of the DRM_BUS_FLAG_(PIXDATA|SYNC)_* macros
Date:   Thu,  7 Mar 2019 01:23:31 +0200
Message-Id: <20190306232345.23052-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The DRM_BUS_FLAG_PIXDATA_POSEDGE and DRM_BUS_FLAG_PIXDATA_NEGEDGE macros
and their DRM_BUS_FLAG_SYNC_* counterparts define on which pixel clock
edge data and sync signals are driven. They are however used in some
drivers to define on which pixel clock edge data and sync signals are
sampled, which should usually (but not always) be the opposite edge of
the driving edge. This creates confusion.

Create four new macros for both PIXDATA and SYNC that explicitly state
the driving and sampling edge in their name to remove the confusion. The
driving macros are defined as the opposite of the sampling macros to
made code simpler based on the assumption that the driving and sampling
edges are opposite.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/drm/drm_connector.h | 36 ++++++++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 8fe22abb1e10..411c0eb4c00e 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -330,19 +330,47 @@ struct drm_display_info {
 
 #define DRM_BUS_FLAG_DE_LOW		(1<<0)
 #define DRM_BUS_FLAG_DE_HIGH		(1<<1)
-/* drive data on pos. edge */
+
+/*
+ * Don't use those two flags directly, use the DRM_BUS_FLAG_PIXDATA_DRIVE_*
+ * and DRM_BUS_FLAG_PIXDATA_SAMPLE_* variants to qualify the flags explicitly.
+ * The DRM_BUS_FLAG_PIXDATA_SAMPLE_* flags are defined as the opposite of the
+ * DRM_BUS_FLAG_PIXDATA_DRIVE_* flags to make code simpler, as signals are
+ * usually to be sampled on the opposite edge of the driving edge.
+ */
 #define DRM_BUS_FLAG_PIXDATA_POSEDGE	(1<<2)
-/* drive data on neg. edge */
 #define DRM_BUS_FLAG_PIXDATA_NEGEDGE	(1<<3)
+
+/* Drive data on rising edge */
+#define DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE	DRM_BUS_FLAG_PIXDATA_POSEDGE
+/* Drive data on falling edge */
+#define DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE	DRM_BUS_FLAG_PIXDATA_NEGEDGE
+/* Sample data on rising edge */
+#define DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE	DRM_BUS_FLAG_PIXDATA_NEGEDGE
+/* Sample data on falling edge */
+#define DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE	DRM_BUS_FLAG_PIXDATA_POSEDGE
+
 /* data is transmitted MSB to LSB on the bus */
 #define DRM_BUS_FLAG_DATA_MSB_TO_LSB	(1<<4)
 /* data is transmitted LSB to MSB on the bus */
 #define DRM_BUS_FLAG_DATA_LSB_TO_MSB	(1<<5)
-/* drive sync on pos. edge */
+
+/*
+ * Similarly to the DRM_BUS_FLAG_PIXDATA_* flags, don't use these two flags
+ * directly, use one of the DRM_BUS_FLAG_SYNC_(DRIVE|SAMPLE)_* instead.
+ */
 #define DRM_BUS_FLAG_SYNC_POSEDGE	(1<<6)
-/* drive sync on neg. edge */
 #define DRM_BUS_FLAG_SYNC_NEGEDGE	(1<<7)
 
+/* Drive sync on rising edge */
+#define DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE		DRM_BUS_FLAG_SYNC_POSEDGE
+/* Drive sync on falling edge */
+#define DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE		DRM_BUS_FLAG_SYNC_NEGEDGE
+/* Sample sync on rising edge */
+#define DRM_BUS_FLAG_SYNC_SAMPLE_POSEDGE	DRM_BUS_FLAG_SYNC_NEGEDGE
+/* Sample sync on falling edge */
+#define DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE	DRM_BUS_FLAG_SYNC_POSEDGE
+
 	/**
 	 * @bus_flags: Additional information (like pixel signal polarity) for
 	 * the pixel data on the bus, using DRM_BUS_FLAGS\_ defines.
-- 
Regards,

Laurent Pinchart


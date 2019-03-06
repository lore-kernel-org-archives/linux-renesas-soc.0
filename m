Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E76C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 23:24:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 933C720663
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 23:24:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vCz2laIx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbfCFXYD (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 18:24:03 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46772 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726320AbfCFXYD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 18:24:03 -0500
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 892849A9;
        Thu,  7 Mar 2019 00:23:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1551914638;
        bh=GJsNbZ0GENPcssqzccdeEG1u9W56EwIJg6KA0jITGAk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vCz2laIxldnMVHhJI98ns++zFfifzP21WbCvffmXTJP6B5mFzv29SMekIJ6q9Q1yn
         xh40hNfkBRpAz9VH/96RKZ8QPncELFAtGSsX6M9r/ObAKyMVG8SQWk944w1y10l5rs
         gALNABqXpGBXk7/cFzVQ3wetfDd9kuDSph5kpuiQ=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH/RFC 03/15] drm/bridge: use bus flags in bridge timings
Date:   Thu,  7 Mar 2019 01:23:33 +0200
Message-Id: <20190306232345.23052-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Stefan Agner <stefan@agner.ch>

The DRM bus flags convey additional information on pixel data on
the bus. All current available bus flags might be of interest for
a bridge. Remove the sampling_edge field and use bus_flags.

In the case at hand a dumb VGA bridge needs a specific data enable
polarity (DRM_BUS_FLAG_DE_LOW).

Signed-off-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/bridge/dumb-vga-dac.c |  6 +++---
 include/drm/drm_bridge.h              | 12 +++++-------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/dumb-vga-dac.c b/drivers/gpu/drm/bridge/dumb-vga-dac.c
index 94ed450e308d..e64736c39a9f 100644
--- a/drivers/gpu/drm/bridge/dumb-vga-dac.c
+++ b/drivers/gpu/drm/bridge/dumb-vga-dac.c
@@ -234,7 +234,7 @@ static int dumb_vga_remove(struct platform_device *pdev)
  */
 static const struct drm_bridge_timings default_dac_timings = {
 	/* Timing specifications, datasheet page 7 */
-	.sampling_edge = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
+	.input_bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
 	.setup_time_ps = 500,
 	.hold_time_ps = 1500,
 };
@@ -245,7 +245,7 @@ static const struct drm_bridge_timings default_dac_timings = {
  */
 static const struct drm_bridge_timings ti_ths8134_dac_timings = {
 	/* From timing diagram, datasheet page 9 */
-	.sampling_edge = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
+	.input_bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
 	/* From datasheet, page 12 */
 	.setup_time_ps = 3000,
 	/* I guess this means latched input */
@@ -258,7 +258,7 @@ static const struct drm_bridge_timings ti_ths8134_dac_timings = {
  */
 static const struct drm_bridge_timings ti_ths8135_dac_timings = {
 	/* From timing diagram, datasheet page 14 */
-	.sampling_edge = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
+	.input_bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
 	/* From datasheet, page 16 */
 	.setup_time_ps = 2000,
 	.hold_time_ps = 500,
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 5e5129206f40..d4428913a4e1 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -244,15 +244,13 @@ struct drm_bridge_funcs {
  */
 struct drm_bridge_timings {
 	/**
-	 * @sampling_edge:
+	 * @input_bus_flags:
 	 *
-	 * Tells whether the bridge samples the digital input signals from the
-	 * display engine on the positive or negative edge of the clock. This
-	 * should use the DRM_BUS_FLAG_PIXDATA_SAMPLE_[POS|NEG]EDGE and
-	 * DRM_BUS_FLAG_SYNC_SAMPLE_[POS|NEG]EDGE bitwise flags from the DRM
-	 * connector (bit 2, 3, 6 and 7 valid).
+	 * Tells what additional settings for the pixel data on the bus
+	 * this bridge requires (like pixel signal polarity). See also
+	 * &drm_display_info->bus_flags.
 	 */
-	u32 sampling_edge;
+	u32 input_bus_flags;
 	/**
 	 * @setup_time_ps:
 	 *
-- 
Regards,

Laurent Pinchart


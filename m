Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.81]:32001 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732743AbeHNQiB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Aug 2018 12:38:01 -0400
From: Ulrich Hecht <uli+renesas@fpond.eu>
To: laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PROTO][PATCH 05/10] drm/bridge: adv7511: Add max-clock, min-vrefresh options
Date: Tue, 14 Aug 2018 15:49:59 +0200
Message-Id: <1534254604-24204-6-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1534254604-24204-1-git-send-email-uli+renesas@fpond.eu>
References: <1534254604-24204-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

This patch adds the option to specify a maximal clock and a minimal vertical
refresh rate.

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
[uli: renamed properties, fixed transposed parsing]
Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  7 +++++++
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 22 ++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index 73d8ccb..7f29d4f 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -271,6 +271,8 @@ enum adv7511_sync_polarity {
  * @sync_pulse:			Select the sync pulse
  * @vsync_polarity:		vsync input signal configuration
  * @hsync_polarity:		hsync input signal configuration
+ * @min_vrefresh_option:	min vrefresh option
+ * @max_freq_option:		max frequency option
  */
 struct adv7511_link_config {
 	unsigned int input_color_depth;
@@ -285,6 +287,9 @@ struct adv7511_link_config {
 	enum adv7511_input_sync_pulse sync_pulse;
 	enum adv7511_sync_polarity vsync_polarity;
 	enum adv7511_sync_polarity hsync_polarity;
+
+	unsigned int min_vrefresh_option;
+	unsigned int max_freq_option;
 };
 
 /**
@@ -354,6 +359,8 @@ struct adv7511 {
 	enum adv7511_sync_polarity vsync_polarity;
 	enum adv7511_sync_polarity hsync_polarity;
 	bool rgb;
+	unsigned int min_vref;
+	unsigned int max_freq;
 
 	struct gpio_desc *gpio_pd;
 
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 6437b87..2938b02 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -323,6 +323,8 @@ static void adv7511_set_link_config(struct adv7511 *adv7511,
 	adv7511->hsync_polarity = config->hsync_polarity;
 	adv7511->vsync_polarity = config->vsync_polarity;
 	adv7511->rgb = config->input_colorspace == HDMI_COLORSPACE_RGB;
+	adv7511->min_vref = config->min_vrefresh_option;
+	adv7511->max_freq = config->max_freq_option;
 }
 
 static void __adv7511_power_on(struct adv7511 *adv7511)
@@ -660,6 +662,16 @@ static enum drm_mode_status adv7511_mode_valid(struct adv7511 *adv7511,
 	if (mode->clock > 165000)
 		return MODE_CLOCK_HIGH;
 
+	if (adv7511->max_freq) {
+		if (mode->clock > (adv7511->max_freq / 1000))
+			return MODE_CLOCK_HIGH;
+	}
+
+	if (adv7511->min_vref) {
+		if (drm_mode_vrefresh(mode) < adv7511->min_vref)
+			return MODE_BAD;
+	}
+
 	return MODE_OK;
 }
 
@@ -1074,6 +1086,16 @@ static int adv7511_parse_dt(struct device_node *np,
 	config->vsync_polarity = ADV7511_SYNC_POLARITY_PASSTHROUGH;
 	config->hsync_polarity = ADV7511_SYNC_POLARITY_PASSTHROUGH;
 
+	ret = of_property_read_u32(np, "max-clock",
+				   &config->max_freq_option);
+	if (ret < 0)
+		config->max_freq_option = 0;
+
+	ret = of_property_read_u32(np, "min-vrefresh",
+				   &config->min_vrefresh_option);
+	if (ret < 0)
+		config->min_vrefresh_option = 0;
+
 	return 0;
 }
 
-- 
2.7.4

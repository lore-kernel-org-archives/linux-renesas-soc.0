Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:34709 "EHLO
        mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756472AbcIAVFo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Sep 2016 17:05:44 -0400
Received: by mail-lf0-f49.google.com with SMTP id p41so51406142lfi.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Sep 2016 14:05:25 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm/bridge: adv7511: add support for the 2nd chip
Date: Thu, 01 Sep 2016 23:43:30 +0300
Message-ID: <4933961.PFafUbE9pV@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The Renesas Wheat board has 2 ADV7513 chips on the same I2C bus, however
the ADV751x driver only supports 1 chip as  it tries to assign the packet/
EDID/CEC  memory I2C devices  to the fixed I2C addresses. Assign these I2C
addresses at the fixed offsets (derived from the programming guide) from
the  main register map address  instead...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against David Airlie's 'linux.git' repo's 'drm-next' branch.

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

Index: linux/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
===================================================================
--- linux.orig/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ linux/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -922,15 +922,13 @@ static int adv7511_parse_dt(struct devic
 	return 0;
 }
 
-static const int edid_i2c_addr = 0x7e;
-static const int packet_i2c_addr = 0x70;
-static const int cec_i2c_addr = 0x78;
-
 static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 {
 	struct adv7511_link_config link_config;
 	struct adv7511 *adv7511;
 	struct device *dev = &i2c->dev;
+	unsigned int main_i2c_addr = i2c->addr << 1;
+	unsigned int edid_i2c_addr = main_i2c_addr + 4;
 	unsigned int val;
 	int ret;
 
@@ -991,8 +989,10 @@ static int adv7511_probe(struct i2c_clie
 
 	regmap_write(adv7511->regmap, ADV7511_REG_EDID_I2C_ADDR, edid_i2c_addr);
 	regmap_write(adv7511->regmap, ADV7511_REG_PACKET_I2C_ADDR,
-		     packet_i2c_addr);
-	regmap_write(adv7511->regmap, ADV7511_REG_CEC_I2C_ADDR, cec_i2c_addr);
+		     main_i2c_addr - 0xa);
+	regmap_write(adv7511->regmap, ADV7511_REG_CEC_I2C_ADDR,
+		     main_i2c_addr - 2);
+
 	adv7511_packet_disable(adv7511, 0xffff);
 
 	adv7511->i2c_main = i2c;

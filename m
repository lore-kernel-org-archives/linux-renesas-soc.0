Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:49668 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750970AbeEUH3m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 May 2018 03:29:42 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 2/2] i2c: mux: demux-pinctrl: add symlinks to the demux device in sysfs
Date: Mon, 21 May 2018 09:29:39 +0200
Message-Id: <20180521072939.2836-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180521072939.2836-1-wsa+renesas@sang-engineering.com>
References: <20180521072939.2836-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Similar to mux devices, create special symlinks to connect the demuxed
bus with the demux device.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v1:
* check sysfs_create_link and print WARN if something fails

 drivers/i2c/muxes/i2c-demux-pinctrl.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/i2c/muxes/i2c-demux-pinctrl.c b/drivers/i2c/muxes/i2c-demux-pinctrl.c
index 035032e20327..13d1461703f3 100644
--- a/drivers/i2c/muxes/i2c-demux-pinctrl.c
+++ b/drivers/i2c/muxes/i2c-demux-pinctrl.c
@@ -116,6 +116,13 @@ static int i2c_demux_activate_master(struct i2c_demux_pinctrl_priv *priv, u32 ne
 	if (ret < 0)
 		goto err_with_put;
 
+	WARN(sysfs_create_link(&priv->cur_adap.dev.kobj, &priv->dev->kobj,
+			       "demux_device"),
+	     "can't create symlink to mux device\n");
+	WARN(sysfs_create_link(&priv->dev->kobj, &priv->cur_adap.dev.kobj,
+			       "channel-0"),
+	     "can't create symlink to channel 0\n");
+
 	return 0;
 
  err_with_put:
@@ -135,6 +142,9 @@ static int i2c_demux_deactivate_master(struct i2c_demux_pinctrl_priv *priv)
 	if (cur < 0)
 		return 0;
 
+	sysfs_remove_link(&priv->dev->kobj, "channel-0");
+	sysfs_remove_link(&priv->cur_adap.dev.kobj, "demux_device");
+
 	i2c_del_adapter(&priv->cur_adap);
 	i2c_put_adapter(priv->chan[cur].parent_adap);
 
-- 
2.11.0

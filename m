Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:47408 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752074AbeD3Lzz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Apr 2018 07:55:55 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/2] i2c: mux: demux-pinctrl: add symlinks to the demux device in sysfs
Date: Mon, 30 Apr 2018 13:55:44 +0200
Message-Id: <20180430115544.22903-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180430115544.22903-1-wsa+renesas@sang-engineering.com>
References: <20180430115544.22903-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Similar to mux devices, create special symlinks to connect the demuxed
bus with the demux device.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/muxes/i2c-demux-pinctrl.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/i2c/muxes/i2c-demux-pinctrl.c b/drivers/i2c/muxes/i2c-demux-pinctrl.c
index 035032e20327..d5e7d4aa6ee1 100644
--- a/drivers/i2c/muxes/i2c-demux-pinctrl.c
+++ b/drivers/i2c/muxes/i2c-demux-pinctrl.c
@@ -116,6 +116,11 @@ static int i2c_demux_activate_master(struct i2c_demux_pinctrl_priv *priv, u32 ne
 	if (ret < 0)
 		goto err_with_put;
 
+	sysfs_create_link(&priv->cur_adap.dev.kobj, &priv->dev->kobj,
+			       "demux_device");
+	sysfs_create_link(&priv->dev->kobj, &priv->cur_adap.dev.kobj,
+			       "channel-0");
+
 	return 0;
 
  err_with_put:
@@ -135,6 +140,9 @@ static int i2c_demux_deactivate_master(struct i2c_demux_pinctrl_priv *priv)
 	if (cur < 0)
 		return 0;
 
+	sysfs_remove_link(&priv->dev->kobj, "channel-0");
+	sysfs_remove_link(&priv->cur_adap.dev.kobj, "demux_device");
+
 	i2c_del_adapter(&priv->cur_adap);
 	i2c_put_adapter(priv->chan[cur].parent_adap);
 
-- 
2.11.0

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:49720 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750867AbeEUHeU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 May 2018 03:34:20 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: mux: improve error message for failed symlink
Date: Mon, 21 May 2018 09:34:13 +0200
Message-Id: <20180521073413.3423-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Trivial, but still: the failed symlink is not *for* the channel but a
link *to* the channel.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Found this while adding a similar message to the demux driver.

 drivers/i2c/i2c-mux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 9669ca4937b8..300ab4b672e4 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -418,7 +418,7 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 	snprintf(symlink_name, sizeof(symlink_name), "channel-%u", chan_id);
 	WARN(sysfs_create_link(&muxc->dev->kobj, &priv->adap.dev.kobj,
 			       symlink_name),
-	     "can't create symlink for channel %u\n", chan_id);
+	     "can't create symlink to channel %u\n", chan_id);
 	dev_info(&parent->dev, "Added multiplexed i2c bus %d\n",
 		 i2c_adapter_id(&priv->adap));
 
-- 
2.11.0

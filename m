Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:54014 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932847AbeE2K7D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 May 2018 06:59:03 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 0/1] i2c: rcar: handle RXDMA HW bug on Gen3
Date: Tue, 29 May 2018 12:58:46 +0200
Message-Id: <20180529105847.15663-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

As mentioned in the patch description, this patch works around a HW bug on
Renesas R-Car Gen3 SoCs. It had not been discovered yet because it only happens
when clearing DMA enable bits is too late because of latency. To reproduce the
problem reliably, the below patch was used [1].

To the best of my knowledge, all Gen3 SoCs are affected, so I didn't add any
soc_device_match kind of matching for now. If the situation changes, we can add
it. For now, priv->devtype is good.

The improvement can be shown by using the following command. Before the patch,
executed on a Salvator-X / R-Car M3-W ES1.0:

# i2ctransfer -y 2 w1@0x10 0 r16 w1 0 r16
0x0f 0x07 0x3f 0x20 0x20 0x55 0x05 0x07 0x0f 0x07 0x3f 0x00 0x00 0x00 0x00 0x00
0xfe 0x0f 0x07 0x3f 0x20 0x20 0x55 0x05 0x07 0x0f 0x07 0x3f 0x00 0x00 0x00 0x00
# i2ctransfer -y 2 w1@0x10 0 r16 w1 0 r16
0xfe 0x0f 0x07 0x3f 0x20 0x20 0x55 0x05 0x07 0x0f 0x07 0x3f 0x00 0x00 0x00 0x00
0xfe 0x0f 0x07 0x3f 0x20 0x20 0x55 0x05 0x07 0x0f 0x07 0x3f 0x00 0x00 0x00 0x00

Note the broken first byte (0xfe) after the first successful RXDMA transfer.
After the patch (tested with and without CONFIG_RESET_CONTROLLER):

# i2ctransfer -y 2 w1@0x10 0 r16 w1 0 r16
0x0f 0x07 0x3f 0x20 0x20 0x55 0x05 0x07 0x0f 0x07 0x3f 0x00 0x00 0x00 0x00 0x00
0x0f 0x07 0x3f 0x20 0x20 0x55 0x05 0x07 0x0f 0x07 0x3f 0x00 0x00 0x00 0x00 0x00
# i2ctransfer -y 2 w1@0x10 0 r16 w1 0 r16
0x0f 0x07 0x3f 0x20 0x20 0x55 0x05 0x07 0x0f 0x07 0x3f 0x00 0x00 0x00 0x00 0x00
0x0f 0x07 0x3f 0x20 0x20 0x55 0x05 0x07 0x0f 0x07 0x3f 0x00 0x00 0x00 0x00 0x00

Looks way better!

Patch was tested with current renesas-drivers/master, but should also apply cleanly
on i2c/for-next or v4.17-rc7. Please test and comment.

Kind regards,

   Wolfram


Wolfram Sang (1):
  i2c: rcar: handle RXDMA HW bug on Gen3

 drivers/i2c/busses/i2c-rcar.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)


[1] Testcase patch:

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index d445b5891280..e42cd0121862 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -353,6 +353,7 @@ static void rcar_i2c_dma_unmap(struct rcar_i2c_priv *priv)
 	struct dma_chan *chan = priv->dma_direction == DMA_FROM_DEVICE
 		? priv->dma_rx : priv->dma_tx;
 
+	mdelay(10);
 	/* Disable DMA Master Received/Transmitted */
 	rcar_i2c_write(priv, ICDMAER, 0);
 
-- 
2.11.0

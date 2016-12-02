Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from 7.mo1.mail-out.ovh.net ([87.98.158.110]:45145 "EHLO
        7.mo1.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751541AbcLBQDh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2016 11:03:37 -0500
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
        by mo1.mail-out.ovh.net (Postfix) with ESMTP id 6CBC921592
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Dec 2016 16:44:36 +0100 (CET)
From: Jacopo Mondi <jacopo@jmondi.org>
To: magnus.damm@gmail.com, geert+renesas@glider.be
Cc: linux-renesas-soc@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>
Subject: [RFC 3/3] spidev: Add back "linux,spidev" as compatible
Date: Fri,  2 Dec 2016 16:43:54 +0100
Message-Id: <1480693434-9415-4-git-send-email-jacopo@jmondi.org>
In-Reply-To: <1480693434-9415-1-git-send-email-jacopo@jmondi.org>
References: <1480693434-9415-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

spidev is not meant to be configured directly from DTS anymore.
Since we're prototyping, add the "linux,spidev" compatibility string
back

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/spi/spidev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spidev.c b/drivers/spi/spidev.c
index 6941e04..e767265 100644
--- a/drivers/spi/spidev.c
+++ b/drivers/spi/spidev.c
@@ -690,6 +690,7 @@ static int spidev_remove(struct spi_device *spi)
 }
 
 static const struct of_device_id spidev_dt_ids[] = {
+	{ .compatible = "linux,spidev" },
 	{ .compatible = "rohm,dh2228fv" },
 	{},
 };
-- 
2.7.4

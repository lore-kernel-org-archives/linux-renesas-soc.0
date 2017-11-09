Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:39654 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753917AbdKIWVA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Nov 2017 17:21:00 -0500
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFT] i2c: sh_mobile: avoid unnecessary register read
Date: Thu,  9 Nov 2017 23:20:53 +0100
Message-Id: <20171109222053.27093-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

There is no data when the first WAIT interrupt arrives. No need to read
something then.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I am not super happy with (real pos >= 0) done twice, but I didn't find a
better solution yet. The compiler will make this cheap anyhow, I guess.

Jacopo: can you please test this on top of all other patches?

 drivers/i2c/busses/i2c-sh_mobile.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index 80561ffbcf7b46..40a66d466c3c49 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -433,8 +433,9 @@ static int sh_mobile_i2c_isr_rx(struct sh_mobile_i2c_data *pd)
 				break;
 			}
 			data = i2c_op(pd, OP_RX_STOP_DATA, 0);
-		} else
+		} else if (real_pos >= 0) {
 			data = i2c_op(pd, OP_RX, 0);
+		}
 
 		if (real_pos >= 0)
 			pd->msg->buf[real_pos] = data;
-- 
2.11.0

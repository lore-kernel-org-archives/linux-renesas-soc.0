Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>, linux-ide@vger.kernel.org
Subject: [PATCH 1/6] ide: palm_bk3710: test clock rate to avoid division by 0
Date: Wed,  2 Mar 2016 23:33:32 +0100
Message-Id: <1456958018-7849-2-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1456958018-7849-1-git-send-email-wsa@the-dreams.de>
References: <1456958018-7849-1-git-send-email-wsa@the-dreams.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

The clk API may return 0 on clk_get_rate, so we should check the result before
using it as a divisor.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Should go individually via subsystem tree.

 drivers/ide/palm_bk3710.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/ide/palm_bk3710.c b/drivers/ide/palm_bk3710.c
index 8012e43bf8f618..46427ea01753b4 100644
--- a/drivers/ide/palm_bk3710.c
+++ b/drivers/ide/palm_bk3710.c
@@ -325,6 +325,8 @@ static int __init palm_bk3710_probe(struct platform_device *pdev)
 
 	clk_enable(clk);
 	rate = clk_get_rate(clk);
+	if (!rate)
+		return -EINVAL;
 
 	/* NOTE:  round *down* to meet minimum timings; we count in clocks */
 	ideclk_period = 1000000000UL / rate;
-- 
2.7.0

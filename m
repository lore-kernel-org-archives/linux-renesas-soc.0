Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <kieran@ksquared.org.uk>
Return-Path: <kieran@ksquared.org.uk>
Sender: Kieran Bingham <kieran@ksquared.org.uk>
From: Kieran Bingham <kieran@bingham.xyz>
To: laurent.pinchart@ideasonboard.com,
	mchehab@osg.samsung.com,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran@bingham.xyz>
Subject: [PATCH] v4l: Extend FCP compatible list to support the FDP
Date: Thu,  9 Jun 2016 18:06:43 +0100
Message-Id: <1465492003-1554-2-git-send-email-kieran@bingham.xyz>
In-Reply-To: <1465492003-1554-1-git-send-email-kieran@bingham.xyz>
References: <1465492003-1554-1-git-send-email-kieran@bingham.xyz>
List-ID: <linux-renesas-soc.vger.kernel.org>

The FCP must be powered up for the FDP1 to function, even when the FDP1
does not make use of the FCNL features. Extend the compatible list
to allow us to use the power domain and runtime-pm support.

Signed-off-by: Kieran Bingham <kieran@bingham.xyz>
---
 drivers/media/platform/rcar-fcp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/rcar-fcp.c b/drivers/media/platform/rcar-fcp.c
index 6a7bcc3028b1..0ff6b1edf1db 100644
--- a/drivers/media/platform/rcar-fcp.c
+++ b/drivers/media/platform/rcar-fcp.c
@@ -160,6 +160,7 @@ static int rcar_fcp_remove(struct platform_device *pdev)
 
 static const struct of_device_id rcar_fcp_of_match[] = {
 	{ .compatible = "renesas,fcpv" },
+	{ .compatible = "renesas,fcpf" },
 	{ },
 };
 
-- 
2.7.4

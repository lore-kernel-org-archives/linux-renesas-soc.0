Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:38964 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751150AbcK3MY6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Nov 2016 07:24:58 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] PM / Domains: Do not print PM domain add error message if EPROBE_DEFER
Date: Wed, 30 Nov 2016 13:24:56 +0100
Message-Id: <1480508696-19294-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

EPROBE_DEFER is not an error, hence printing an error message like

    renesas_irqc e61c0000.interrupt-controller: failed to add to PM domain always-on: -517

may confuse the user.

Suppress the error message in case of EPROBE_DEFER to fix this.

Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/base/power/domain.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
index 64164aac6ae3990a..f22137b52dcb641b 100644
--- a/drivers/base/power/domain.c
+++ b/drivers/base/power/domain.c
@@ -2032,8 +2032,9 @@ int genpd_dev_pm_attach(struct device *dev)
 	mutex_unlock(&gpd_list_lock);
 
 	if (ret < 0) {
-		dev_err(dev, "failed to add to PM domain %s: %d",
-			pd->name, ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "failed to add to PM domain %s: %d",
+				pd->name, ret);
 		goto out;
 	}
 
-- 
1.9.1

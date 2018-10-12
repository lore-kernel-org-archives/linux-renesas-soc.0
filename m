Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:35922 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728632AbeJLR4m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Oct 2018 13:56:42 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Arjan van de Ven <arjan@linux.intel.com>,
        Jacob Pan <jacob.jun.pan@linux.intel.com>,
        linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 3/3] thermal: da9062/61: Prevent hardware access during system suspend
Date: Fri, 12 Oct 2018 09:20:17 +0200
Message-Id: <20181012072017.10765-4-geert+renesas@glider.be>
In-Reply-To: <20181012072017.10765-1-geert+renesas@glider.be>
References: <20181012072017.10765-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The workqueue used for monitoring the hardware may run while the device
is already suspended.  Fix this by using the freezable system workqueue
instead, cfr. commit 51e20d0e3a60cf46 ("thermal: Prevent polling from
happening during system suspend").

Fixes: 608567aac3206ae8 ("thermal: da9062/61: Thermal junction temperature monitoring driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Untested due to lack of hardware.

v2:
  - No changes.
---
 drivers/thermal/da9062-thermal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/da9062-thermal.c b/drivers/thermal/da9062-thermal.c
index dd8dd947b7f0737c..01b0cb9944577851 100644
--- a/drivers/thermal/da9062-thermal.c
+++ b/drivers/thermal/da9062-thermal.c
@@ -106,7 +106,7 @@ static void da9062_thermal_poll_on(struct work_struct *work)
 					   THERMAL_EVENT_UNSPECIFIED);
 
 		delay = msecs_to_jiffies(thermal->zone->passive_delay);
-		schedule_delayed_work(&thermal->work, delay);
+		queue_delayed_work(system_freezable_wq, &thermal->work, delay);
 		return;
 	}
 
@@ -125,7 +125,7 @@ static irqreturn_t da9062_thermal_irq_handler(int irq, void *data)
 	struct da9062_thermal *thermal = data;
 
 	disable_irq_nosync(thermal->irq);
-	schedule_delayed_work(&thermal->work, 0);
+	queue_delayed_work(system_freezable_wq, &thermal->work, 0);
 
 	return IRQ_HANDLED;
 }
-- 
2.17.1

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:35791 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755567AbdL2LhU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Dec 2017 06:37:20 -0500
Received: by mail-lf0-f65.google.com with SMTP id h5so4225019lfj.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Dec 2017 03:37:19 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-pm@vger.kernel.org
Cc: Kevin Hilman <khilman@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Niklas Soderlund <niklas.soderlund+renesas@ragnatech.se>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-renesas-soc@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v2 1/4] PM / core: Assign the wakeup_path status flag in __device_prepare()
Date: Fri, 29 Dec 2017 12:37:00 +0100
Message-Id: <1514547423-18965-2-git-send-email-ulf.hansson@linaro.org>
In-Reply-To: <1514547423-18965-1-git-send-email-ulf.hansson@linaro.org>
References: <1514547423-18965-1-git-send-email-ulf.hansson@linaro.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The PM core in the device_prepare() phase, resets the wakeup_path status
flag to the value of device_may_wakeup(). This means if a ->prepare() or a
->suspend() callback for the device would update the device's wakeup
setting, this doesn't become reflected in the wakeup_path status flag.

In general this isn't a problem, because wakeup settings are not supposed
to be changed (via for example calling device_set_wakeup_enable()) during
any system wide suspend/resume phase.  Nevertheless there are some users,
which can be considered as legacy, that don't conform to this behaviour.

These legacy cases should be corrected, however until that is done, let's
address the issue from the PM core, by moving the assignment of the
wakeup_path status flag to the __device_suspend() phase and after the
->suspend() callback has been invoked.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/base/power/main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index 6e8cc5d..810e5fb 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -1620,6 +1620,8 @@ static int __device_suspend(struct device *dev, pm_message_t state, bool async)
  End:
 	if (!error) {
 		dev->power.is_suspended = true;
+		if (device_may_wakeup(dev))
+			dev->power.wakeup_path = true;
 		dpm_propagate_to_parent(dev);
 		dpm_clear_suppliers_direct_complete(dev);
 	}
@@ -1744,7 +1746,7 @@ static int device_prepare(struct device *dev, pm_message_t state)
 
 	device_lock(dev);
 
-	dev->power.wakeup_path = device_may_wakeup(dev);
+	dev->power.wakeup_path = false;
 
 	if (dev->power.no_pm_callbacks) {
 		ret = 1;	/* Let device go direct_complete */
-- 
2.7.4

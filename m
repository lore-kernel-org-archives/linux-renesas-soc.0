Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:45836 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728391AbeJVEQE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Oct 2018 00:16:04 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: [PATCH 3/5] pinctrl: intel: pinctrl-intel: simplify getting .driver_data
Date: Sun, 21 Oct 2018 22:00:29 +0200
Message-Id: <20181021200032.1833-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181021200032.1833-1-wsa+renesas@sang-engineering.com>
References: <20181021200032.1833-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

We should get 'driver_data' from 'struct device' directly. Going via
platform_device is an unneeded step back and forth.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only. buildbot is happy.

 drivers/pinctrl/intel/pinctrl-intel.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 8cda7b535b02..98301750a5b1 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1469,8 +1469,7 @@ static bool intel_pinctrl_should_save(struct intel_pinctrl *pctrl, unsigned int
 
 int intel_pinctrl_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct intel_pinctrl *pctrl = platform_get_drvdata(pdev);
+	struct intel_pinctrl *pctrl = dev_get_drvdata(dev);
 	struct intel_community_context *communities;
 	struct intel_pad_context *pads;
 	int i;
@@ -1531,8 +1530,7 @@ static void intel_gpio_irq_init(struct intel_pinctrl *pctrl)
 
 int intel_pinctrl_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct intel_pinctrl *pctrl = platform_get_drvdata(pdev);
+	struct intel_pinctrl *pctrl = dev_get_drvdata(dev);
 	const struct intel_community_context *communities;
 	const struct intel_pad_context *pads;
 	int i;
-- 
2.19.0

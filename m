Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:45636 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727432AbeJVEPj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Oct 2018 00:15:39 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6/6] gpio: gpio-zynq: simplify getting .driver_data
Date: Sun, 21 Oct 2018 22:00:01 +0200
Message-Id: <20181021200002.1472-7-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181021200002.1472-1-wsa+renesas@sang-engineering.com>
References: <20181021200002.1472-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

We should get 'driver_data' from 'struct device' directly. Going via
platform_device is an unneeded step back and forth.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only. buildbot is happy.

 drivers/gpio/gpio-zynq.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 3f5fcdd5a429..ac9b02c9598f 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -693,8 +693,7 @@ static int __maybe_unused zynq_gpio_resume(struct device *dev)
 
 static int __maybe_unused zynq_gpio_runtime_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct zynq_gpio *gpio = platform_get_drvdata(pdev);
+	struct zynq_gpio *gpio = dev_get_drvdata(dev);
 
 	clk_disable_unprepare(gpio->clk);
 
@@ -703,8 +702,7 @@ static int __maybe_unused zynq_gpio_runtime_suspend(struct device *dev)
 
 static int __maybe_unused zynq_gpio_runtime_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct zynq_gpio *gpio = platform_get_drvdata(pdev);
+	struct zynq_gpio *gpio = dev_get_drvdata(dev);
 
 	return clk_prepare_enable(gpio->clk);
 }
-- 
2.19.0

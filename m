Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:45636 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727432AbeJVEPg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Oct 2018 00:15:36 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: [PATCH 3/6] gpio: gpio-mxc: simplify getting .driver_data
Date: Sun, 21 Oct 2018 21:59:58 +0200
Message-Id: <20181021200002.1472-4-wsa+renesas@sang-engineering.com>
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

 drivers/gpio/gpio-mxc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 995cf0b9e0b1..5c69516e90b1 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -552,8 +552,7 @@ static void mxc_gpio_restore_regs(struct mxc_gpio_port *port)
 
 static int __maybe_unused mxc_gpio_noirq_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct mxc_gpio_port *port = platform_get_drvdata(pdev);
+	struct mxc_gpio_port *port = dev_get_drvdata(dev);
 
 	mxc_gpio_save_regs(port);
 	clk_disable_unprepare(port->clk);
@@ -563,8 +562,7 @@ static int __maybe_unused mxc_gpio_noirq_suspend(struct device *dev)
 
 static int __maybe_unused mxc_gpio_noirq_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct mxc_gpio_port *port = platform_get_drvdata(pdev);
+	struct mxc_gpio_port *port = dev_get_drvdata(dev);
 	int ret;
 
 	ret = clk_prepare_enable(port->clk);
-- 
2.19.0

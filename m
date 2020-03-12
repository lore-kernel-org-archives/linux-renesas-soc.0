Return-Path: <SRS0=5QEK=45=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A09C2BB1D
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 12 Mar 2020 13:45:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6E9252067C
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 12 Mar 2020 13:45:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727447AbgCLNpa (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 12 Mar 2020 09:45:30 -0400
Received: from sauhun.de ([88.99.104.3]:42506 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725978AbgCLNp3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Mar 2020 09:45:29 -0400
Received: from localhost (p54B331A0.dip0.t-ipconnect.de [84.179.49.160])
        by pokefinder.org (Postfix) with ESMTPSA id 8DF112C1ECC;
        Thu, 12 Mar 2020 14:45:22 +0100 (CET)
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-spi@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] spi: acpi: remove superfluous parameter check
Date:   Thu, 12 Mar 2020 14:45:07 +0100
Message-Id: <20200312134507.10000-1-wsa@the-dreams.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

to_spi_device() already checks 'dev'. No need to do it before calling
it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Found while fiddling with bus_find_device_by_acpi_dev() in the I2C
subsystem.

 drivers/spi/spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 755221bc3745..75978b6c5834 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -4034,7 +4034,7 @@ static struct spi_device *acpi_spi_find_device_by_adev(struct acpi_device *adev)
 	struct device *dev;
 
 	dev = bus_find_device_by_acpi_dev(&spi_bus_type, adev);
-	return dev ? to_spi_device(dev) : NULL;
+	return to_spi_device(dev);
 }
 
 static int acpi_spi_notify(struct notifier_block *nb, unsigned long value,
-- 
2.20.1


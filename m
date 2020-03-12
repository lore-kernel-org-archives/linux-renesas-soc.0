Return-Path: <SRS0=5QEK=45=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB937C10DCE
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 12 Mar 2020 17:38:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7C7762067C
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 12 Mar 2020 17:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584034734;
	bh=M9aS/8DkcX9Jm+VXstXOzeSgGr6qTwtcsMwlR5Ky9CY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:List-ID:From;
	b=DRpVG9NrV+xDA3GIpSH6xQPzRzW/SIvPYeG0sFH6v4IlRXGGXGhZwRBnpmMC7vYrI
	 90sJKWqZDIa50eTbx8vLnuErOct15PUxvGIMUpBphZ1FYjFK0RhLGsLn22ldQH9BRG
	 7F4HfaY3MyBMKJxu2NR3yG8FUL6YezPQBvdtX1gY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbgCLRiy (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 12 Mar 2020 13:38:54 -0400
Received: from foss.arm.com ([217.140.110.172]:38848 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726194AbgCLRiy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Mar 2020 13:38:54 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35C7830E;
        Thu, 12 Mar 2020 10:38:53 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE9EB3F6CF;
        Thu, 12 Mar 2020 10:38:52 -0700 (PDT)
Date:   Thu, 12 Mar 2020 17:38:51 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org,
        Mark Brown <broonie@kernel.org>
Subject: Applied "spi: acpi: remove superfluous parameter check" to the spi tree
In-Reply-To:  <20200312134507.10000-1-wsa@the-dreams.de>
Message-Id:  <applied-20200312134507.10000-1-wsa@the-dreams.de>
X-Patchwork-Hint: ignore
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The patch

   spi: acpi: remove superfluous parameter check

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 5b16668e638c61a9cd4dffaa41d8b3b6f53f6b3a Mon Sep 17 00:00:00 2001
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Date: Thu, 12 Mar 2020 14:45:07 +0100
Subject: [PATCH] spi: acpi: remove superfluous parameter check
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

to_spi_device() already checks 'dev'. No need to do it before calling
it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Link: https://lore.kernel.org/r/20200312134507.10000-1-wsa@the-dreams.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index f6f6b2a0c81c..0996d238f61e 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -4028,7 +4028,7 @@ static struct spi_device *acpi_spi_find_device_by_adev(struct acpi_device *adev)
 	struct device *dev;
 
 	dev = bus_find_device_by_acpi_dev(&spi_bus_type, adev);
-	return dev ? to_spi_device(dev) : NULL;
+	return to_spi_device(dev);
 }
 
 static int acpi_spi_notify(struct notifier_block *nb, unsigned long value,
-- 
2.20.1


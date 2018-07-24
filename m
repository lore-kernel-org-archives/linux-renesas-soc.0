Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from szxga04-in.huawei.com ([45.249.212.190]:10108 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388296AbeGXH3p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jul 2018 03:29:45 -0400
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Marek Vasut <marek.vasut+renesas@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC: Wei Yongjun <weiyongjun1@huawei.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] regulator: bd9571mwv: Make symbol 'dev_attr_backup_mode' static
Date: Tue, 24 Jul 2018 06:32:59 +0000
Message-ID: <1532413979-187684-1-git-send-email-weiyongjun1@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Fixes the following sparse warning:

drivers/regulator/bd9571mwv-regulator.c:220:1: warning:
 symbol 'dev_attr_backup_mode' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/regulator/bd9571mwv-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/bd9571mwv-regulator.c b/drivers/regulator/bd9571mwv-regulator.c
index c44613b..274c5ed 100644
--- a/drivers/regulator/bd9571mwv-regulator.c
+++ b/drivers/regulator/bd9571mwv-regulator.c
@@ -217,7 +217,7 @@ static ssize_t backup_mode_store(struct device *dev,
 	return count;
 }
 
-DEVICE_ATTR_RW(backup_mode);
+static DEVICE_ATTR_RW(backup_mode);
 
 static int bd9571mwv_suspend(struct device *dev)
 {

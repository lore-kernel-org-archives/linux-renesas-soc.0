Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:39714 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752336AbeFFXYP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Jun 2018 19:24:15 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/3] mmc: tmio: move tmio_mmc_hw_reset()
Date: Thu,  7 Jun 2018 01:22:51 +0200
Message-Id: <20180606232252.31583-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20180606232252.31583-1-niklas.soderlund+renesas@ragnatech.se>
References: <20180606232252.31583-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Avoid having to use forward declaration when in a later patch fixing the
reset operation by moving tmio_mmc_hw_reset() earlier in the source
file. No functional change in this change.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/mmc/host/tmio_mmc_core.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 2ede81476daf76ce..9f5793407552a23a 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -243,6 +243,14 @@ static void tmio_mmc_reset(struct tmio_mmc_host *host)
 
 }
 
+static void tmio_mmc_hw_reset(struct mmc_host *mmc)
+{
+	struct tmio_mmc_host *host = mmc_priv(mmc);
+
+	if (host->hw_reset)
+		host->hw_reset(host);
+}
+
 static void tmio_mmc_reset_work(struct work_struct *work)
 {
 	struct tmio_mmc_host *host = container_of(work, struct tmio_mmc_host,
@@ -769,14 +777,6 @@ static int tmio_mmc_start_data(struct tmio_mmc_host *host,
 	return 0;
 }
 
-static void tmio_mmc_hw_reset(struct mmc_host *mmc)
-{
-	struct tmio_mmc_host *host = mmc_priv(mmc);
-
-	if (host->hw_reset)
-		host->hw_reset(host);
-}
-
 static int tmio_mmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
 {
 	struct tmio_mmc_host *host = mmc_priv(mmc);
-- 
2.17.0

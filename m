Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:64592 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727149AbeH3Dbx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Aug 2018 23:31:53 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 1/3] mmc: core: add helper to see if a host is doing a retune
Date: Thu, 30 Aug 2018 01:32:05 +0200
Message-Id: <20180829233207.30646-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20180829233207.30646-1-niklas.soderlund+renesas@ragnatech.se>
References: <20180829233207.30646-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add a helper to allow host drivers checking if a retune is in progress.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 include/linux/mmc/host.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index beed7121c7818b74..2a5fe75dd0821d03 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -569,6 +569,11 @@ static inline bool mmc_can_retune(struct mmc_host *host)
 	return host->can_retune == 1;
 }
 
+static inline bool mmc_doing_retune(struct mmc_host *host)
+{
+	return host->doing_retune == 1;
+}
+
 static inline enum dma_data_direction mmc_get_dma_dir(struct mmc_data *data)
 {
 	return data->flags & MMC_DATA_WRITE ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
-- 
2.18.0

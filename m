Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:36072 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751112AbdJTDQm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Oct 2017 23:16:42 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: wsa+renesas@sang-engineering.com, ulf.hansson@linaro.org
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/2] mmc: renesas_sdhi and tmio: bugfixes for v4.14
Date: Fri, 20 Oct 2017 12:12:40 +0900
Message-Id: <1508469162-12322-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on mainline v4.14-rc5.

Changes from v1:
 - Calculate the max size of swiotlb memory instead of hardcoded value
   in patch 1.
 - Add Reviewed-by from Geert-san in patch 2. (Geert-san, thanks!)

Yoshihiro Shimoda (2):
  mmc: tmio: fix swiotlb buffer is full
  mmc: renesas_sdhi: fix kernel panic in _internal_dmac.c

 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 17 ++++++++++-------
 drivers/mmc/host/tmio_mmc_core.c              | 13 +++++++++++++
 2 files changed, 23 insertions(+), 7 deletions(-)

-- 
1.9.1

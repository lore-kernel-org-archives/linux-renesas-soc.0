Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:7827 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751433AbeF2KCq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Jun 2018 06:02:46 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: wsa+renesas@sang-engineering.com, ulf.hansson@linaro.org
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        stable@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/2] mmc: renesas_sdhi_internal_dmac: fix two issues for error path
Date: Fri, 29 Jun 2018 19:01:43 +0900
Message-Id: <1530266505-19953-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on the mmc.git / fixes branch.

Changes from v1:
 - Add Reviewed-by Geert-san.
 - Add a new goto label for error path.

Yoshihiro Shimoda (2):
  mmc: renesas_sdhi_internal_dmac: Fix missing unmap in error patch
  mmc: renesas_sdhi_internal_dmac: Cannot clear the RX_IN_USE in abort

 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

-- 
1.9.1

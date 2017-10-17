Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:39500 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S933010AbdJQHeR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Oct 2017 03:34:17 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: wsa+renesas@sang-engineering.com, ulf.hansson@linaro.org
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] mmc: renesas_sdhi: bugfixes for v4.14
Date: Tue, 17 Oct 2017 16:30:19 +0900
Message-Id: <1508225421-25405-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on mainline v4.14-rc5.

Yoshihiro Shimoda (2):
  mmc: renesas_sdhi: fix swiotlb buffer is full
  mmc: renesas_sdhi: fix kernel panic in _internal_dmac.c

 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

-- 
1.9.1

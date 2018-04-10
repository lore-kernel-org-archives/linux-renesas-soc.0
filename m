Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:38860 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751991AbeDJJir (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Apr 2018 05:38:47 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/5] mmc: renesas_sdhi_internal_dmac: DMA handling fixes
Date: Tue, 10 Apr 2018 11:38:26 +0200
Message-Id: <20180410093831.1759-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Ulf,

I have collected the patches floating around for renesas_sdhi_internal_dmac
(also previously internal ones) and grouped them to avoid dependency issues. I
think it would be good to give Shimoda-san some time to look at the new patches
(2,3,5), too.

Regarding stable: I think patch 1 is clearly for stable. Patch 3 maybe, but it
needs patch 2 which is not. Not sure if it is worth the hazzle. Maybe
Shimoda-san has an opinion, too? Patches 4 & 5 are not for stable.

Changes since last time:
	* patch 1: added tags, don't initialize static var to 0
	* patches 2,3,5: new
	* patch 4: added tags

Kind regards,

   Wolfram


Masaharu Hayakawa (1):
  mmc: renesas_sdhi: Fix alignment check of sg buffer

Niklas Söderlund (1):
  mmc: renesas_sdhi: use helpers to access struct scatterlist members

Wolfram Sang (3):
  mmc: renesas_sdhi_internal_dmac: limit DMA RX for old SoCs
  mmc: renesas_sdhi_internal_dmac: use more generic whitelisting
  mmc: renesas_sdhi_internal_dmac: remove superfluous WARN

 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 64 +++++++++++++++++++--------
 1 file changed, 46 insertions(+), 18 deletions(-)

-- 
2.11.0

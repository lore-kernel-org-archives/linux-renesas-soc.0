Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:37790 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751830AbeDRSVH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Apr 2018 14:21:07 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 0/5] mmc: renesas_sdhi_internal_dmac: DMA handling fixes
Date: Wed, 18 Apr 2018 20:20:56 +0200
Message-Id: <20180418182101.5723-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

I have collected the patches floating around for renesas_sdhi_internal_dmac and
grouped them to avoid dependency issues.

Regarding stable: I think patch 1 is clearly for stable. Patch 3 maybe, but it
needs patch 2 which is not. Not sure if it is worth the hazzle. Patches 4 & 5
are not for stable.

Changes since v2:
	* fixed checkpatch issues (Thanks Sergei!)
	* rebased to mmc/next

Changes since v1:
	* patch 1: drop superfluous NULL check on soc->date
		   (Thanks Geert!)
	* patches 2,3,5: added Simon's tag

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
 1 file changed, 45 insertions(+), 19 deletions(-)

-- 
2.11.0

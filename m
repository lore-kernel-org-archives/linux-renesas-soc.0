Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:59952 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727226AbeHWRE5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Aug 2018 13:04:57 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        dmaengine@vger.kernel.org, linux-can@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH v2 0/2] tree-wide: use SPDX identifier for Renesas drivers
Date: Thu, 23 Aug 2018 15:34:53 +0200
Message-Id: <20180823133456.4748-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

I am resending only the patches which needed the s/GPL-2.0-or-later/GPL-2.0+/
replacement. I fixed that and checkpatch is still happy.

Wolfram Sang (2):
  dmaengine: use SPDX identifier for Renesas drivers
  can: rcar: use SPDX identifier for Renesas drivers

 drivers/dma/nbpfaxi.c             | 5 +----
 drivers/dma/sh/shdma-arm.h        | 5 +----
 drivers/dma/sh/shdma-base.c       | 5 +----
 drivers/dma/sh/shdma-of.c         | 5 +----
 drivers/dma/sh/shdma-r8a73a4.c    | 5 +----
 drivers/dma/sh/shdma.h            | 6 +-----
 drivers/dma/sh/shdmac.c           | 6 +-----
 drivers/dma/sh/sudmac.c           | 5 +----
 drivers/dma/sh/usb-dmac.c         | 5 +----
 drivers/net/can/rcar/rcar_can.c   | 6 +-----
 drivers/net/can/rcar/rcar_canfd.c | 6 +-----
 11 files changed, 11 insertions(+), 48 deletions(-)

-- 
2.11.0

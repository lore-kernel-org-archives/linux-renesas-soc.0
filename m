Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:35752 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932719AbeFPNiK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Jun 2018 09:38:10 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Sergey Larin <cerg2010cerg2010@mail.ru>,
        dri-devel@lists.freedesktop.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/2] i2c: algos: bit: revert to fix regression (#200045)
Date: Sat, 16 Jun 2018 22:37:55 +0900
Message-Id: <20180616133757.5994-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

A regression was reported via Bugzilla and a revert seems to be the best choice
for now. Check patch 1 for details. To not make the same mistake again, patch 2
adds a comment sharing our experience.

Wolfram Sang (2):
  Revert "i2c: algo-bit: init the bus to a known state"
  i2c: algos: bit: mention our experience about initial states

 drivers/i2c/algos/i2c-algo-bit.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.11.0

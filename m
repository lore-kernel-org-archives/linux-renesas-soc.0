Return-Path: <linux-i2c-owner@vger.kernel.org>
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/2] i2c: rcar: implement STOP and REP_START according to docs
Date: Wed,  8 Aug 2018 09:59:26 +0200
Message-Id: <20180808075928.31107-1-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Details are in the patch descriptions. Thanks to Yamasaki-san, Shimoda-san, and
all other people involved.

Wolfram Sang (2):
  i2c: rcar: refactor private flags
  i2c: rcar: implement STOP and REP_START according to docs

 drivers/i2c/busses/i2c-rcar.c | 39 +++++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 16 deletions(-)

-- 
2.11.0

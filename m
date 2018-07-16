Return-Path: <linux-i2c-owner@vger.kernel.org>
From: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Phil Edworthy <phil.edworthy@renesas.com>
Subject: [PATCH 0/2] i2c: designware: Add support for a bus clock
Date: Mon, 16 Jul 2018 09:59:11 +0100
Message-Id: <1531731553-22979-1-git-send-email-phil.edworthy@renesas.com>
To: unlisted-recipients:; (no To-header on input)
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The Synopsys I2C Controller has a bus clock, but typically SoCs hide this away.
However, on some SoCs you need to explicity enable the bus clock in order to
access the registers.

Phil Edworthy (2):
  dt: snps,designware-i2c: Add clock bindings documentation
  i2c: designware: Add support for a bus clock

 Documentation/devicetree/bindings/i2c/i2c-designware.txt |  9 +++++++--
 drivers/i2c/busses/i2c-designware-common.c               | 14 +++++++++++++-
 drivers/i2c/busses/i2c-designware-core.h                 |  1 +
 drivers/i2c/busses/i2c-designware-platdrv.c              |  2 ++
 4 files changed, 23 insertions(+), 3 deletions(-)

-- 
2.7.4

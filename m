Return-Path: <linux-i2c-owner@vger.kernel.org>
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/2] i2c: mux: demux-pinctrl: improve device relationships
Date: Mon, 30 Apr 2018 13:55:42 +0200
Message-Id: <20180430115544.22903-1-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

While researching some PM behaviour within I2C, I found out that the i2c-demux
driver does not play well with that due to broken relationship with other
devices. Patch 1 ensures the right parent-child relationship. Patch 2 makes the
connection between the demux device and the demuxed bus similar to that we have
in the mux core.

Tested on a Renesas Lager board (R-Car H2).


Wolfram Sang (2):
  i2c: mux: demux-pinctrl: use proper parent device for demux adapter
  i2c: mux: demux-pinctrl: add symlinks to the demux device in sysfs

 drivers/i2c/muxes/i2c-demux-pinctrl.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

-- 
2.11.0

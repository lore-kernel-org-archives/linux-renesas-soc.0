Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:49646 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750923AbeEUH3m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 May 2018 03:29:42 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 0/2] i2c: mux: demux-pinctrl: improve device relationships
Date: Mon, 21 May 2018 09:29:37 +0200
Message-Id: <20180521072939.2836-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

While researching some PM behaviour within I2C, I found out that the i2c-demux
driver does not play well with that due to broken relationship with other
devices. Patch 1 ensures the right parent-child relationship. Patch 2 makes the
connection between the demux device and the demuxed bus similar to that we have
in the mux core.

Tested on a Renesas Lager board (R-Car H2).

Changes since v1:

* added error check in patch 2

Wolfram Sang (2):
  i2c: mux: demux-pinctrl: use proper parent device for demux adapter
  i2c: mux: demux-pinctrl: add symlinks to the demux device in sysfs

 drivers/i2c/muxes/i2c-demux-pinctrl.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

-- 
2.11.0

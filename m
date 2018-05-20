Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:41650 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750912AbeETHAk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 May 2018 03:00:40 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: qemu-devel@nongnu.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 RESEND 0/3] nvram: at24c: fix problems related to "rom-size"
Date: Sun, 20 May 2018 09:00:34 +0200
Message-Id: <20180520070037.8593-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

I used this driver as a template for a custom one. While hacking on my own, I
noticed some problems in this driver, too. This series fixes the first set of
them, related to the "rom-size" parameter. It fixes a segfault.

I think the first patch is clearly suitable for stable. I think the second one,
too, but not as clearly. The third one is a cleanup and not for stable. Still,
I am open for opinions about these thoughts.

Thanks,

   Wolfram

This is the same v3 as last time. Rebased to current master, but that produced
no diff.

Changes since v2:

* removed '\n' from error_report-strings
* made sure checkpatch is happy
* added tags from Philippe (thanks!)

Changes since v1:

* reordered patches according to significance for stable
* use AT24C_ROMSIZE_DEFAULT instead of magic value
* patch 3 doesn't improve the ERR macro anymore but replaces
  it completely with error_report().


Wolfram Sang (3):
  nvram: at24c: prevent segfault by checking "rom-size"
  nvram: at24c: use a sane default for "rom-size"
  nvram: at24c: use standard error reporting

 hw/nvram/eeprom_at24c.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

-- 
2.11.0

Return-Path: <linux-i2c-owner@vger.kernel.org>
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Jun Gao <jun.gao@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/3] i2c: refactor releasing a DMA safe buffer
Date: Fri, 24 Aug 2018 16:52:43 +0200
Message-Id: <20180824145246.19987-1-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Jun Gao correctly identified a problem when freeing a DMA safe buffer [1], many
thanks for that! However, I'd like to not introduce yet another function. So, I
thought about changing the existing API to support the case of freeing a buffer
in case no sync back to the message is needed. Here is what I came up with and
I like the new way better.

Once this is set in place, the only existing user so far, has been fixed. It
was leaking the bounce buffer on error cases before. Tested on a Renesas Lager
board (R-Car H2).

Please let me know your thoughts. Jun Gao, does it work for you as well?

If all goes well, I would like to apply it for -rc2. But I am still open for
comments, of course.

Thanks and happy hacking,

   Wolfram


[1] http://patchwork.ozlabs.org/patch/940768/

Wolfram Sang (3):
  i2c: refactor function to release a DMA safe buffer
  i2c: sh_mobile: define start_ch() void as it only returns 0 anyhow
  i2c: sh_mobile: fix leak when using DMA bounce buffer

 Documentation/i2c/DMA-considerations | 10 +++++++---
 drivers/i2c/busses/i2c-sh_mobile.c   | 15 +++++++--------
 drivers/i2c/i2c-core-base.c          | 11 ++++++-----
 include/linux/i2c.h                  |  2 +-
 4 files changed, 21 insertions(+), 17 deletions(-)

-- 
2.11.0

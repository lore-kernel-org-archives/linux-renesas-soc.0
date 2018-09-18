Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57151 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726433AbeIROWe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Sep 2018 10:22:34 -0400
Date: Tue, 18 Sep 2018 10:50:53 +0200
From: Simon Horman <horms@verge.net.au>
To: Greg KH <greg@kroah.com>
Cc: ltsi-dev@lists.linuxfoundation.org,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [GIT PULL LTSI-4.14] LTSI-v4.14 Backport or I2C R-Car Fix
Message-ID: <20180918085053.lu2k46vqffzj37ah@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

This is intended as a submission to LTSI-4.14. It is the backport
of a fixes for safe DMA buffer handling for the SH-Mobile I2C driver
and I2C code. All patches are present in v4.19-rc3.

This pull-request is based on
"[GIT PULL LTSI-4.14] LTSI-v4.14 Backport or I2C R-Car Fix"
tagged as backport/v4.14.61/snapshot-to-v4.18+fixes-flattened,
which I have already sent a pull-request for.

There are 10 patches.

I have performed build testing of this backports on a wide range of
defconfigs and I am not aware of any regressions over v4.14.40 (the
baseline chosen when this work began).


The following changes since commit 4d4605e5c137ed9a53582e573118cbc16b82cbf1:

  i2c: rcar: implement STOP and REP_START according to docs (2018-08-28 13:35:06 +0200)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport.git backport/v4.14.61/snapshot-to-v4.18+fixes-v2-flattened

for you to fetch changes up to 720043a4efbb3356db116d084c7b877ad41ee51a:

  i2c: sh_mobile: fix leak when using DMA bounce buffer (2018-09-17 15:54:30 +0200)

----------------------------------------------------------------
Second Round of LTSI-v4.14 Backports of I2C R-Car Fixes

Base:
* v4.14.61
* Backports of components for Renesas SoCs to v4.18
* First round of Backports of I2C R-Car Fixes

Backport of post-v4.18 fix for i2c-shmobile and I2C core
The focus of these fixes is to make DMA buffer handling safe

----------------------------------------------------------------
Peter Rosin (1):
      i2c: smbus: kill memory leak on emulated and failed DMA SMBus xfers

Wenwen Wang (1):
      i2c: core: smbus: fix a potential missing-check bug

Wolfram Sang (8):
      i2c: dev: mark RDWR buffers as DMA_SAFE
      i2c: refactor i2c_master_{send_recv}
      i2c: add i2c_master_{send|recv}_dmasafe
      i2c: smbus: use DMA safe buffers for emulated SMBus transactions
      i2c: add docs to clarify DMA handling
      i2c: refactor function to release a DMA safe buffer
      i2c: sh_mobile: define start_ch() void as it only returns 0 anyhow
      i2c: sh_mobile: fix leak when using DMA bounce buffer

 Documentation/i2c/DMA-considerations | 71 ++++++++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-sh_mobile.c   | 15 ++++----
 drivers/i2c/i2c-core-base.c          | 75 ++++++++++++------------------------
 drivers/i2c/i2c-core-smbus.c         | 57 ++++++++++++++++++++++-----
 drivers/i2c/i2c-dev.c                |  2 +
 include/linux/i2c.h                  | 68 +++++++++++++++++++++++++++++---
 6 files changed, 215 insertions(+), 73 deletions(-)
 create mode 100644 Documentation/i2c/DMA-considerations

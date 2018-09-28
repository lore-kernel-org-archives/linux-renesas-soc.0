Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33012 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbeI1Tvd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Sep 2018 15:51:33 -0400
Date: Fri, 28 Sep 2018 15:27:43 +0200
From: Simon Horman <horms@verge.net.au>
To: Greg KH <greg@kroah.com>
Cc: ltsi-dev@lists.linuxfoundation.org,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [GIT PULL LTSI-4.14] LTSI-v4.14 Backport of MSIOF and SDHI Fixes
Message-ID: <20180928132743.cfjkakd6g33lqwwh@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

This is intended as a submission to LTSI-4.14. It is the backport
of a fixes for sh-msiof and sdhi. All patches are present in v4.19-rc5.

This pull-request is based on
"[GIT PULL LTSI-4.14] LTSI-v4.14 Backport or I2C R-Car Fix"
tagged as backport/v4.14.61/snapshot-to-v4.18+fixes-v2-flattened,
which I have already sent a pull-request for.

There are 3 patches.

I have performed build testing of this backports on a wide range of
defconfigs and I am not aware of any regressions over v4.14.40 (the
baseline chosen when this work began).


The following changes since commit 720043a4efbb3356db116d084c7b877ad41ee51a:

  i2c: sh_mobile: fix leak when using DMA bounce buffer (2018-09-17 15:54:30 +0200)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport.git backport/v4.14.61/snapshot-to-v4.18+fixes-v3-flattened

for you to fetch changes up to 2a2a48e9abb6ded92f9fb2b3e8fdf5d7a929e05b:

  mmc: renesas_sdhi: Fix sampling clock position selecting (2018-09-28 14:42:13 +0200)

----------------------------------------------------------------
LTSI-v4.14 Backports of MSIOF and SDHI Fixes

Base:
* v4.14.61
* Backports of components for Renesas SoCs to v4.18
* First and second round of backports of I2C R-Car Fixes,
  tagged as backport/v4.14.61/snapshot-to-v4.18+fixes-v2-flattened

Backport of fixes for sh-msiof and sdhi drivers to resolve problems
uncovered during testing of earlier backports.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      spi: sh-msiof: Make sure all DMA operations have completed

Masaharu Hayakawa (1):
      mmc: tmio: Fix tuning flow

Niklas Söderlund (1):
      mmc: renesas_sdhi: Fix sampling clock position selecting

 drivers/mmc/host/renesas_sdhi_core.c | 12 ++++++++
 drivers/mmc/host/tmio_mmc_core.c     |  2 --
 drivers/spi/spi-sh-msiof.c           | 53 ++++++++++++++++++++----------------
 3 files changed, 41 insertions(+), 26 deletions(-)

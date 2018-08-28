Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33784 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727212AbeH1Pke (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Aug 2018 11:40:34 -0400
Date: Tue, 28 Aug 2018 13:49:14 +0200
From: Simon Horman <horms@verge.net.au>
To: ltsi-dev@lists.linuxfoundation.org
Cc: linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [GIT PULL LTSI-4.14] LTSI-v4.14 Backport or I2C R-Car Fix
Message-ID: <20180828114913.w4c6u3c2dpmxx772@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

This is intended as a submission to LTSI-4.14. It is the backport
of a fix for the R-Car I2C driver, and its dependency, both of which
are present in linux-next 20180821.

This pull-request is based on
"[GIT PULL LTSI-4.14] Renesas SoCs and Drivers to v4.18-rc8",
tagged as backport/v4.14.61/snapshot-to-v4.18-rc8+fixes-flattened,
which I have already sent a pull-request for.

There are 2 patches.

I have performed build testing of this backports on a wide range of
defconfigs and I am not aware of any regressions over v4.14.40 (the
baseline chosen when this work began).


The following changes since commit cc88cfdc0571385f098e82db47f5a16b6f44726e:

  i2c: rcar: use the new get_bus_free callback (2018-08-09 17:22:00 +0200)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport.git backport/v4.14.61/snapshot-to-v4.18+fixes-flattened

for you to fetch changes up to 4d4605e5c137ed9a53582e573118cbc16b82cbf1:

  i2c: rcar: implement STOP and REP_START according to docs (2018-08-28 13:35:06 +0200)

----------------------------------------------------------------
LTSI-v4.14 Backport or I2C R-Car Fix

Base:
* v4.14.61
* Backports of components for Renesas SoCs to v4.18

Backport of post-v4.18 fix for i2c-rcar:
* implement STOP and REP_START according to docs

Dependency of above
* Refactor private flags of i2c-rcar driver

----------------------------------------------------------------
Wolfram Sang (2):
      i2c: rcar: refactor private flags
      i2c: rcar: implement STOP and REP_START according to docs

 drivers/i2c/busses/i2c-rcar.c | 39 +++++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 16 deletions(-)

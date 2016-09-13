Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33395 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752677AbcIMOpW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Sep 2016 10:45:22 -0400
Date: Tue, 13 Sep 2016 16:45:01 +0200
From: Simon Horman <horms+renesas@verge.net.au>
To: Geert Uytterhoeven <geert@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL FOR renesas-drivers] UHS-I SDR-104 support for
 sh_mobile_sdhi (crivers v7)
Message-ID: <20160913144458.GA19593@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

please consider pulling updated UHS-I SDR-104 support for sh_mobile_sdhi
(drivers v7).

This updates a branch you already have in renesas-drivers,
topic/sdr104-v6, which should be dropped.

This pull request is based on mmc/next.


The following changes since commit 53fbd6126b3bdabf24f617d4e3b4926f583b494f:

  mmc: sunxi: add support for A64 mmc controller (2016-09-09 12:13:41 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/sdr104-driver-v7

for you to fetch changes up to 354370aaa734fb22b6c2358e084fe44a010d697d:

  mmc: sh_mobile_sdhi: Add tuning support (2016-09-13 11:18:04 +0200)

----------------------------------------------------------------
Ai Kyuse (3):
      mmc: tmio: enhance illegal sequence handling
      mmc: tmio: Add hw reset support
      mmc: tmio: Add tuning support

Simon Horman (3):
      mmc: core: Add helper to see if a host can be retuned
      mmc: tmio: document mandatory and optional callbacks
      mmc: sh_mobile_sdhi: Add tuning support

 drivers/mmc/host/sh_mobile_sdhi.c | 265 +++++++++++++++++++++++++++++++++++++-
 drivers/mmc/host/tmio_mmc.h       |  18 ++-
 drivers/mmc/host/tmio_mmc_pio.c   |  87 ++++++++++++-
 include/linux/mmc/host.h          |   5 +
 4 files changed, 367 insertions(+), 8 deletions(-)

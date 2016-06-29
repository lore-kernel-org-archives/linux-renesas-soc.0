Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45104 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750828AbcF2IgP (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 29 Jun 2016 04:36:15 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: Geert Uytterhoeven <geert@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL FOR renesas-drivers] ARM: dts: r8a779x: use demuxer for I2C
Date: Wed, 29 Jun 2016 10:35:29 +0200
Message-Id: <1467189329-16424-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

please consider pulling the latest integration of the i2c demuxer for
R-Car Gen 2 boards into renesas-drivers.

There are still some underlying driver problems that prevent core switching
from working. And I expect some revisions to the DT patches once the
driver problems are resolved and the code can be exercised more
extensively. However, I do not believe these patches cause any regressions
and I believe it is worth considering giving them more exposure in
renesas-drivers.

The following changes since commit 58ad5755a31c4f7b77cbaa38e9c63102e63a83f8:

  Merge branch 'heads/arm64-dt-for-v4.8' into next (2016-06-21 11:30:47 +0900)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/i2c-demux-v3

for you to fetch changes up to 99901f11428e6329bf0a06888bd7fa3969c40d63:

  ARM: dts: silk: use demuxer for I2C1 (2016-06-22 12:39:54 +0900)

----------------------------------------------------------------
Simon Horman (13):
      ARM: dts: lager: rename and reindex i2cexio
      ARM: dts: lager: use demuxer for IIC1/I2C1
      ARM: dts: lager: use demuxer for IIC2/I2C2
      ARM: dts: lager: use demuxer for IIC3/I2C3
      ARM: dts: koelsch: use demuxer for I2C1
      ARM: dts: koelsch: use demuxer for I2C2
      ARM: dts: koelsch: use demuxer for I2C4
      ARM: dts: porter: use demuxer for I2C2
      ARM: dts: porter: use demuxer for I2C2
      ARM: dts: koelsch: use demuxer for I2C4
      ARM: dts: alt: use demuxer for I2C1
      ARM: dts: alt: use demuxer for I2C4
      ARM: dts: silk: use demuxer for I2C1

 arch/arm/boot/dts/r8a7790-lager.dts   | 275 +++++++++++++++++++++++-----------
 arch/arm/boot/dts/r8a7791-koelsch.dts | 209 +++++++++++++++++++-------
 arch/arm/boot/dts/r8a7791-porter.dts  | 129 +++++++++-------
 arch/arm/boot/dts/r8a7793-gose.dts    | 147 ++++++++++++------
 arch/arm/boot/dts/r8a7794-alt.dts     |  87 +++++++++--
 arch/arm/boot/dts/r8a7794-silk.dts    | 117 +++++++++------
 6 files changed, 658 insertions(+), 306 deletions(-)

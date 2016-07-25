Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56119 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752582AbcGYC35 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sun, 24 Jul 2016 22:29:57 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] SH Drivers Updates for v4.8
Date: Mon, 25 Jul 2016 11:29:37 +0900
Message-Id: <cover.1469413328.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Linus,

Please consider these SH drivers updates for v4.8.

I expect this to be my last pull request for these drivers as
it removes usage of them from Renesas ARM Based SoCs and my
co-maintenance of them.

The drivers are still used by some SH SoCs and listed under SUPERH
in the MAINTAINERS file.


The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-sh-drivers-for-v4.8

for you to fetch changes up to 3fd0498b842f2932558797ec297dc30f6eb5cec0:

  MAINTAINERS: Drop drivers/sh/ for Renesas ARM (2016-05-30 09:41:39 +0900)

----------------------------------------------------------------
SH Drivers Updates for v4.8

* Drop us of SH Drivers on Renesas ARM Based SoCs

----------------------------------------------------------------
Geert Uytterhoeven (2):
      drivers: sh: Stop using the legacy clock domain on ARM
      MAINTAINERS: Drop drivers/sh/ for Renesas ARM

 MAINTAINERS             | 1 -
 drivers/Makefile        | 1 -
 drivers/sh/pm_runtime.c | 9 ---------
 3 files changed, 11 deletions(-)

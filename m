Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Simon Horman <horms+renesas@verge.net.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC SH Drivers Fixes for v4.5
Date: Fri, 26 Feb 2016 09:12:35 +0900
Message-Id: <cover.1456445477.git.horms+renesas@verge.net.au>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Linus,

Please consider this Renesas ARM based SoC SH drivers fix for v4.5.

This corrects a regression for some SuperH platforms which was
introduced in v4.4. The regression may lead to driver failures due
to clocks not being enabled when needed.


The following changes since commit 92e963f50fc74041b5e9e744c330dca48e04f08d:

  Linux 4.5-rc1 (2016-01-24 13:06:47 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-sh-drivers-fixes-for-v4.5

for you to fetch changes up to 0378ba4899d5fbd8494ed6580cbc81d7b44dbac6:

  drivers: sh: Restore legacy clock domain on SuperH platforms (2016-02-25 09:05:19 +0900)

----------------------------------------------------------------
Renesas ARM Based SoC SH Drivers Fixes for v4.5

* Restore legacy clock domain on SuperH platforms

----------------------------------------------------------------
Geert Uytterhoeven (1):
      drivers: sh: Restore legacy clock domain on SuperH platforms

 drivers/sh/pm_runtime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

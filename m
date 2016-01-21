Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Simon Horman <horms+renesas@verge.net.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] SH Drivers Updates for v4.5
Date: Thu, 21 Jan 2016 11:42:50 +0900
Message-Id: <cover.1453343708.git.horms+renesas@verge.net.au>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Linus,

Please consider these SH drivers updates for v4.5.

It is comprised of a cleanup from Geert Uytterhoeven for the clock API.

This pull request is based on the previous round of such requests, which
were for v4.4. I can rebase, e.g. on top of v4.4, if that would be better.


The following changes since commit 0ba58de231066e47de87ccc4d61c5e396fe9bd27:

  drivers: sh: Get rid of CONFIG_ARCH_SHMOBILE_MULTI (2015-11-17 02:12:46 +0900)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-sh-drivers-for-v4.5

for you to fetch changes up to 6575a9c69a211ac1cf454f9c76be54f7a5fae9fe:

  drivers: sh: clk: Avoid crashes when passing NULL clocks (2015-11-24 11:49:18 +0900)

----------------------------------------------------------------
SH Drivers Updates for v4.5

Clean up the clock API on legacy SH to make it more similar to the Common
Clock Framework.  This will avoid different behaviour in drivers shared
between legacy and CCF-based platforms (e.g. SCIF).

----------------------------------------------------------------
Geert Uytterhoeven (2):
      drivers: sh: clk: Remove obsolete and unused clk_round_parent()
      drivers: sh: clk: Avoid crashes when passing NULL clocks

 drivers/sh/clk/core.c  | 100 ++++++-------------------------------------------
 include/linux/sh_clk.h |   4 --
 2 files changed, 12 insertions(+), 92 deletions(-)

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56528 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753169AbcFHBBD (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 7 Jun 2016 21:01:03 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC Updates for v4.8
Date: Wed,  8 Jun 2016 10:00:19 +0900
Message-Id: <cover.1465347025.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC updates for v4.8.


The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-soc-for-v4.8

for you to fetch changes up to c94bc815f3c757df402d6f6a3e8d855b9168e6af:

  ARM: shmobile: rcar-gen2: Use ICRAM1 for jump stub on all SoCs (2016-05-30 09:39:43 +0900)

----------------------------------------------------------------
Renesas ARM Based SoC Updates for v4.8

* Use ICRAM1 for jump stub on R-Car Gen 2 SoCs
* Postpone call to pm_genpd_init

----------------------------------------------------------------
Geert Uytterhoeven (2):
      ARM: shmobile: pm-rmobile: Postpone call to pm_genpd_init()
      ARM: shmobile: rcar-gen2: Use ICRAM1 for jump stub on all SoCs

 arch/arm/mach-shmobile/pm-rcar-gen2.c | 13 ++++---------
 arch/arm/mach-shmobile/pm-rmobile.c   |  2 +-
 2 files changed, 5 insertions(+), 10 deletions(-)

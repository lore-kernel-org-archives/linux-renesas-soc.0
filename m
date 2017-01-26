Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46334 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753094AbdAZKL1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 05:11:27 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Second Round of Renesas ARM Based SoC Updates for v4.11
Date: Thu, 26 Jan 2017 11:11:18 +0100
Message-Id: <cover.1485425385.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these second round of Renesas ARM based SoC updates for v4.11.

This pull request is based on the previous round of
such requests, tagged as renesas-soc-for-v4.11,
which you have already pulled.


The following changes since commit 70def3e53694a65c5583fb5f411491a5074bab18:

  ARM: shmobile: rcar-gen2: Remove unused rcar_gen2_read_mode_pins() (2017-01-03 10:50:45 +0100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-soc2-for-v4.11

for you to fetch changes up to aa7f39d51e33555fc45645c08bc74a74e22b166f:

  ARM: shmobile: rcar-gen2: Add more register documentation (2017-01-25 11:28:28 +0100)

----------------------------------------------------------------
Second Round of Renesas ARM Based SoC Updates for v4.11

* Add more register documentation to R-Car Gen2 PM

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: shmobile: rcar-gen2: Add more register documentation

 arch/arm/mach-shmobile/pm-rcar-gen2.c | 40 +++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 11 deletions(-)

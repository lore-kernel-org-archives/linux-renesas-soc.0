Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47381 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754836AbdLFKWA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Dec 2017 05:22:00 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC Updates for v4.16
Date: Wed,  6 Dec 2017 11:21:52 +0100
Message-Id: <cover.1512553442.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC updates for v4.16.


The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:

  Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-soc-for-v4.16

for you to fetch changes up to 90f0d2b344313a8a4c366ef60d0df33008d2be84:

  soc: renesas: Identify R-Car M3-W ES1.1 (2017-11-27 11:40:57 +0100)

----------------------------------------------------------------
Renesas ARM Based SoC Updates for v4.16

* Identify R-Car M3-W ES1.1

  Geert Uytterhoeven says "The Product Register of R-Car M3-W ES1.1
  incorrectly identifies the SoC revision as ES2.0.  Add a workaround to
  fix this."

  It is my understanding that this is likely to be forwards-compatibile.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      soc: renesas: Identify R-Car M3-W ES1.1

 drivers/soc/renesas/renesas-soc.c | 3 +++
 1 file changed, 3 insertions(+)

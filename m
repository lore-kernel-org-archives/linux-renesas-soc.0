Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60361 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750977AbdGaLND (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2017 07:13:03 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Third Round of Renesas ARM Based SoC Fixes for v4.13
Date: Mon, 31 Jul 2017 13:12:34 +0200
Message-Id: <cover.1501499175.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these third round of Renesas ARM based SoC fixes for v4.13.

This pull request is based on v4.12-rc1 rather than earlier fixes for v4.13
as it is unrelated to those fixes and their dependencies - arm64 DT updates
for R-Car Gen 3 SoCs.

This fix resolves a deadlock during boot on R-Car Gen 2 SoCs.
The bug has been present since v4.1-rc1 but does not manifest in
a deadlock until v4.13-rc1.


The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:

  Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-fixes3-for-v4.13

for you to fetch changes up to fce8dc5e50e44d8f644e0f7854e6d7d518fedb68:

  ARM: shmobile: rcar-gen2: Fix deadlock in regulator quirk (2017-07-29 10:32:52 +0200)

----------------------------------------------------------------
Third Round of Renesas ARM Based SoC Fixes for v4.13

Fix deadlock in regulator quirk for R-Car Gen 2 SoCs

The da9063/da9210 regulator quirk for R-Car Gen2 boards uses a bus
notifier, and unregisters the notifier when it is no longer needed.
However, a notifier must not be unregistered from within the call chain.

This bug went unnoticed, as blocking_notifier_chain_unregister() didn't
take the semaphore during early boot. This is no longer the case as of
upstream commit 1c3c5eab171590f8 ("sched/core: Enable might_sleep() and
smp_processor_id() checks early") and a deadlock occurs.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: shmobile: rcar-gen2: Fix deadlock in regulator quirk

 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

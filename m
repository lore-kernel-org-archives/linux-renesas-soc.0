Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36962 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935188AbeFMLlR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jun 2018 07:41:17 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC Fixes for v4.18
Date: Wed, 13 Jun 2018 13:41:12 +0200
Message-Id: <cover.1528889592.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC fixes for v4.18.

This pull request is based on renesas-soc-for-v4.18,
which you have already pulled.

The following changes since commit 086b399965a7ee7e50c3b3c57f2dba30ff0334b0:

  soc: renesas: r8a77990-sysc: Add workaround for 3DG-{A,B} (2018-05-16 10:57:44 +0200)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-fixes-for-v4.18

for you to fetch changes up to 977d5ba4507dfe5b1346597ee57750262d8d2b19:

  soc: renesas: rcar-sysc: Make PM domain initialization more robust (2018-06-08 10:04:25 +0200)

----------------------------------------------------------------
Renesas ARM Based SoC Fixes for v4.18

Make PM domain initialization more robust in Renesas R-Car SYSC driver.
This resolves a regression due to re-parenting of PM domains by
086b399965a7ee7e ("soc: renesas: r8a77990-sysc: Add workaround for 3DG-{A,B}").

----------------------------------------------------------------
Geert Uytterhoeven (1):
      soc: renesas: rcar-sysc: Make PM domain initialization more robust

 drivers/soc/renesas/rcar-sysc.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

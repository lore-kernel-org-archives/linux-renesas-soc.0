Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36673 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753458AbdCTJAY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2017 05:00:24 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC Drivers Updates for v4.12
Date: Mon, 20 Mar 2017 09:58:23 +0100
Message-Id: <cover.1490000158.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC drivers updates for v4.12.


The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:

  Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-drivers-for-v4.12

for you to fetch changes up to cd59de80dd34dd2d1a3ca97d7a6e712c048b135a:

  soc: renesas: Identify RZ/G1N (2017-03-13 10:26:08 +0100)

----------------------------------------------------------------
Renesas ARM Based SoC Drivers Updates for v4.12

* Identify RZ/G1N and RZ/G1H

----------------------------------------------------------------
Geert Uytterhoeven (2):
      soc: renesas: Identify RZ/G1H
      soc: renesas: Identify RZ/G1N

 drivers/soc/renesas/renesas-soc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

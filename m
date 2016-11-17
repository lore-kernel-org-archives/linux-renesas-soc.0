Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51650 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S941742AbcKQRme (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Nov 2016 12:42:34 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC EtherAVB Updates for v4.10
Date: Thu, 17 Nov 2016 15:05:08 +0100
Message-Id: <cover.1479390880.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC EtherAVB updates for v4.10.

This pull request is based on the "Second Round of Renesas ARM64 Based SoC
DT Updates for v4.10", tagged as arm64-dt-for-v4.10, which I have also sent
a pull-request for.

The reason for this base is to provide dependencies. For the same reason
an ack has been provided by David Miller to facilitate a merge of the patch
via the Renesas tree.


The following changes since commit 6f8a4c84d95031806594f5992a79fefd251c2f51:

  arm64: dts: r8a7796: Add device node for PRR (2016-11-17 14:48:28 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-ravb-for-v4.10

for you to fetch changes up to 735ea633e42060546cabe8430efbc00d4be1790a:

  ravb: Support 1Gbps on R-Car H3 ES1.1+ and R-Car M3-W (2016-11-17 14:53:44 +0100)

----------------------------------------------------------------
Renesas ARM Based SoC EtherAVB Updates for v4.10

* Support 1Gbps on R-Car H3 ES1.1+ and R-Car M3-W

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ravb: Support 1Gbps on R-Car H3 ES1.1+ and R-Car M3-W

 drivers/net/ethernet/renesas/ravb_main.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

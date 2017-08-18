Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33652 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751644AbdHRIU3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Aug 2017 04:20:29 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Second Round of Renesas ARM Based SoC DT Bindings Updates for v4.14
Date: Fri, 18 Aug 2017 10:20:06 +0200
Message-Id: <cover.1502961902.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these second round of Renesas ARM based SoC DT bindings updates for v4.14.

This pull request is based on the previous round of
such requests, tagged as renesas-dt-bindings-for-v4.14,
which I have already sent a pull-request for.


The following changes since commit 100acb0bd90be67b3fc625cff91c7617b791743d:

  ARM: shmobile: Document Renesas Draak board DT bindings (2017-07-27 17:10:48 +0200)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-dt-bindings2-for-v4.14

for you to fetch changes up to 304ce59242e11e715bfdc86577771502df99f7cd:

  dt-bindings: apmu: Document r8a7743 support (2017-08-17 10:32:24 +0200)

----------------------------------------------------------------
Second Round of Renesas ARM Based SoC DT Bindings Updates for v4.14

* Add RZ/G1M (r8a7743) binding to apmu driver

  This allows SMP to be supported on the RZ/G1M SoC

* Add bindings for iW-RainboW-G22D-SODIMM RZ/G1E SODIMM development kit

  This is in preparation for adding DTS to support this hardware

----------------------------------------------------------------
Biju Das (1):
      dt-bindings: apmu: Document r8a7743 support

Fabrizio Castro (2):
      ARM: shmobile: document iW-RainboW-G22M-SM SODIMM System on Module
      ARM: shmobile: document iW-RainboW-G22D SODIMM SOM Development Platform

 Documentation/devicetree/bindings/arm/shmobile.txt       | 4 ++++
 Documentation/devicetree/bindings/power/renesas,apmu.txt | 3 ++-
 2 files changed, 6 insertions(+), 1 deletion(-)

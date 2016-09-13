Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33525 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753562AbcIMOtf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Sep 2016 10:49:35 -0400
Date: Tue, 13 Sep 2016 16:49:29 +0200
From: Simon Horman <horms+renesas@verge.net.au>
To: Geert Uytterhoeven <geert@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL FOR renesas-drivers] UHS-I SDR-104 support for
 sh_mobile_sdhi (integration v7)
Message-ID: <20160913144928.GB19593@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

please consider pulling updated UHS-I SDR-104 support for sh_mobile_sdhi
(integration v7).

This updates a branch you already have in renesas-drivers,
topic/sdr104-v6, which should be dropped.

This pull request is based on renesas-next-20160908-v4.8-rc1:

This pull request is a companion to one for topic/sdr104-drivers-v7
which I sent to you a little earlier.

The Gen 3 portion of this patchset is not much use from a performance point
of view without DMA support provided by "[GIT PULL FOR renesas-drivers]
mmc: renesas_sdhi: add R-Car Gen-3 DMA support", which I previously
submitted to you as topic/sdhi-gen 3-dma. As there are some conflicts
between that patchset and this one I have provided
the following branches in the renesas tree at the URL below.

* topic/sdhi-gen3-dma-v3.rebase

I have also prepared the following branches for testing purposes

* topic/sdr104-v7
  - A merge of topic/sdr104-drivers-v7 and topic/sdr104-integration-v7
    with dependencies from renesas-drivers merged and other dependencies
    cherry-picked.
* topic/sdr104-v7+sdhi-dma-v3
  - A merge of topic/sdhi-gen3-dma-v3.rebase and topic/sdr104-v7


The following changes since commit a64ca8158b213343b46cc8c220db564b6505df04:

  Merge branches 'fixes-for-v4.8', 'arm64-defconfig-for-v4.9', 'arm64-dt-for-v4.9', 'defconfig-for-v4.9', 'dt-for-v4.9' and 'soc-for-v4.9' into next (2016-09-08 09:36:49 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/sdr104-integration-v7

for you to fetch changes up to 4dc6fe955dafef69b02abe34e8d59bc092bdb99a:

  arm64: dts: r8a7796: salvator-x: Enable UHS-I SDR-104 (2016-09-09 17:50:20 +0200)

----------------------------------------------------------------
Simon Horman (10):
      ARM: dts: lager: Enable UHS-I SDR-104
      arm64: dts: r8a7795: salvator-x: Enable UHS-I SDR-104
      ARM: dts: r8a7791: set maximum frequency for SDHI clocks
      ARM: dts: koelsch: Enable UHS-I SDR-50 and SDR-104
      ARM: dts: r8a7794: set maximum frequency for SDHI clocks
      ARM: dts: alt: Enable UHS-I SDR-50 and SDR-104
      arm64: dts: r8a7796: add SDHI nodes
      arm64: dts: r8a7796: salvator-x: enable SDHI0 & 3
      arm64: dts: r8a7796: salvator-x: enable UHS for SDHI 0 & 3
      arm64: dts: r8a7796: salvator-x: Enable UHS-I SDR-104

Wolfram Sang (1):
      arm64: dts: r8a7795: salvator-x: enable UHS for SDHI 0 & 3

 arch/arm/boot/dts/r8a7790-lager.dts                |   1 +
 arch/arm/boot/dts/r8a7791-koelsch.dts              |  34 ++++++-
 arch/arm/boot/dts/r8a7791.dtsi                     |   3 +
 arch/arm/boot/dts/r8a7794-alt.dts                  |  23 ++++-
 arch/arm/boot/dts/r8a7794.dtsi                     |   3 +
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |  24 ++++-
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 104 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           |  42 +++++++++
 8 files changed, 227 insertions(+), 7 deletions(-)

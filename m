Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54555 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754148AbdDGP6H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Apr 2017 11:58:07 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Second Round of Renesas ARM64 Based SoC DT Updates for v4.12
Date: Fri,  7 Apr 2017 11:57:59 -0400
Message-Id: <cover.1491578743.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these second round of Renesas ARM64 based SoC DT updates
for v4.12.

This pull request is based on the previous round of
such requests, tagged as renesas-arm64-dt-for-v4.12,
which you have already pulled.


The following changes since commit 3cbe33367d4fd480a92fbc131a96fa925be9e95d:

  arm64: dts: r8a7796: salvator-x: Drop superfluous status update for frequency override (2017-03-13 10:21:16 +0100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-dt2-for-v4.12

for you to fetch changes up to 6922bd71adab0a7fe8ffbdc3e72a46431fa29656:

  arm64: dts: r8a7795: salvator-x: Drop _clk suffix from X12 clock node name (2017-04-05 14:17:19 -0400)

----------------------------------------------------------------
Second Round of Renesas ARM64 Based SoC DT Updates for v4.12

Corrections:
* r8a7795: Correct SATA device size to 2MiB for r8a7795 SoC

Cleanup:
* Drop _clk suffix from X12 clock node name for r8a7795 SoC

Enhancements:
* Add reset control properties for r8a779[56]

----------------------------------------------------------------
Geert Uytterhoeven (3):
      arm64: dts: r8a7795: Add reset control properties
      arm64: dts: r8a7796: Add reset control properties
      arm64: dts: r8a7795: salvator-x: Drop _clk suffix from X12 clock node name

Magnus Damm (1):
      arm64: dts: r8a7795: Correct SATA device size to 2MiB

 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |  2 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           | 95 +++++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           | 46 +++++++++++
 3 files changed, 141 insertions(+), 2 deletions(-)

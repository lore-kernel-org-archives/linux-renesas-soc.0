Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55792 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbeLFV5i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 16:57:38 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Second Round of Renesas ARM64 Based SoC DT Updates for v4.21
Date: Thu,  6 Dec 2018 13:57:30 -0800
Message-Id: <cover.1544126426.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these second round of Renesas ARM64 based SoC DT updates
for v4.21.

This pull request is based on the previous round of
such requests, tagged as renesas-arm64-dt-for-v4.21,
which you have already pulled.


The following changes since commit 275e4eb3f21a09b6b8bd4a353b9a01e500240385:

  arm64: dts: renesas: Add all CPUs in cooling maps (2018-11-26 09:11:44 +0100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-dt2-for-v4.21

for you to fetch changes up to 4fbd4158fe8967e9296516ebae2cfaf7a1c7a214:

  arm64: dts: renesas: r8a77995: draak: Add backlight (2018-12-05 11:45:44 -0800)

----------------------------------------------------------------
Second Round of Renesas ARM64 Based SoC DT Updates for v4.21

* R-Car D3 (r8a77995) SoC based Draak board
  - Add the backlight device for the LVDS1 output

* R-Car H3 (r8a7795) ES1.0 SoC
  - Add missing power domains to IPMMU nodes

* R-Car M3-N (r8a77965) SoC
  - Remove non-existent IPMMU-IR

----------------------------------------------------------------
Geert Uytterhoeven (2):
      arm64: dts: renesas: r8a77965: Remove non-existent IPMMU-IR
      arm64: dts: renesas: r8a7795-es1: Add missing power domains to IPMMU nodes

Laurent Pinchart (1):
      arm64: dts: renesas: r8a77995: draak: Add backlight

 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi   |  2 ++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi      |  8 --------
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 20 ++++++++++++++++++++
 3 files changed, 22 insertions(+), 8 deletions(-)

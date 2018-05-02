Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48413 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751036AbeEBKS2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 May 2018 06:18:28 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC Fixes for v4.17
Date: Wed,  2 May 2018 12:18:14 +0200
Message-Id: <cover.1525256178.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC fixes for v4.17.


The following changes since commit 60cc43fc888428bb2f18f08997432d426a243338:

  Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-fixes-for-v4.17

for you to fetch changes up to edb0c3affe5214a21d71ffb82ca92ed068e828df:

  ARM: dts: r8a7793: Convert to new LVDS DT bindings (2018-04-23 12:31:42 +0200)

----------------------------------------------------------------
Renesas ARM Based SoC Fixes for v4.17

Fix LVDS output on Gen2 boards

Laurent Pincart says "This patch series fixes LVDS output support on the
Lager, Koelsh, Porter and Gose boards that broke in v4.17-rc1 due to the
combination of the R-Car DU LVDS driver rework and the DT move of all
on-SoC peripherals to a /soc node.

We could handle the problem in the R-Car DU LVDS DT backward compatibility
code, but that fix would only be used for v4.17 as in v4.18 the Gen2 DT
will move to the new LVDS DT bindings. I thus propose merging these three
patches in v4.17 already to fix the problem as this is the simplest
solution."

----------------------------------------------------------------
Laurent Pinchart (3):
      ARM: dts: r8a7790: Convert to new LVDS DT bindings
      ARM: dts: r8a7791: Convert to new LVDS DT bindings
      ARM: dts: r8a7793: Convert to new LVDS DT bindings

 arch/arm/boot/dts/r8a7790-lager.dts   | 22 +++++++++---
 arch/arm/boot/dts/r8a7790.dtsi        | 65 ++++++++++++++++++++++++++++++-----
 arch/arm/boot/dts/r8a7791-koelsch.dts | 12 +++++--
 arch/arm/boot/dts/r8a7791-porter.dts  | 16 +++++++--
 arch/arm/boot/dts/r8a7791.dtsi        | 36 +++++++++++++++----
 arch/arm/boot/dts/r8a7793-gose.dts    | 10 ++++--
 arch/arm/boot/dts/r8a7793.dtsi        | 37 ++++++++++++++++----
 7 files changed, 164 insertions(+), 34 deletions(-)

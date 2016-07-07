Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56051 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751200AbcGGOj5 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 7 Jul 2016 10:39:57 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL v2] Second Round of Renesas ARM64 Based SoC DT Updates for v4.8
Date: Thu,  7 Jul 2016 16:39:45 +0200
Message-Id: <cover.1467900241.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these second round of Renesas ARM64 based SoC DT updates for v4.8.

This pull request is based on a merge of:

* The previous round of such requests, tagged as renesas-arm64-dt2-for-v4.8,
  which you have already pulled.

* The clk-renesas-for-v4.8-tag2 tag of Geert Uytterhoeven's
  renesas-driver's tree which has been accepted into clk-next.

  This tag provides clock definitions needed by the r8a7796 DT files.

This is v2 of this pull request. v1 did not include the
clk-renesas-for-v4.8-tag2 tag and instead provided a duplicate clk patch.

The following changes since commit fffae950cf00a60ff584618ecc939c6a931e4bbb:

  Merge tag 'clk-renesas-for-v4.8-tag2' into HEAD (2016-07-07 10:21:07 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-dt2-for-v4.8

for you to fetch changes up to c805f1a7013a76ae63c002e52cc667d7c37228ea:

  arm64: dts: r8a7796/salvator-x: Enable watchdog timer (2016-07-07 10:21:28 +0200)

----------------------------------------------------------------
Second Round of Renesas ARM64 Based SoC DT Updates for v4.8

* Add support for  r8a7796/salvator-x (R-Car Gen 3 M3-W)
* Add CAN support to r8a7795 (R-Car Gen 3 H3)

----------------------------------------------------------------
Geert Uytterhoeven (5):
      arm64: dts: r8a7795: Add missing blank lines between cpu nodes
      arm64: dts: r8a7796: Add SYSC PM Domains
      arm64: dts: r8a7796: Use SYSC "always-on" PM Domain
      arm64: dts: r8a7796: Add RWDT node
      arm64: dts: r8a7796/salvator-x: Enable watchdog timer

Ramesh Shanmugasundaram (1):
      arm64: dts: r8a7795: Add CAN FD support

Simon Horman (1):
      arm64: dts: r8a7796: Add Renesas R8A7796 SoC support

Takeshi Kihara (1):
      arm64: dts: salvator-x: add Salvator-X board on R8A7796 SoC

 Documentation/devicetree/bindings/arm/shmobile.txt |   4 +
 arch/arm64/Kconfig.platforms                       |   6 +
 arch/arm64/boot/dts/renesas/Makefile               |   1 +
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |  26 ++++
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts |  50 ++++++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           | 138 +++++++++++++++++++++
 6 files changed, 225 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a7796.dtsi

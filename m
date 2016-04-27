Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41910 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750811AbcD0EUi (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 27 Apr 2016 00:20:38 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC DT PM Domain Updates for v4.7
Date: Wed, 27 Apr 2016 14:20:34 +1000
Message-Id: <cover.1461730638.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC DT pm-domain updates for v4.7.

This pull requests is based on a merge of:

* "[GIT PULL] Second Round of Renesas ARM Based SoC R-Car SYSC Updates for
  v4.7", tagged as renesas-rcar-sysc2-for-v4.7, which you have already
  pulled.
* "[GIT PULL v2] Renesas ARM Based SoC DT Updates for v4.7",
  tagged as renesas-dt-for-v4.7, which you have also already pulled.

The reason for the somewhat tedious base on
renesas-rcar-sysc2-for-v4.7, which provides driver changes,
is a hard run-time dependency.

I also have a similar set of changes for arm64 which I will send separately.


The following changes since commit 03ef285fd75f0a47461048832367ea71ec1bc65b:

  Merge tag 'renesas-rcar-sysc2-for-v4.7' into dt-pm-domain-for-v4.7 (2016-04-27 11:35:26 +1000)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-dt-pm-domain-for-v4.7

for you to fetch changes up to 25611e4ef5bb290805305d499715a840826462f3:

  ARM: dts: r8a7794: Use SYSC "always-on" PM Domain (2016-04-27 14:16:18 +1000)

----------------------------------------------------------------
Renesas ARM Based SoC DT PM Domain Updates for v4.7

* Add SYSC PM Domains to DT for R-Car Gen 1 and 2 SoCs

----------------------------------------------------------------
Geert Uytterhoeven (10):
      ARM: dts: r8a7779: Add SYSC PM Domains
      ARM: dts: r8a7790: Add SYSC PM Domains
      ARM: dts: r8a7791: Add SYSC PM Domains
      ARM: dts: r8a7793: Add SYSC PM Domains
      ARM: dts: r8a7794: Add SYSC PM Domains
      ARM: dts: r8a7779: Use SYSC "always-on" PM Domain
      ARM: dts: r8a7790: Use SYSC "always-on" PM Domain
      ARM: dts: r8a7791: Use SYSC "always-on" PM Domain
      ARM: dts: r8a7793: Use SYSC "always-on" PM Domain
      ARM: dts: r8a7794: Use SYSC "always-on" PM Domain

 arch/arm/boot/dts/r8a7779.dtsi |  54 ++++++++------
 arch/arm/boot/dts/r8a7790.dtsi | 155 ++++++++++++++++++++++------------------
 arch/arm/boot/dts/r8a7791.dtsi | 156 ++++++++++++++++++++++-------------------
 arch/arm/boot/dts/r8a7793.dtsi | 111 +++++++++++++++--------------
 arch/arm/boot/dts/r8a7794.dtsi | 116 ++++++++++++++++--------------
 5 files changed, 324 insertions(+), 268 deletions(-)

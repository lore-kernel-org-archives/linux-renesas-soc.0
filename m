Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41865 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750811AbcD0EUS (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 27 Apr 2016 00:20:18 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM64 Based SoC DT PM Domain Updates for v4.7
Date: Wed, 27 Apr 2016 14:20:10 +1000
Message-Id: <cover.1461730364.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM64 based SoC DT PM Domain updates for v4.7.

This pull requests is based on a merge of:

* "[GIT PULL] Second Round of Renesas ARM Based SoC R-Car SYSC Updates for
  v4.7", tagged as renesas-rcar-sysc2-for-v4.7, which you have already
  pulled
* "[GIT PULL] Second Round of Renesas ARM64 Based SoC DT Updates for v4.7",
  tagged as renesas-arm64-dt2-for-v4.7, which I have sent a pull request
  for.

The reason for the somewhat tedious base on
renesas-rcar-sysc2-for-v4.7, which provides driver changes,
is a hard run-time dependency.

I also have a similar set of changes for ARM (32-bit) which I will send
separately.


The following changes since commit 3238ec7c0a821915f38095752de97a424fd1d6ce:

  Merge tag 'renesas-rcar-sysc2-for-v4.7' into arm64-dt-pm-domain-for-v4.7 (2016-04-27 11:49:19 +1000)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-dt-pm-domain-for-v4.7

for you to fetch changes up to 38dbb45ee4bc7dda4aabba2178eebff2f93380d1:

  arm64: dts: r8a7795: Use SYSC "always-on" PM Domain (2016-04-27 14:10:41 +1000)

----------------------------------------------------------------
Renesas ARM64 Based SoC DT PM Domain Updates for v4.7

* Add SYSC PM Domains to DT of r8a7795 SoC

----------------------------------------------------------------
Geert Uytterhoeven (2):
      arm64: dts: r8a7795: Add SYSC PM Domains
      arm64: dts: r8a7795: Use SYSC "always-on" PM Domain

 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 123 +++++++++++++++++--------------
 1 file changed, 68 insertions(+), 55 deletions(-)

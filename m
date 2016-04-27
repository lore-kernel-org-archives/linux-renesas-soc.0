Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60352 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751038AbcD0XHE (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 27 Apr 2016 19:07:04 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Second Round of Renesas ARM Based SoC Fixes for v4.6
Date: Thu, 28 Apr 2016 09:06:57 +1000
Message-Id: <cover.1461798058.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these second round of Renesas ARM based SoC fixes for v4.6.

This fix allows serial to work on r8a7795-based boards where the optional
scif clock is not populated.

This pull request is based on the previous round of
such requests, tagged as renesas-fixes-for-v4.6,
which I have already sent a pull-request for.


The following changes since commit c531fb27e9699eaee478ee5686a3cca5dee73602:

  ARM: shmobile: timer: Fix preset_lpj leading to too short delays (2016-04-20 08:52:55 +1000)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-fixes2-for-v4.6

for you to fetch changes up to f5515f9cdff136dc32517d4b81fe2b9091237b4a:

  arm64: dts: r8a7795: Don't disable referenced optional scif clock (2016-04-26 09:44:48 +1000)

----------------------------------------------------------------
Second Round of Renesas ARM Based SoC Fixes for v4.6

* Don't disable referenced optional scif clock

----------------------------------------------------------------
Geert Uytterhoeven (1):
      arm64: dts: r8a7795: Don't disable referenced optional scif clock

 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 1 -
 1 file changed, 1 deletion(-)

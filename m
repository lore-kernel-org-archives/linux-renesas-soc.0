Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46188 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933608AbdIYHyw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Sep 2017 03:54:52 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC Fixes for v4.14
Date: Mon, 25 Sep 2017 09:54:30 +0200
Message-Id: <cover.1506324907.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC fixes for v4.14.


The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-fixes-for-v4.14

for you to fetch changes up to 829e4887b8676255778e162efc57e4a0f18f8bb3:

  arm64: dts: salvator-common: add 12V regulator to backlight (2017-09-21 10:03:51 +0200)

----------------------------------------------------------------
Renesas ARM Based SoC Fixes for v4.14

Add 12V regulator to backlight allowing the power supply
for the backlight to be found.

----------------------------------------------------------------
Ulrich Hecht (1):
      arm64: dts: salvator-common: add 12V regulator to backlight

 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

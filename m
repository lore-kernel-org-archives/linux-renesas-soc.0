Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44327 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751657AbdF3JQa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Jun 2017 05:16:30 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC Fixes for v4.13
Date: Fri, 30 Jun 2017 11:16:21 +0200
Message-Id: <cover.1498814088.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider this Renesas ARM based SoC fix for v4.13.

This pull request is based on
"[GIT PULL] Second Round of Renesas ARM64 Based SoC DT Updates for v4.13",
tagged as renesas-arm64-dt2-for-v4.13, which you have already pulled.

It is my understanding that the problem fixed was introduced
earlier in the v4.13 development cycle. So I don't think consideration
needs to be given to merging for to v4.12 or back-porting to -stable.


The following changes since commit 4d1255ebefb6838eab4f652107433438bea0051f:

  arm64: dts: r8a7796: Add reset control properties for audio (2017-06-14 11:00:29 +0200)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-fixes-for-v4.13

for you to fetch changes up to 5e2feac330953fe75197aecb20c781400e2bf606:

  arm64: renesas: salvator-common: sound clock-frequency needs descending order (2017-06-19 11:18:33 +0200)

----------------------------------------------------------------
Renesas ARM Based SoC Fixes for v4.13

Correct order of sound clock frequencies for Salvator boards
used by r8a7795 and r8a7796 SoCs.

These sounds clock frequencies are used as the ADG clock (output clocks
for audio module) initial setting and sound codec's initial system clock
which needs the maximum clock frequency. Thus, descending order is
required.

----------------------------------------------------------------
Kuninori Morimoto (1):
      arm64: renesas: salvator-common: sound clock-frequency needs descending order

 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

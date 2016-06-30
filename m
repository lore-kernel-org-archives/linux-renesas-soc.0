Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36051 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752250AbcF3OP3 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 30 Jun 2016 10:15:29 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM64 Based SoC Defconfig Updates for v4.8
Date: Thu, 30 Jun 2016 16:14:56 +0200
Message-Id: <cover.1467291186.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM64 based SoC defconfig updates for v4.8.


The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-defconfig-for-v4.8

for you to fetch changes up to 62bcf9087150f9588456d941d4ee444ead8ed6f2:

  arm64: defconfig: enable Renesas R8A7796 SoC (2016-06-06 10:26:04 +0900)

----------------------------------------------------------------
Renesas ARM64 Based SoC Defconfig Updates for v4.8

* Enable Renesas R8A7796 SoC in ARM64 defcnfig

----------------------------------------------------------------
Takeshi Kihara (1):
      arm64: defconfig: enable Renesas R8A7796 SoC

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36673 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753462AbdCTJA2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2017 05:00:28 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC DT Bindings Updates for v4.12
Date: Mon, 20 Mar 2017 09:58:32 +0100
Message-Id: <cover.1490000005.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC DT bindings updates for v4.12.


The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:

  Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-dt-bindings-for-v4.12

for you to fetch changes up to cfb9f93437eb6663ca99e85c47bb3656ccfe59c5:

  ARM: shmobile: Document RZ/G1N SoC DT binding (2017-03-13 10:24:14 +0100)

----------------------------------------------------------------
Renesas ARM Based SoC DT Bindings Updates for v4.12

* Document RZ/G1N and RZ/G1H SoC DT bindings

----------------------------------------------------------------
Geert Uytterhoeven (2):
      ARM: shmobile: Document RZ/G1H SoC DT binding
      ARM: shmobile: Document RZ/G1N SoC DT binding

 Documentation/devicetree/bindings/arm/shmobile.txt | 4 ++++
 1 file changed, 4 insertions(+)

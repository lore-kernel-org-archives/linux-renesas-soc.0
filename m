Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58325 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729116AbeI1QrU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Sep 2018 12:47:20 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC DT Bindings Updates for v4.20
Date: Fri, 28 Sep 2018 12:23:48 +0200
Message-Id: <cover.1538129305.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC DT bindings updates for v4.20.


The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:

  Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-dt-bindings-for-v4.20

for you to fetch changes up to 39c0e5a8746cfbfb87e86761337c807e7faea134:

  dt-bindings: arm: Document RZ/G2E SoC DT bindings (2018-09-12 10:27:16 +0200)

----------------------------------------------------------------
Renesas ARM Based SoC DT Bindings Updates for v4.20

* Document bindings for:
  - RZ/G2E (r8a774c0), RZ/G2M (r8a774a1) and RZ/A2 (r7s9210) SoCs
  - R-Car M3-N (r8a77965) SoC based ULCB board

----------------------------------------------------------------
Biju Das (1):
      dt-bindings: arm: Document RZ/G2M SoC DT bindings

Chris Brandt (1):
      dt-bindings: arm: Document RZ/A2 SoC DT bindings

Eugeniu Rosca (1):
      dt-bindings: arm: Document Renesas R-Car M3-N-based ULCB board

Fabrizio Castro (1):
      dt-bindings: arm: Document RZ/G2E SoC DT bindings

 Documentation/devicetree/bindings/arm/shmobile.txt | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

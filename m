Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33644 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727518AbeGTMyD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jul 2018 08:54:03 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC DT Bindings Updates for v4.19
Date: Fri, 20 Jul 2018 14:06:04 +0200
Message-Id: <cover.1532081674.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC DT bindings updates for v4.19.


The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56ab40:

  Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-dt-bindings-for-v4.19

for you to fetch changes up to a7eaad7f7517ba7cdabfeb28fa05bae4e70b4b5a:

  dt-bindings: cpu: Add Renesas R9A06G032 SMP enable method. (2018-06-28 14:07:21 +0200)

----------------------------------------------------------------
Renesas ARM Based SoC DT Bindings Updates for v4.19

Bindings relating to initial support for RZ/N1D (R9A06G032) SoC and its
RZN1D-DB board:

* Add Renesas R9A06G032 SMP enable method

  To be used to enable second CA7 CPU

* Document SoC and Board bindings

----------------------------------------------------------------
Michel Pollet (2):
      dt-bindings: arm: Document the RZN1D-DB board
      dt-bindings: cpu: Add Renesas R9A06G032 SMP enable method.

 Documentation/devicetree/bindings/arm/cpus.txt     | 1 +
 Documentation/devicetree/bindings/arm/shmobile.txt | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

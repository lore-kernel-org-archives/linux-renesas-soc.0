Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46307 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751762AbdAZKLP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 05:11:15 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Second Round of Renesas ARM Based SoC DT Updates for v4.11
Date: Thu, 26 Jan 2017 11:11:05 +0100
Message-Id: <cover.1485425227.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these second round of Renesas ARM based SoC DT updates for v4.11.

This pull request is based on the previous round of
such requests, tagged as renesas-dt-for-v4.11,
which you have already pulled.


The following changes since commit 654450baf2afba86cf328e1849ccac61ec4630af:

  ARM: dts: r8a7790: Use R-Car Gen 2 fallback binding for msiof nodes (2017-01-03 10:47:05 +0100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-dt2-for-v4.11

for you to fetch changes up to 5786ac14239a0809ca13e6a6f77147e6bb04aa29:

  ARM: dts: r7s72100: add power-domains to mmcif (2017-01-25 11:32:02 +0100)

----------------------------------------------------------------
Second Round of Renesas ARM Based SoC DT Updates for v4.11

Enhancements:
* Add power-domains to mmcif on r7s72100 SoC
* Add OSTM to rskrza1/r7s72100
* Link ARM GIC to clock and clock domain on r8a774[35] SoCs

Clean-up:
* Correct SATA device status on r8a7779/marzen

----------------------------------------------------------------
Chris Brandt (4):
      ARM: dts: r7s72100: add ostm clock to device tree
      ARM: dts: r7s72100: add ostm to device tree
      ARM: dts: rskrza1: add ostm DT support
      ARM: dts: r7s72100: add power-domains to mmcif

Geert Uytterhoeven (3):
      ARM: dts: r8a7779, marzen: Fix sata device status
      ARM: dts: r8a7743: Link ARM GIC to clock and clock domain
      ARM: dts: r8a7745: Link ARM GIC to clock and clock domain

 arch/arm/boot/dts/r7s72100-rskrza1.dts     |  8 ++++++++
 arch/arm/boot/dts/r7s72100.dtsi            | 28 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/r8a7743.dtsi             |  3 +++
 arch/arm/boot/dts/r8a7745.dtsi             |  3 +++
 arch/arm/boot/dts/r8a7779-marzen.dts       |  4 ++++
 arch/arm/boot/dts/r8a7779.dtsi             |  1 +
 include/dt-bindings/clock/r7s72100-clock.h |  4 ++++
 7 files changed, 51 insertions(+)

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45760 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729669AbeHEBPD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 4 Aug 2018 21:15:03 -0400
Received: by mail-wr1-f68.google.com with SMTP id f12-v6so8766774wrv.12
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Aug 2018 16:12:45 -0700 (PDT)
From: Eugeniu Rosca <roscaeugeniu@gmail.com>
To: Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas Soderlund <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Cc: Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>
Subject: [PATCH 00/14] Add minimal DTS support for M3-N Starter Kit
Date: Sun,  5 Aug 2018 01:11:00 +0200
Message-Id: <20180804231114.21420-1-erosca@de.adit-jv.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Renesas community,

This patch series arised during the bring-up of M3-N-based ULCB board.
It adds minimal DTS support and documents some new DT bindings.

It also does some collateral changes in the area of ULCB compatible
strings, to avoid defining something like "renesas,m3nulcb". Similar to
how "renesas,salvator-x{s}" compatibles are constructed, in my opinion,
"renesas,(m3|m3n|h3)ulcb" should not use the SoC model in their name,
for consistency.

Another change done in preparation of the M3-N DTS commits is renaming
the ULCB device trees:
 - from "<SoC>-<SoC>ulcb*.dts"
 - to   "<SoC>-ulcb*.dts"

These patches have been tested on M3-N ULCB using v4.18-rc7 kernel.
Any comments would be greatly appreciated.

Best regards,
Eugeniu.

Eugeniu Rosca (14):
  arm64: dts: renesas: Cut redundant <SoC> in *<SoC>-<SoC>ulcb*.dts
  dt-bindings: arm: don't embed SoC name into the ULCB boards' compatible
  arm64: dts: renesas: r8a7795-es1: ulcb: Use "renesas,ulcb" compatible
  arm64: dts: renesas: r8a7795-es1: ulcb-kf: Use "renesas,ulcb" compatible
  arm64: dts: renesas: r8a7795: ulcb: Use "renesas,ulcb" compatible
  arm64: dts: renesas: r8a7795: ulcb-kf: Use "renesas,ulcb" compatible
  arm64: dts: renesas: r8a7796: ulcb: Use "renesas,ulcb" compatible
  arm64: dts: renesas: r8a7796: ulcb-kf: Use "renesas,ulcb" compatible
  dt-bindings: arm: Document Renesas R-Car M3-N-based ULCB board
  arm64: dts: renesas: r8a77965: ulcb: Initial device tree
  dt-bindings: can: rcar_can: document r8a77965 can support
  arm64: dts: renesas: r8a77965: add CAN support
  arm64: dts: renesas: r8a77965: Add HSCIF0 device node
  arm64: dts: renesas: r8a77965: ulcb-kf: Initial device tree

 .../devicetree/bindings/arm/shmobile.txt      |  6 ++-
 .../devicetree/bindings/net/can/rcar_can.txt  | 10 ++--
 arch/arm64/boot/dts/renesas/Makefile          | 14 +++---
 ...-h3ulcb-kf.dts => r8a7795-es1-ulcb-kf.dts} |  4 +-
 ...95-es1-h3ulcb.dts => r8a7795-es1-ulcb.dts} |  2 +-
 ...7795-h3ulcb-kf.dts => r8a7795-ulcb-kf.dts} |  4 +-
 .../{r8a7795-h3ulcb.dts => r8a7795-ulcb.dts}  |  2 +-
 ...7796-m3ulcb-kf.dts => r8a7796-ulcb-kf.dts} |  4 +-
 .../{r8a7796-m3ulcb.dts => r8a7796-ulcb.dts}  |  2 +-
 .../boot/dts/renesas/r8a77965-ulcb-kf.dts     | 20 ++++++++
 arch/arm64/boot/dts/renesas/r8a77965-ulcb.dts | 37 ++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi     | 50 +++++++++++++++++++
 12 files changed, 135 insertions(+), 20 deletions(-)
 rename arch/arm64/boot/dts/renesas/{r8a7795-es1-h3ulcb-kf.dts => r8a7795-es1-ulcb-kf.dts} (84%)
 rename arch/arm64/boot/dts/renesas/{r8a7795-es1-h3ulcb.dts => r8a7795-es1-ulcb.dts} (94%)
 rename arch/arm64/boot/dts/renesas/{r8a7795-h3ulcb-kf.dts => r8a7795-ulcb-kf.dts} (84%)
 rename arch/arm64/boot/dts/renesas/{r8a7795-h3ulcb.dts => r8a7795-ulcb.dts} (96%)
 rename arch/arm64/boot/dts/renesas/{r8a7796-m3ulcb-kf.dts => r8a7796-ulcb-kf.dts} (84%)
 rename arch/arm64/boot/dts/renesas/{r8a7796-m3ulcb.dts => r8a7796-ulcb.dts} (95%)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77965-ulcb.dts

-- 
2.18.0

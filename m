Return-Path: <SRS0=xIzj=SV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81FF2C282E0
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:23:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 56CF8222D2
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:23:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727378AbfDSSXB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:23:01 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:58840 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727574AbfDSSWy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Apr 2019 14:22:54 -0400
Received: from penelope.horms.nl (unknown [62.153.215.140])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 8390A25BE40;
        Sat, 20 Apr 2019 00:34:50 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 659D3E21AF6; Fri, 19 Apr 2019 16:34:48 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     arm@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC DT Updates for v5.2
Date:   Fri, 19 Apr 2019 16:34:47 +0200
Message-Id: <cover.1555655522.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC DT updates for v5.2.


The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm-dt-for-v5.2

for you to fetch changes up to 0750e8344eb7c48f82a54920172a5d0f78eb223b:

  ARM: dts: ape6evm: Reorder bootargs (2019-04-17 17:47:37 +0200)

----------------------------------------------------------------
Renesas ARM Based SoC DT Updates for v5.2

* R-Car E2 (r8a7794) based Alt board
  - Enable USB and DA9063 PMIC

* R-Car V2H (R8A77920) based Blanche board
  - Enable IIC3 and DA9063 PMIC

* RZ/G1C (r8a77470) based iWave SBC
  - Enable HDMI, USB Phy[01], USB2.0 Host and HS-USB

* RZ/G1C (r8a77470) SoC
  - Describe DU, VIN, PWM and HSCIF, USB PHY, USB2.0 Host and HSUSB in DT

* RZ/A1H (R7S7210) based rskrza1 board
  - Enable remaining LEDs and I2C

* R-Mobile A1 (r8a7740) based ape6evm,
  R-Car H1 (r8a7779) based marzen,
  R-Car M1A (R8A7778) based bockw and
  Emma Mobile EV2 based kzm9d boads
  - Tidy up bootargs

* R-Mobile A1 (r8a7740) based ape6evm
  - Enable NOR FLASH

----------------------------------------------------------------
Biju Das (6):
      ARM: dts: r8a77470: Add USB PHY DT support
      ARM: dts: iwg23s-sbc: Enable USB Phy[01]
      ARM: dts: r8a77470: Add USB2.0 Host (EHCI/OHCI) device
      ARM: dts: iwg23s-sbc: Enable USB USB2.0 Host
      ARM: dts: r8a77470: Add HSUSB device nodes
      ARM: dts: iwg23s-sbc: Enable HS-USB

Cao Van Dong (3):
      ARM: dts: r8a77470: Add HSCIF support
      ARM: dts: r8a77470: Add PWM support
      ARM: dts: r8a77470: Add VIN support

Fabrizio Castro (2):
      ARM: dts: r8a77470: Add DU support
      ARM: dts: iwg23s-sbc: Add HDMI support

Geert Uytterhoeven (3):
      ARM: dts: ape6evm: Add NOR FLASH
      ARM: dts: rskrza1: Add I2C support
      ARM: dts: rskrza1: Add remaining LEDs

Magnus Damm (4):
      ARM: dts: kzm9d: Add rw parameter to bootargs
      ARM: dts: bockw: Reorder bootargs
      ARM: dts: marzen: Add rw to bootargs and use ip=dhcp
      ARM: dts: ape6evm: Reorder bootargs

Marek Vasut (3):
      ARM: dts: r8a7792: blanche: Add IIC3 and DA9063 PMIC node
      ARM: dts: alt: Add DA9063 PMIC node
      ARM: dts: alt: Enable USB support

 arch/arm/boot/dts/emev2-kzm9d.dts         |   2 +-
 arch/arm/boot/dts/r7s72100-rskrza1.dts    |  46 ++++-
 arch/arm/boot/dts/r8a73a4-ape6evm.dts     |  29 ++-
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 123 ++++++++++++
 arch/arm/boot/dts/r8a77470.dtsi           | 313 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/r8a7778-bockw.dts       |   2 +-
 arch/arm/boot/dts/r8a7779-marzen.dts      |   2 +-
 arch/arm/boot/dts/r8a7792-blanche.dts     |  20 ++
 arch/arm/boot/dts/r8a7792.dtsi            |  18 ++
 arch/arm/boot/dts/r8a7794-alt.dts         |  47 +++++
 10 files changed, 597 insertions(+), 5 deletions(-)

Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 047D6C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 10:54:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B7B8620700
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 10:54:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="MDFae2B9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbfDCKyO (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 06:54:14 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:37131 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfDCKyO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 06:54:14 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 9AACC25B820;
        Wed,  3 Apr 2019 21:54:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554288850; bh=7HIAfYOmBjt9aKuImCLucn5zUeZD3SC3de4MfLCR4A8=;
        h=From:To:Cc:Subject:Date:From;
        b=MDFae2B9sBesyxmd1PsHTkFi/qImgSDvq2VedETa/9yxB3vWGfxrZKf4uw+A606Rk
         MXfa2cerXbQ/wrNphQSKNc7l4gkM4bBiCPzpd9DxS317oTJ5AQrWHundhobhfWflY2
         OzbXGrVj8kJ+wOjm2VzjCW5xYN/uCLwmcH9kc4UM=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id C2150940361; Wed,  3 Apr 2019 12:54:08 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     arm@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM64 Based SoC DT Updates for v5.2
Date:   Wed,  3 Apr 2019 12:53:48 +0200
Message-Id: <cover.1554281697.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM64 based SoC DT updates for v5.2.

In keeping with similar early pull-requests for the past few release cycles
I am sending this now as a number of patches have accumulated in this
branch. I expect to send a follow-up pull-request closer to the usual rc6
timing.

The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-dt-for-v5.2

for you to fetch changes up to e3414b8c45afa5cdfb1ffd10f5334da3458c4aa5:

  arm64: dts: renesas: salvator-common: Add GPIO keys support (2019-03-27 13:02:12 +0100)

----------------------------------------------------------------
Renesas ARM64 Based SoC DT Updates for v5.2

* R-Car Gen3 SoC based Salvator-X and Salvator-XS boards
  - Add GPIO keys support
  - Sort rwdt node alphabetically

* R-Car H3 (r8a7795), M3-W (r8a7796) and M3-N (r8a77965) SoCs
  - Use extended audio DMAC register

* R-Car M3-W (r8a7796) SoC
  - Remove unneeded sound #address/size-cells

* R-Car M3-N (r8a77965) SoC
  - Add SSIU support for audio

* R-Car E3 (r8a77990) and RZ/G2E (r8a774c0) SoCs
  - Remove invalid compatible value for CSI40

* R-Car E3 (r8a77990) SoC
  - Cprrect SPDX license identifier style

* R-Car E3 (r8a77990) based Ebisu board
  - Add BD9571 PMIC with DDR0 backup power config
  - Correct adv7482 hexadecimal register address
  - Add GPIO expander

* R-Car E3 (r8a77990) based Ebisu and D3 (r8a77995) based Draak boards
  - Update bootargs to bring them into line with other R-Car Gen3 boards
  - Enable LVDS1 encoder

* R-Car D3 (r8a77995) based Draak board
  - Correct EthernetAVB phy mode
  - Enable CAN0 and CAN1

* RZ/G2E (r8a774c0) SoC
  - Add CANFD support
  - Correct CPU node style

* RZ/G2E (r8a774c0) and RZ/G2M (r8a774a1) SoCs
  - Add clkp2 clock to CAN nodes

* RZ/G2E (r8a774c0) based EK874 board
  - Add LED, CAN and RTC support

----------------------------------------------------------------
Biju Das (1):
      arm64: dts: renesas: r8a774c0-cat874: add RTC support

Fabrizio Castro (7):
      arm64: dts: renesas: r8a774c0: Fix cpu nodes style
      arm64: dts: renesas: cat875: Add CAN support
      arm64: dts: renesas: r8a774c0-cat874: Add LEDs support
      arm64: dts: renesas: r8a774c0-cat874: Add RWDT support
      arm64: dts: renesas: r8a774a1: Add clkp2 clock to CAN nodes
      arm64: dts: renesas: r8a774c0: Add CANFD support
      arm64: dts: renesas: r8a774c0: Add clkp2 clock to CAN nodes

Geert Uytterhoeven (2):
      arm64: dts: renesas: r8a77990: ebisu: Add GPIO expander
      arm64: dts: renesas: r8a77990: Fix SPDX license identifier style

Jiada Wang (3):
      arm64: dts: renesas: r8a7796: remove unneeded sound #address/size-cells
      arm64: dts: renesas: r8a77965: add SSIU support for sound
      arm64: dts: renesas: use extended audio dmac register

Kazuya Mizuguchi (1):
      arm64: dts: renesas: r8a77995: draak: Fix EthernetAVB phy mode to rgmii

Laurent Pinchart (3):
      arm64: dts: renesas: r8a77990: ebisu: Enable LVDS1 encoder
      arm64: dts: renesas: r8a77995: draak: Enable LVDS1 encoder
      arm64: dts: renesas: salvator-common: Add GPIO keys support

Magnus Damm (1):
      arm64: dts: renesas: Update Ebisu and Draak bootargs

Marek Vasut (1):
      arm64: dts: renesas: r8a77995: draak: Enable CAN0, CAN1

Niklas Söderlund (2):
      arm64: dts: renesas: r8a774c0: Remove invalid compatible value for CSI40
      arm64: dts: renesas: r8a77990: Remove invalid compatible value for CSI40

Simon Horman (1):
      arm64: dts: renesas: ebisu: Add PMIC DDR0 Backup Power config

Takeshi Kihara (4):
      arm64: dts: renesas: ebisu: Fix adv7482 hexadecimal register address
      arm64: dts: renesas: ebisu: Enable VIN5
      arm64: dts: renesas: r8a77990-ebisu: Add BD9571 PMIC
      arm64: dts: renesas: salvator-common: Sort node label

 arch/arm64/boot/dts/renesas/cat875.dtsi            |  22 ++
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |  12 +-
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts    |  47 ++++
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |  44 +++-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |   2 +-
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts |   1 +
 .../arm64/boot/dts/renesas/r8a7796-salvator-xs.dts |   1 +
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           |  13 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          | 253 +++++++++++++++++++--
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts     |  53 ++++-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |   4 +-
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts     |  32 ++-
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |  73 +++++-
 13 files changed, 499 insertions(+), 58 deletions(-)

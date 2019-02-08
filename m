Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0573FC282CB
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:13:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C768C20863
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:13:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="fn9wA+Ji"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbfBHLNZ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 06:13:25 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:46178 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbfBHLNZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 06:13:25 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 57B1C25B7CA;
        Fri,  8 Feb 2019 22:13:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549624402; bh=NIsI7rcLOeCXQs40evx+v+/+vWh2PFyjQnM/qD4zA+4=;
        h=From:To:Cc:Subject:Date:From;
        b=fn9wA+JiqF/K5I+7RPnnP7G2MeRZYN5vxbI4ulSeuHMrjiLdGzoR1Ngi1WyklFYRC
         1ycVjCqnKRgVm8ReRUAOyAwg5xtfoFDeDZDnWJ45zXf5zKNncvC+L2yfJ4mfRv5TI/
         nfl5Pj3focsEbmTO7TTNAHlsMLUl8chgAlLHyO+g=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id A6EC89401DB; Fri,  8 Feb 2019 12:13:20 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     arm@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Second Round of Renesas ARM64 Based SoC DT Updates for v5.1
Date:   Fri,  8 Feb 2019 12:13:18 +0100
Message-Id: <cover.1549623801.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these second round of Renesas ARM64 based SoC DT updates for v5.1.

This pull request is based on the previous round of
such requests, tagged as renesas-arm64-dt-for-v5.1,
which you have already pulled.


The following changes since commit 3e279a1d44d73aea9ce428ae68e76bf85117031a:

  arm64: dts: renesas: r8a77990: ebisu: Enable HS400 of SDHI3 (2019-01-23 09:45:41 +0100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-dt2-for-v5.1

for you to fetch changes up to ee20aeefb53f6ffabed5b1a3b859294197eeb351:

  arm64: dts: renesas: cat875: Enable PCIe support (2019-02-08 11:49:09 +0100)

----------------------------------------------------------------
Second Round of Renesas ARM64 Based SoC DT Updates for v5.1

* R-Car Gen3 SoC based Salvator-X, Salvator-XS and ULCB boards
  - Enable HS400 support for eMMC

* R-Car E3 (r7a77990) SoC
  - Add OPPs table for cpu devices

* RZ/G2E (r8a774c0) SoC
  - Describe TMU, CMT, SDHI devices in DT
  - Describe pincontrol support for SCIF2 device in DT
  - Add OPPs table for cpu devices

* RZ/G2E (r8a774c0) based EK874 board and CAT875 sub-board,
  and CAT874 board
  - Initial support

----------------------------------------------------------------
Biju Das (9):
      arm64: dts: renesas: Add Si-Linux CAT874 board support
      arm64: dts: renesas: Add Si-Linux EK874 board support
      arm64: dts: renesas: r8a774c0-cat874: Add pincontrol support to scif2
      arm64: dts: renesas: r8a774c0-cat874: Add uSD support
      arm64: dts: renesas: cat875: Add ethernet support
      arm64: dts: renesas: r8a774c0: Add CMT device nodes
      arm64: dts: renesas: r8a774c0: Add TMU device nodes
      arm64: dts: renesas: r8a774c0-cat874: Add pciec0 support
      arm64: dts: renesas: cat875: Enable PCIe support

Fabrizio Castro (1):
      arm64: dts: renesas: r8a774c0: Add OPPs table for cpu devices

Niklas Söderlund (1):
      arm64: dts: renesas: enable HS400 on R-Car Gen3

Takeshi Kihara (1):
      arm64: dts: renesas: r8a77990: Add OPPs table for cpu devices

 arch/arm64/boot/dts/renesas/Makefile             |   1 +
 arch/arm64/boot/dts/renesas/cat875.dtsi          |  44 +++++++
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts  | 106 +++++++++++++++
 arch/arm64/boot/dts/renesas/r8a774c0-ek874.dts   |  14 ++
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi        | 160 +++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi        |  25 ++++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi |   1 +
 arch/arm64/boot/dts/renesas/ulcb.dtsi            |   1 +
 8 files changed, 352 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/cat875.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774c0-ek874.dts

Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5562CC169C4
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:14:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2419520863
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:14:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="kuLhy2PW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbfBHLOQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 06:14:16 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:46367 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbfBHLOQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 06:14:16 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id BF3DE25B7CA;
        Fri,  8 Feb 2019 22:14:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549624455; bh=imn+WZsUZRNk6sYvlVT7Yk3vyq4gtILb2LyFB6IUeBU=;
        h=From:To:Cc:Subject:Date:From;
        b=kuLhy2PW7V2NWLg92NYAnTuQPsXhltzH3pbIHXIpPtelMu1v66dqQPd2HQRuy5VPF
         z/wXoxqw8SADSzcZD+pIaIWfLYywARNDm22IgEd3q7tg8xBM11DtUYovppDK5lZlAB
         oGqPZi9FVDaV3Sjn59fvfzV44hT58rMfFGWb2Toc=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 226BE9401DB; Fri,  8 Feb 2019 12:14:13 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     arm@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC DT Updates for v5.1
Date:   Fri,  8 Feb 2019 12:14:08 +0100
Message-Id: <cover.1549623128.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC DT updates for v5.1.


The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm-dt-for-v5.1

for you to fetch changes up to 1feef0ac19a8376d36909af677b531b21bc92bb7:

  ARM: dts: r8a7744: Add LVDS support (2019-02-08 11:48:38 +0100)

----------------------------------------------------------------
Renesas ARM Based SoC DT Updates for v5.1

* R-Car H2 (r8a7790) based Stout board
  - Convert to new LVDS DT bindings

* R-Car H1 (r8a7779) and M1A (r8a7778) SoCs
  - Describe HSCIF0/1 devices in DT

* RZ/G1M (r8a7743) SoC
  - Correct sort order of the RWDT node
  - Remove aliases: should be defined in board rather than SoC DT if needed
  - Remove generic compatible string from iic3: it is not compatible

* RZ/G1N (r8a7744) SoC
  - Describe LVDS and DU devices in DT
  - Correct sort order of VSP and MSIOF noces

* RZ/G1C (r8a7747) based iWave SBC
  - Enable RTC

* RZ/A2M (r7s9210) SoC and EVB
  - Initial support

----------------------------------------------------------------
Biju Das (7):
      ARM: dts: iwg23s-sbc: Enable RTC
      ARM: dts: r8a7744: Fix sorting of vsp and msiof nodes
      ARM: dts: r8a7743: Remove generic compatible string from iic3
      ARM: dts: r8a7743: Remove aliases from SoC dtsi
      ARM: dts: r8a7743: Fix sorting of rwdt node
      ARM: dts: r8a7744: Add DU support
      ARM: dts: r8a7744: Add LVDS support

Chris Brandt (2):
      ARM: dts: r7s9210: Initial SoC device tree
      ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M EVB

Geert Uytterhoeven (1):
      ARM: dts: stout: Convert to new LVDS DT bindings

Ulrich Hecht (2):
      ARM: dts: r8a7778: Add HSCIF0/1 support
      ARM: dts: r8a7779: Add HSCIF0/1 device nodes

 arch/arm/boot/dts/Makefile                |   1 +
 arch/arm/boot/dts/r7s9210-rza2mevb.dts    |  82 +++++++++++
 arch/arm/boot/dts/r7s9210.dtsi            | 218 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/r8a7743.dtsi            |  43 ++----
 arch/arm/boot/dts/r8a7744.dtsi            | 188 +++++++++++++++-----------
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts |  18 +++
 arch/arm/boot/dts/r8a7778.dtsi            |  28 ++++
 arch/arm/boot/dts/r8a7779.dtsi            |  26 ++++
 arch/arm/boot/dts/r8a7790-stout.dts       |  15 +-
 include/dt-bindings/clock/r8a7778-clock.h |   2 +
 10 files changed, 508 insertions(+), 113 deletions(-)
 create mode 100644 arch/arm/boot/dts/r7s9210-rza2mevb.dts
 create mode 100644 arch/arm/boot/dts/r7s9210.dtsi

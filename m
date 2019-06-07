Return-Path: <SRS0=GULD=UG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E7D9C28CC3
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  7 Jun 2019 07:18:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1DFFF208C0
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  7 Jun 2019 07:18:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727505AbfFGHSi (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 7 Jun 2019 03:18:38 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:24576 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726699AbfFGHSi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Jun 2019 03:18:38 -0400
X-IronPort-AV: E=Sophos;i="5.60,562,1549897200"; 
   d="scan'208";a="18060383"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 07 Jun 2019 16:18:36 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7C64241FE039;
        Fri,  7 Jun 2019 16:18:34 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 0/3] Add PCIe support for HiHope RZ/G2M platform
Date:   Fri,  7 Jun 2019 08:13:56 +0100
Message-Id: <1559891639-62529-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series adds PCIe[01] support for HiHope RZ/G2M with sub board.

This patchset is based on renesas-dev branch.

Biju Das (3):
  arm64: dts: renesas: r8a774a1: Add PCIe device nodes
  arm64: dts: renesas: hihope-common: Declare pcie bus clock
  arm64: dts: renesas: hihope-rzg2-ex: Enable PCIe support

 arch/arm64/boot/dts/renesas/hihope-common.dtsi  |  4 ++
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi |  8 ++++
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi       | 54 +++++++++++++++++++++++++
 3 files changed, 66 insertions(+)

-- 
2.7.4


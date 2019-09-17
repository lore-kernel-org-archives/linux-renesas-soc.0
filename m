Return-Path: <SRS0=L50G=XM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D156EC4CECD
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 17 Sep 2019 13:12:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B1BD32171F
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 17 Sep 2019 13:12:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728173AbfIQNM0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 17 Sep 2019 09:12:26 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:21221 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726308AbfIQNM0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Sep 2019 09:12:26 -0400
X-IronPort-AV: E=Sophos;i="5.64,516,1559487600"; 
   d="scan'208";a="26795087"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 17 Sep 2019 22:12:24 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6D0894000AAE;
        Tue, 17 Sep 2019 22:12:22 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 0/4] Add HiHope RZ/G2N main board support
Date:   Tue, 17 Sep 2019 14:05:26 +0100
Message-Id: <1568725530-55241-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series add basic support for the HiHope RZ/G2N main board

Biju Das (4):
  arm64: dts: renesas: Initial r8a774b1 SoC device tree
  arm64: defconfig: enable R8A774B1 SoC
  arm64: renesas_defconfig: enable R8A774B1 SoC
  arm64: dts: renesas: Add HiHope RZ/G2N main board support

 arch/arm64/boot/dts/renesas/Makefile               |   1 +
 .../boot/dts/renesas/r8a774b1-hihope-rzg2n.dts     |  26 ++
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          | 472 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 arch/arm64/configs/renesas_defconfig               |   1 +
 5 files changed, 501 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774b1.dtsi

-- 
2.7.4


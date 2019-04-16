Return-Path: <SRS0=apzE=SS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B46C10F13
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 16 Apr 2019 15:38:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7E7F820872
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 16 Apr 2019 15:38:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbfDPPil (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 16 Apr 2019 11:38:41 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:15998 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726751AbfDPPil (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Apr 2019 11:38:41 -0400
X-IronPort-AV: E=Sophos;i="5.60,358,1549897200"; 
   d="scan'208";a="13438245"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Apr 2019 00:38:39 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id AB5494012056;
        Wed, 17 Apr 2019 00:38:36 +0900 (JST)
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
Subject: [PATCH 0/6] Add more support to RZ/G2M SoC
Date:   Tue, 16 Apr 2019 16:31:51 +0100
Message-Id: <1555428717-18376-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This series adds RZ/G2M SoC dtsi support for DU, VSP, FDP,
and Tie SYS-DMAC, Audio-DMAC, Ethernet AVB to IPMMU.

This patchset is based on renesas dev branch.

Biju Das (6):
  arm64: dts: r8a774a1: Add VSP instances
  arm64: dts: r8a774a1: Add DU device to DT
  arm64: dts: renesas: r8a774a1: Add FDP1 instance
  arm64: dts: renesas: r8a774a1: Tie SYS-DMAC to IPMMU-DS0/1
  arm64: dts: renesas: r8a774a1: Tie Audio-DMAC to IPMMU-MP
  arm64: dts: renesas: r8a774a1: Connect Ethernet-AVB to IPMMU-DS0

 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 169 ++++++++++++++++++++++++++++++
 1 file changed, 169 insertions(+)

-- 
2.7.4


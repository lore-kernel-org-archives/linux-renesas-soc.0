Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 111FBC4320A
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 14 Aug 2021 13:55:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E319A60F51
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 14 Aug 2021 13:55:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238547AbhHNN4A (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 14 Aug 2021 09:56:00 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:23701 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S234353AbhHNN4A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 14 Aug 2021 09:56:00 -0400
X-IronPort-AV: E=Sophos;i="5.84,321,1620658800"; 
   d="scan'208";a="90627089"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 14 Aug 2021 22:55:30 +0900
Received: from localhost.localdomain (unknown [10.226.92.7])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id CC9084272039;
        Sat, 14 Aug 2021 22:55:28 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] Add RZ/G2L Sound support
Date:   Sat, 14 Aug 2021 14:55:24 +0100
Message-Id: <20210814135526.15561-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add RZ/G2L sound support by adding
SSIF and audio clock nodes to SoC dtsi.

Currently SSI interrupt support is added in SoC dtsi, later will add DMA
support, once DMA patches accepted in mainline.

This patches are tested(audio playback/record) with renesas-devel and is based upon[1] & [2]

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20210812151808.7916-3-biju.das.jz@bp.renesas.com/
[2] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20210812151808.7916-4-biju.das.jz@bp.renesas.com/

Biju Das (2):
  arm64: dts: renesas: r9a07g044: Add external audio clock nodes
  arm64: dts: renesas: r9a07g044: Add SSI support

 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)

-- 
2.17.1


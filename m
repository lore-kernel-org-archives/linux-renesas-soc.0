Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB25FC636C9
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 19 Jul 2021 13:40:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5E9661006
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 19 Jul 2021 13:40:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239265AbhGSNAO (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 19 Jul 2021 09:00:14 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:32998 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S239258AbhGSNAM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jul 2021 09:00:12 -0400
X-IronPort-AV: E=Sophos;i="5.84,252,1620658800"; 
   d="scan'208";a="88135498"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 19 Jul 2021 22:40:47 +0900
Received: from localhost.localdomain (unknown [10.226.92.148])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0388F425839B;
        Mon, 19 Jul 2021 22:40:42 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/8] Add RZ/G2L Sound support
Date:   Mon, 19 Jul 2021 14:40:32 +0100
Message-Id: <20210719134040.7964-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add ASoC support on RZ/G2L SoC's.

It is based on the work done by Chris Brandt for RZ/A ASoC driver.

Biju Das (8):
  ASoC: dt-bindings: Document RZ/G2L bindings
  sound: soc: sh: Add RZ/G2L SSIF-2 driver
  arm64: dts: renesas: r9a07g044: Add external audio clock nodes
  arm64: dts: renesas: r9a07g044: Add SSI support
  arm64: defconfig: Enable ASoC sound support for RZ/G2L SoC
  ASoC: dt-bindings: sound: renesas,rz-ssi: Document DMA support
  sound: sh: rz-ssi: Add SSI DMAC support
  arm64: dts: renesas: r9a07g044: Add SSI DMA support

 .../bindings/sound/renesas,rz-ssi.yaml        |  100 ++
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    |  105 ++
 arch/arm64/configs/defconfig                  |    1 +
 sound/soc/sh/Kconfig                          |   10 +
 sound/soc/sh/Makefile                         |    4 +
 sound/soc/sh/rz-ssi.c                         | 1078 +++++++++++++++++
 6 files changed, 1298 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
 create mode 100644 sound/soc/sh/rz-ssi.c

-- 
2.17.1


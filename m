Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 833DFC4338F
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 29 Jul 2021 17:23:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B5A360F42
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 29 Jul 2021 17:23:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbhG2RXW (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 29 Jul 2021 13:23:22 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:37849 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229556AbhG2RXV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Jul 2021 13:23:21 -0400
X-IronPort-AV: E=Sophos;i="5.84,279,1620658800"; 
   d="scan'208";a="89179387"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 30 Jul 2021 02:23:17 +0900
Received: from localhost.localdomain (unknown [10.226.92.2])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B76AA40083F2;
        Fri, 30 Jul 2021 02:23:13 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        alsa-devel@alsa-project.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 0/3] Add RZ/G2L Sound support
Date:   Thu, 29 Jul 2021 18:23:08 +0100
Message-Id: <20210729172311.31111-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add ASoC support on RZ/G2L SoC's.

It is based on the work done by Chris Brandt for RZ/A ASoC driver.

v2->v3:
 * Fixed the dependency on KCONFIG
 * Merged the binding patch with dma feature added
 * Updated dt binding example with encoded #dma-cells value.
 * Improved Error handling in probe function
 * Removed the passing legacy channel configuration parameters from dmaengine_slave_config function
 * started using dma_request_chan instead of deprecated dma_request_slave_channel
 * Removed SoC dtsi and config patches from this series. Will send it later.
v1->v2:
 * Rebased to latest rc kernel

Biju Das (3):
  ASoC: dt-bindings: Document RZ/G2L bindings
  sound: soc: sh: Add RZ/G2L SSIF-2 driver
  sound: sh: rz-ssi: Add SSI DMAC support

 .../bindings/sound/renesas,rz-ssi.yaml        |  100 ++
 sound/soc/sh/Kconfig                          |    9 +
 sound/soc/sh/Makefile                         |    4 +
 sound/soc/sh/rz-ssi.c                         | 1062 +++++++++++++++++
 4 files changed, 1175 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
 create mode 100644 sound/soc/sh/rz-ssi.c

-- 
2.17.1


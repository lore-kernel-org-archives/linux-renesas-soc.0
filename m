Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:37455 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S935029AbdLRSYt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Dec 2017 13:24:49 -0500
From: Biju Das <biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 0/5] Add sound support
Date: Mon, 18 Dec 2017 18:22:36 +0000
Message-Id: <1513621361-10944-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This series aims to add sound support for iWave RZ/G1M board.

This patch series has below dependency
1)https://patchwork.kernel.org/patch/10108041/

Biju Das (5):
  ARM: dts: iwg20d-q7-common: Sound PIO support
  ARM: dts: iwg20d-q7-common: Sound DMA support on DTS
  ARM: dts: iwg20d-q7-common: Sound DMA support via BUSIF on DTS
  ARM: dts: iwg20d-q7-common: Sound DMA support via SRC on DTS
  ARM: dts: iwg20d-q7-common: Sound DMA support via DVC on DTS

 arch/arm/boot/dts/iwg20d-q7-common.dtsi | 64 +++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

-- 
1.9.1

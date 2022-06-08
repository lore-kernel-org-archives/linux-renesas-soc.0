Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2790C43334
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  8 Jun 2022 17:30:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbiFHRam (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 8 Jun 2022 13:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231175AbiFHRah (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jun 2022 13:30:37 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C7650B9;
        Wed,  8 Jun 2022 10:30:33 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,286,1647270000"; 
   d="scan'208";a="122304135"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 09 Jun 2022 02:30:33 +0900
Received: from localhost.localdomain (unknown [10.226.92.52])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B970440CE62B;
        Thu,  9 Jun 2022 02:30:29 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] Enable ADC, RSPI1
Date:   Wed,  8 Jun 2022 18:30:23 +0100
Message-Id: <20220608173025.22792-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to enable ADC and RSPI1 on RZ/G2UL SMARC EVK.

Biju Das (2):
  arm64: dts: renesas: rzg2ul-smarc: Enable RSPI1 on carrier board
  arm64: dts: renesas: rzg2ul-smarc-som: Enable ADC on SMARC platform

 .../boot/dts/renesas/r9a07g043u11-smarc.dts   |  6 ------
 .../boot/dts/renesas/rzg2ul-smarc-som.dtsi    | 19 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi |  6 ++++++
 3 files changed, 25 insertions(+), 6 deletions(-)

-- 
2.25.1


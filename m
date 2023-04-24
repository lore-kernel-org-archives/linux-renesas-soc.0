Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A899C7618E
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 24 Apr 2023 16:39:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231728AbjDXQjP (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 24 Apr 2023 12:39:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231694AbjDXQjP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Apr 2023 12:39:15 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B7D647EC6;
        Mon, 24 Apr 2023 09:39:13 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,223,1677510000"; 
   d="scan'208";a="160554391"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 25 Apr 2023 01:39:13 +0900
Received: from localhost.localdomain (unknown [10.226.92.191])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id A60D74021FBD;
        Tue, 25 Apr 2023 01:39:10 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v8 0/4] Enable RZ/{G2L,G2LC} and RZ/V2L DU
Date:   Mon, 24 Apr 2023 17:39:04 +0100
Message-Id: <20230424163908.137535-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable DU on RZ/{G2L,G2LC} and RZ/V2L SMARC EVK.

This patch series depend upon [1]
[1] https://lore.kernel.org/linux-renesas-soc/20230424161024.136316-1-biju.das.jz@bp.renesas.com/T/#t

v7->v8:
 * Added Rb tags from Geert for patch#1 and patch#2
 * Added RZ/G2L fallback for RZ/V2L DU node.
v7:
 * Added dtsi patches for DU.

Biju Das (4):
  arm64: dts: renesas: r9a07g044: Add DU node
  arm64: dts: renesas: r9a07g054: Add DU node
  arm64: dts: renesas: rzg2l-smarc: Enable DU and link with DSI
  arm64: dts: renesas: rzg2lc-smarc: Enable DU and link with DSI

 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    | 14 +++++++++++++
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi    | 15 +++++++++++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  | 21 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi | 21 +++++++++++++++++++
 4 files changed, 71 insertions(+)

-- 
2.25.1


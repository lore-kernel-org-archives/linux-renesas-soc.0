Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE7BC433F5
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Apr 2022 16:19:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349886AbiD1QW4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 28 Apr 2022 12:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349882AbiD1QWz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 12:22:55 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5CC305C85E;
        Thu, 28 Apr 2022 09:19:40 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,295,1647270000"; 
   d="scan'208";a="118337578"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 29 Apr 2022 01:19:38 +0900
Received: from localhost.localdomain (unknown [10.226.92.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3F0C04008542;
        Fri, 29 Apr 2022 01:19:34 +0900 (JST)
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
Subject: [PATCH v2 0/3] Add Audio and USB support
Date:   Thu, 28 Apr 2022 17:19:29 +0100
Message-Id: <20220428161932.20370-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add support for Audio and USB on RZ/G2UL SMARC EVK.

This patch series depend upon [1]
[1] https://lore.kernel.org/linux-renesas-soc/20220425095244.156720-1-biju.das.jz@bp.renesas.com/T/#t

v1>v2:
 * Dropped patches except patch8,9 and 10 as others are queued for 5.19.
 * Fixed commit description
 * started using cpu_dai node instead of snd_rzg2l in board dtsi.
 * Fixed the code comment related to USB1 OVC and VBUS.

Biju Das (3):
  arm64: dts: renesas: rzg2l-smarc: Move ssi0 and cpu sound_dai nodes
    from common dtsi
  arm64: dts: renesas: rzg2ul-smarc: Enable Audio
  arm64: dts: renesas: rzg2ul-smarc: Enable USB2.0 support

 .../boot/dts/renesas/r9a07g043u11-smarc.dts   | 52 -------------------
 .../boot/dts/renesas/rz-smarc-common.dtsi     |  8 ---
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  | 11 ++++
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi | 11 ++++
 .../dts/renesas/rzg2ul-smarc-pinfunction.dtsi | 18 +++++++
 arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi | 23 ++++++++
 6 files changed, 63 insertions(+), 60 deletions(-)

-- 
2.25.1


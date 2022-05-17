Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0947FC433FE
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 17 May 2022 08:18:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231271AbiEQISm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 17 May 2022 04:18:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242844AbiEQIR1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 May 2022 04:17:27 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6508D4506C;
        Tue, 17 May 2022 01:17:04 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,232,1647270000"; 
   d="scan'208";a="121232018"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 17 May 2022 17:17:03 +0900
Received: from localhost.localdomain (unknown [10.226.92.244])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 72FEF4006DF1;
        Tue, 17 May 2022 17:17:01 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] Add Ethernet to RZ/V2M 
Date:   Tue, 17 May 2022 09:16:43 +0100
Message-Id: <20220517081645.3764-1-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add Ethernet to the RZ/V2M SoC (r9a09g011) and the RZ/V2M EVK board.

v2:
 - Fix interrupt names

Phil Edworthy (2):
  arm64: dts: renesas: r9a09g011: Add ethernet nodes
  arm64: dts: renesas: rzv2m evk: Enable ethernet

 .../boot/dts/renesas/r9a09g011-v2mevk2.dts    | 14 +++++
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi    | 51 +++++++++++++++++++
 2 files changed, 65 insertions(+)

-- 
2.34.1


Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C995C4332F
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  3 Nov 2022 23:07:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbiKCXHl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 3 Nov 2022 19:07:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbiKCXHG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Nov 2022 19:07:06 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2838B201A0;
        Thu,  3 Nov 2022 16:07:00 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.96,135,1665414000"; 
   d="scan'208";a="138901807"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 04 Nov 2022 08:07:00 +0900
Received: from mulinux.home (unknown [10.226.92.174])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 16E274004CFE;
        Fri,  4 Nov 2022 08:06:55 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH 0/3] Minor fixes for RZ/V2M
Date:   Thu,  3 Nov 2022 23:06:45 +0000
Message-Id: <20221103230648.53748-1-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear All,

this series aims at improving a couple of couple of things
found in r9a09g011.dtsi:
* unit address error for the gic node
* SoC specific compatible string for I2C nodes

Since it's early days for r9a09g011.dtsi, and compatible
renesas,i2c-r9a09g011 isn't being actively used at the moment,
I think it's safe to change to make compatible strings less
confusing.

Thanks,
Fab

Fabrizio Castro (3):
  arm64: dts: renesas: r9a09g011: Fix unit address format error
  dt-bindings: i2c: renesas,rzv2m: Fix SoC specific string
  arm64: dts: renesas: r9a09g011: Fix I2C SoC specific strings

 Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml | 4 ++--
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi               | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.34.1


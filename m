Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:6846 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727037AbeHQR4x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Aug 2018 13:56:53 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add Thermal compatibility for r8a774a1
Date: Fri, 17 Aug 2018 15:53:02 +0100
Message-Id: <1534517584-14434-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Dear All,

this series adds Thermal compatibility for RZ/G2M (a.k.a. R8A774A1).

Cheers,
Fab

Fabrizio Castro (2):
  thermal: rcar_gen3_thermal: Add r8a774a1 support
  dt-bindings: thermal: rcar-gen3-thermal: Add r8a774a1 support

 Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt | 1 +
 drivers/thermal/rcar_gen3_thermal.c                             | 1 +
 2 files changed, 2 insertions(+)

-- 
2.7.4

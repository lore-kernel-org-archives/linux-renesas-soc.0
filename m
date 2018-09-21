Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:43176 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389545AbeIUX6j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Sep 2018 19:58:39 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 0/5] Add Du support to RZ/G1C and RZ/G1N
Date: Fri, 21 Sep 2018 19:08:26 +0100
Message-Id: <1537553311-8831-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Dear All,

this series documents and adds driver support for the DUs found
inside RZ/G1C (a.k.a. R8A77470) and RZ/G1N (a.k.a. R8A7744).
Also, this series enables the SII902X driver as the SiI9022ACNU
HDMI transmitter is found on the iwg23s.

Thanks,
Fab

Biju Das (2):
  dt-bindings: display: renesas: du: Document the r8a7744 bindings
  drm: rcar-du: Add R8A7744 support

Fabrizio Castro (3):
  dt-bindings: display: renesas: du: Document the r8a77470 bindings
  drm: rcar-du: Add r8a77470 support
  ARM: shmobile: defconfig: Enable SII902X

 .../devicetree/bindings/display/renesas,du.txt     |  4 ++++
 arch/arm/configs/shmobile_defconfig                |  1 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              | 27 ++++++++++++++++++++++
 3 files changed, 32 insertions(+)

-- 
2.7.4

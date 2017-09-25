Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:64843 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S932395AbdIYIyk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Sep 2017 04:54:40 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 0/2] spi: sh-msiof: Add r8a774[35] bindings
Date: Mon, 25 Sep 2017 09:54:18 +0100
Message-Id: <1506329660-4064-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This series adds compatible strings and device tree bindings in order to enable
msiof support for r8a7743 and r8a7745.

Fabrizio Castro (2):
  spi: sh-msiof: Add compatible strings for r8a774[35]
  dt-bindings: spi: sh-msiof: Add r8a774[35] to the compatible list

 Documentation/devicetree/bindings/spi/sh-msiof.txt | 6 ++++--
 drivers/spi/spi-sh-msiof.c                         | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.7.4

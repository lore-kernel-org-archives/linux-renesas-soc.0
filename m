Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:42961 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726463AbeGLDJe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jul 2018 23:09:34 -0400
From: Chris Brandt <chris.brandt@renesas.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 0/2] ARM: shmobile: Add support for RZ/A2
Date: Wed, 11 Jul 2018 22:01:47 -0500
Message-Id: <20180712030149.91385-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Introduce RZ/A2 (R7S9210) as an SoC that can be selected.


Chris Brandt (2):
  ARM: shmobile: Add basic RZ/A2 SoC support
  dt-bindings: arm: Document RZ/A2 SoC DT bindings

 Documentation/devicetree/bindings/arm/shmobile.txt |  2 ++
 arch/arm/mach-shmobile/Kconfig                     |  6 +++++
 arch/arm/mach-shmobile/Makefile                    |  1 +
 arch/arm/mach-shmobile/setup-r7s9210.c             | 27 ++++++++++++++++++++++
 4 files changed, 36 insertions(+)
 create mode 100644 arch/arm/mach-shmobile/setup-r7s9210.c

-- 
2.16.1

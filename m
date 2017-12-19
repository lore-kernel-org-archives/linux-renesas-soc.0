Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:9853 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1763056AbdLSNfI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Dec 2017 08:35:08 -0500
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>, linux-pwm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v3 0/5] Add PWM and TPU support to r8a7743
Date: Tue, 19 Dec 2017 13:34:55 +0000
Message-Id: <1513690500-12165-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Dear All,

this series includes all that is required to add PWM and TPU SoC specific
support for the r8a7743.

Thanks,

Fabrizio Castro (5):
  ARM: shmobile: defconfig: Enable PWM
  dt-bindings: pwm: rcar: Document r8a774[35] PWM bindings
  ARM: dts: r8a7743: Add PWM SoC support
  dt-bindings: pwm: renesas-tpu: Document r8a774[35] support
  ARM: dts: r8a7743: Add TPU support

 .../devicetree/bindings/pwm/renesas,pwm-rcar.txt   | 10 ++-
 .../devicetree/bindings/pwm/renesas,tpu-pwm.txt    |  4 +-
 arch/arm/boot/dts/r8a7743.dtsi                     | 80 ++++++++++++++++++++++
 arch/arm/configs/shmobile_defconfig                |  1 +
 4 files changed, 91 insertions(+), 4 deletions(-)

-- 
2.7.4

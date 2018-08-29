Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:59656 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727877AbeH2R1P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Aug 2018 13:27:15 -0400
From: Chris Brandt <chris.brandt@renesas.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 0/2] clocksource: ostm: Add support for RZ/A2
Date: Wed, 29 Aug 2018 08:29:52 -0500
Message-Id: <20180829132954.64862-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Modify the driver to take into accound clock drivers that are not 100% DT,
and also update the binding documentation.

Chris Brandt (2):
  clocksource/drivers/ostm: Delay driver registration
  dt-bindings: timer: ostm: Add R7S9210 support

 .../devicetree/bindings/timer/renesas,ostm.txt     |  3 +-
 drivers/clocksource/renesas-ostm.c                 | 35 ++++++++++++++++++++--
 2 files changed, 35 insertions(+), 3 deletions(-)

-- 
2.16.1

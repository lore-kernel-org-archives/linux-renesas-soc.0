Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48186 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750883AbeEBJ6O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 May 2018 05:58:14 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>, linux-pm@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 0/2] Revert explicit support for Renesas R-Car Gen 3 r8a779[56] SoCs
Date: Wed,  2 May 2018 11:58:04 +0200
Message-Id: <20180502095806.30341-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Revert commits that added explicit support for Renesas R-Car Gen 3
r8a779[56] SoCs to the generic cpufreq driver.

This is no longer needed since the flowing commit and to the best of my
knowledge is not relied on by any upstream DTS: edeec420de24 ("cpufreq:
dt-platdev: Automatically create cpufreq device with OPP v2")

Simon Horman (2):
  Revert "cpufreq: dt: Add r8a7796 support to to use generic cpufreq
    driver"
  Revert "cpufreq: rcar: Add support for R8A7795 SoC"

 drivers/cpufreq/cpufreq-dt-platdev.c | 2 --
 1 file changed, 2 deletions(-)

-- 
2.11.0

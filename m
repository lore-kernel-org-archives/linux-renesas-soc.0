Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52904 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752929AbeAZJgw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Jan 2018 04:36:52 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 0/3] ARM: dts: renesas: consistently use single space before =
Date: Fri, 26 Jan 2018 10:36:32 +0100
Message-Id: <20180126093635.16945-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Consistently use a single space before a =.

This series fixes instances where a tab is used instead.

This is part of an ongoing effort to improve consistency within and between
the DT of Renesas SoCs to allow for easier comparison and maintenance.

This series should not introduce any functional change.

Based on renesas-devel-20180123-v4.15-rc9

Simon Horman (3):
  ARM: dts: r8a7790: consistently use single space before =
  ARM: dts: r8a7791: consistently use single space before =
  ARM: dts: r8a7793: consistently use single space before =

 arch/arm/boot/dts/r8a7790.dtsi | 10 +++++-----
 arch/arm/boot/dts/r8a7791.dtsi | 10 +++++-----
 arch/arm/boot/dts/r8a7793.dtsi | 10 +++++-----
 3 files changed, 15 insertions(+), 15 deletions(-)

-- 
2.11.0

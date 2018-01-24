Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:42485 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S934021AbeAXQOw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jan 2018 11:14:52 -0500
From: Biju Das <biju.das@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH  0/2] Add VSP support for r8a774[35]
Date: Wed, 24 Jan 2018 16:11:50 +0000
Message-Id: <1516810312-2100-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch series aims to add VSP support for r8a774[35] SoC.

It is tested with VSP unit tests available in the below git

git://git.ideasonboard.com/renesas/vsp-tests.git

It is tested against renesas-devel-20180122-v4.15-rc9

This patch depend on

https://patchwork.kernel.org/patch/10182757/ 

https://patchwork.kernel.org/patch/10182755/

Biju Das (2):
  ARM: dts: r8a7743: Add VSP support
  ARM: dts: r8a7745: Add VSP support

 arch/arm/boot/dts/r8a7743.dtsi | 27 +++++++++++++++++++++++++++
 arch/arm/boot/dts/r8a7745.dtsi | 18 ++++++++++++++++++
 2 files changed, 45 insertions(+)

-- 
2.7.4

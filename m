Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:35635 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751641AbdFOHg5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Jun 2017 03:36:57 -0400
Received: from avalon.ideasonboard.com (unknown [IPv6:2001:268:c037:db14:f920:322a:1f4a:5bdb])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 7A89B201F5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jun 2017 09:36:32 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/2] R-Car H3 ES2.0 Salvator-X: Enable DU support in DT
Date: Thu, 15 Jun 2017 10:37:14 +0300
Message-Id: <20170615073716.12395-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This patch series enable DU support in DT for the R-Car H3 ES2.0 Salvator-X
board. Patch 1/2 addresses the SoC side, and patch 2/2 the board side.

The patches are based on top of the topic/r8a7795es2-integration branch from
the renesas-drivers tree.

Laurent Pinchart (2):
  arm64: dts: r8a7795: Add support for the DU
  arm64: dts: r8a7795: salvator-x: Unify DU node between ES1.x and ES2.0

 arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts | 14 --------------
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts     | 14 --------------
 arch/arm64/boot/dts/renesas/r8a7795.dtsi               |  2 ++
 arch/arm64/boot/dts/renesas/salvator-x.dtsi            | 12 ++++++++++++
 4 files changed, 14 insertions(+), 28 deletions(-)

-- 
Regards,

Laurent Pinchart

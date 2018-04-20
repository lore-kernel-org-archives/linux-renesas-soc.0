Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:41158 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754591AbeDTMGV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Apr 2018 08:06:21 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>
Subject: [PATCH v6 0/3] R-Car DU: Fix LVDS output on Gen2 boards
Date: Fri, 20 Apr 2018 14:57:51 +0300
Message-Id: <20180420115754.4136-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This patch series fixes LVDS output support on the Lager, Koelsh, Porter and
Gose boards that broke in v4.17-rc1 due to the combination of the R-Car DU
LVDS driver rework and the DT move of all on-SoC peripherals to a /soc node.

We could handle the problem in the R-Car DU LVDS DT backward compatibility
code, but that fix would only be used for v4.17 as in v4.18 the Gen2 DT will
move to the new LVDS DT bindings. I thus propose merging these three patches
in v4.17 already to fix the problem as this is the simplest solution.

The patches are based on top of v4.17-rc1. Simon, could you please queue them
up as fixes for v4.17 ?

Laurent Pinchart (3):
  ARM: dts: r8a7790: Convert to new LVDS DT bindings
  ARM: dts: r8a7791: Convert to new LVDS DT bindings
  ARM: dts: r8a7793: Convert to new LVDS DT bindings

 arch/arm/boot/dts/r8a7790-lager.dts   | 22 +++++++++---
 arch/arm/boot/dts/r8a7790.dtsi        | 65 ++++++++++++++++++++++++++++++-----
 arch/arm/boot/dts/r8a7791-koelsch.dts | 12 +++++--
 arch/arm/boot/dts/r8a7791-porter.dts  | 16 +++++++--
 arch/arm/boot/dts/r8a7791.dtsi        | 36 +++++++++++++++----
 arch/arm/boot/dts/r8a7793-gose.dts    | 10 ++++--
 arch/arm/boot/dts/r8a7793.dtsi        | 37 ++++++++++++++++----
 7 files changed, 164 insertions(+), 34 deletions(-)

-- 
Regards,

Laurent Pinchart

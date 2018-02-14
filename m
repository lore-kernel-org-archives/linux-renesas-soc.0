Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:46208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S966706AbeBNJzO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Feb 2018 04:55:14 -0500
From: Kieran Bingham <kbingham@kernel.org>
To: linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v3 0/5] arm64: dts: renesas: r8a77995: Add VSP support
Date: Wed, 14 Feb 2018 09:55:03 +0000
Message-Id: <1518602108-1724-1-git-send-email-kbingham@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The r8a77995-d3 platform supports 3 VSP instances. One VSPBS can be used
as a dual-input image blender, while two VSPD instances can be utilised as
part of a display (DU) pipeline.

Add support for these, along with their required FCPV nodes.

During review, Laurent noticed that the r8a7795 and r8a7796 were not mapping
enough register space to handle RPFs with CLUT modules.

The last three patches fix this issue.

v2:
 - Merge FCPV nodes to a single patch
 - Merge VSP nodes to a single patch
 - Fix VSP register map size
 - Add fixes for r8a7795 and r8a7796

v3:
 - Fix VSBB register map size
 - Add r8a7795-es1 vspd3

Kieran Bingham (5):
  arm64: dts: renesas: r8a77995: add FCPV nodes
  arm64: dts: renesas: r8a77995: add VSP instances
  arm64: dts: renesas: r8a7795-es1: Fix register mappings on VSPs
  arm64: dts: renesas: r8a7795: Fix register mappings on VSPs
  arm64: dts: renesas: r8a7796: Fix register mappings on VSPs

 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi |  2 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi     |  6 +--
 arch/arm64/boot/dts/renesas/r8a7796.dtsi     |  6 +--
 arch/arm64/boot/dts/renesas/r8a77995.dtsi    | 57 ++++++++++++++++++++++++++++
 4 files changed, 64 insertions(+), 7 deletions(-)

-- 
2.7.4

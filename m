Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:36976 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965569AbeBMTam (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Feb 2018 14:30:42 -0500
From: Kieran Bingham <kbingham@kernel.org>
To: linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v2 0/4] arm64: dts: renesas: r8a77995: Add VSP support
Date: Tue, 13 Feb 2018 19:30:33 +0000
Message-Id: <1518550237-16753-1-git-send-email-kbingham@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The r8a77995-d3 platform supports 3 VSP instances. One VSPBS can be used
as a dual-input image blender, while two VSPD instances can be utilised as
part of a display (DU) pipeline.

Add support for these, along with their required FCPV nodes.

During review, Laurent noticed that the r8a7795 and r8a7796 were not mapping
enough register space to handle RPFs with CLUT modules.

The last two patches fix this issue.

v2:
 - Merge FCPV nodes to a single patch
 - Merge VSP nodes to a single patch
 - Fix VSP register map size
 - Add fixes for r8a7795 and r8a7796

Kieran Bingham (4):
  arm64: dts: renesas: r8a77995: add FCPV nodes
  arm64: dts: renesas: r8a77995: add VSP instances
  arm64: dts: renesas: r8a7795: Fix register mappings on VSPs
  arm64: dts: renesas: r8a7796: Fix register mappings on VSPs

 arch/arm64/boot/dts/renesas/r8a7795.dtsi  |  6 ++--
 arch/arm64/boot/dts/renesas/r8a7796.dtsi  |  6 ++--
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 57 +++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+), 6 deletions(-)

-- 
2.7.4

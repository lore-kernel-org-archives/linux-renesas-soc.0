Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932815AbeBLWZe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Feb 2018 17:25:34 -0500
From: Kieran Bingham <kbingham@kernel.org>
To: linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 0/4] arm64: dts: renesas: r8a77995: Add VSP support
Date: Mon, 12 Feb 2018 22:25:25 +0000
Message-Id: <1518474330-8713-1-git-send-email-kbingham@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The r8a77995-d3 platform supports 3 VSP instances. One VSPBS can be used
as a dual-input image blender, while two VSPD instances can be utilised as
part of a display (DU) pipeline.

Kieran Bingham (4):
  arm64: dts: renesas: r8a77995: add FCPVB node
  arm64: dts: renesas: r8a77995: add FCPVD nodes
  arm64: dts: renesas: r8a77995: add VSPBS instance
  arm64: dts: renesas: r8a77995: add VSPD instances

 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 57 +++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

-- 
2.7.4

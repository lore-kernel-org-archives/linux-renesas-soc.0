Return-Path: <devicetree-owner@vger.kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH  0/2] Add HDMI support
Date: Wed, 18 Oct 2017 10:33:45 +0100
Message-Id: <1508319227-19679-1-git-send-email-biju.das@bp.renesas.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This series aims to add HDMI support for iWave RZ/G1M (R8A7743) board.
This series has been tested against renesas-dev tag 20171018-v4.14-rc5.

This patch dependency on below patches

[1] dt-bindings: display: rcar-du: Document R8A774[35]DU
    https://patchwork.kernel.org/patch/10005091/
[2] drm: rcar-du: Add R8A7743 support
    https://patchwork.kernel.org/patch/10005093/

Fabrizio Castro (2):
  ARM: dts: r8a7743: Add DU support
  ARM: dts: iwg20d-q7-dbcm-ca: Add HDMI video output

 arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi | 75 ++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/r8a7743.dtsi           | 30 +++++++++++++
 2 files changed, 105 insertions(+)

-- 
1.9.1


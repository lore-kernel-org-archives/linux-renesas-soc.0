Return-Path: <horms@vergenet.net>
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 0/3] ARM, arm64: dts: Use USB3.0 fallback compatibility strings
Date: Thu, 24 Mar 2016 11:01:06 +0900
Message-Id: <1458784869-17829-1-git-send-email-horms+renesas@verge.net.au>
List-ID: <linux-renesas-soc.vger.kernel.org>

Use recently added fallback compatibility strings in r8a779[015] device
trees.

Based on renesas-devel-20160323-v4.5

Simon Horman (3):
  ARM: dts: r8a7790: Use USB3.0 fallback compatibility string
  ARM: dts: r8a7791: Use USB3.0 fallback compatibility string
  arm64: dts: r8a7795: Use USB3.0 fallback compatibility string

 arch/arm/boot/dts/r8a7790.dtsi           | 2 +-
 arch/arm/boot/dts/r8a7791.dtsi           | 2 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.1.4


Simon Horman (3):
  ARM: dts: r8a7790: Use USB3.0 fallback compatibility string
  ARM: dts: r8a7791: Use USB3.0 fallback compatibility string
  arm64: dts: r8a7795: Use USB3.0 fallback compatibility string

 arch/arm/boot/dts/r8a7790.dtsi           | 2 +-
 arch/arm/boot/dts/r8a7791.dtsi           | 2 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.1.4

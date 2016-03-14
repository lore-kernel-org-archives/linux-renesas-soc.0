Return-Path: <horms@vergenet.net>
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 0/2] ARM: dts: r8a7791, r8a7790: use fallback can compatibility string
Date: Mon, 14 Mar 2016 11:13:57 +0900
Message-Id: <1457921639-15017-1-git-send-email-horms+renesas@verge.net.au>
List-ID: <linux-renesas-soc.vger.kernel.org>

Use recently added fallback compatibility string.

Based on renesas-devel-20160311-v4.5-rc7

Simon Horman (2):
  ARM: dts: r8a7791: use fallback can compatibility string
  ARM: dts: r8a7790: use fallback can compatibility string

 arch/arm/boot/dts/r8a7790.dtsi | 4 ++--
 arch/arm/boot/dts/r8a7791.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.1.4

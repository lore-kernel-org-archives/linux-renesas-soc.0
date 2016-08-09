Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51850 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932347AbcHIMTR (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 9 Aug 2016 08:19:17 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 0/2] ARM: dts: alt: add SDHI0 and 1, and MMCIF support
Date: Tue,  9 Aug 2016 14:19:02 +0200
Message-Id: <1470745144-5394-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

this short series enables SDHI 0 and 1, and MMCIF on the r8a7794/Alt board.
The SDHI IP blocks are exposed as SD card slots while the MMCIF block
is wired up to on-board eMMC.

N.B.: I do not currently have physical access to an Alt board but I do
      have remote access which I used to test these patches.

Simon Horman (2):
  ARM: dts: alt: add SDHI0 and 1 support
  ARM: dts: alt: add MMCIF support

 arch/arm/boot/dts/r8a7794-alt.dts | 106 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

-- 
2.7.0.rc3.207.g0ac5344

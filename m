Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41261 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750757AbcFPFYM (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 16 Jun 2016 01:24:12 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 0/2] ARM: defconfig: Enable r8a7792
Date: Thu, 16 Jun 2016 14:23:56 +0900
Message-Id: <1466054638-11326-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable r8a7792 SoC in shmobile and multi_v7 defconfigs.

Based on renesas-devel-20160616-v4.7-rc3

Simon Horman (2):
  ARM: shmobile: defconfig: Enable r8a7792 SoC
  ARM: multi_v7_defconfig: defconfig: Enable r8a7792 SoC

 arch/arm/configs/multi_v7_defconfig | 1 +
 arch/arm/configs/shmobile_defconfig | 1 +
 2 files changed, 2 insertions(+)

-- 
2.1.4

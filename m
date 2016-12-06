Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43188 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751593AbcLFNdV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Dec 2016 08:33:21 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH renesas/devel 0/2]  ARM: Enable r8a774[35] SoCs in defconfigs
Date: Tue,  6 Dec 2016 14:32:51 +0100
Message-Id: <1481031173-18600-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

this short series enables recently added r8a7743 (RZ/G1M) and r8a7745
(RZ/G1E) SoCs in relevant defconfigs.

Based on renesas-devel-20161206-v4.9-rc8

Simon Horman (2):
  ARM: shmobile: defconfig: Enable r8a774[35] SoCs
  ARM: multi_v7_defconfig: Enable r8a774[35] SoCs

 arch/arm/configs/multi_v7_defconfig | 2 ++
 arch/arm/configs/shmobile_defconfig | 2 ++
 2 files changed, 4 insertions(+)

-- 
2.7.0.rc3.207.g0ac5344

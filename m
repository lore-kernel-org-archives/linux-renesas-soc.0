Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-3.sys.kth.se ([130.237.48.192]:53971 "EHLO
        smtp-3.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753725AbcKRPBE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 10:01:04 -0500
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] ARM: shmobile: defconfig: Enable HDMI input
Date: Fri, 18 Nov 2016 16:00:43 +0100
Message-Id: <20161118150045.26492-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

Now that the DT updates for HDMI in are in renesas-drivers I think it's 
a good time to enable the configuration needed to use HDMI input with 
shmobile_defconifg.

Niklas Söderlund (2):
  ARM: shmobile: defconfig: Enable CONFIG_VIDEO_ADV7604
  ARM: shmobile: defconfig: Enable CMA for DMA

 arch/arm/configs/shmobile_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.10.2

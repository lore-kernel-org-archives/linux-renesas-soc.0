Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:49686 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753982AbcHSCjr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Aug 2016 22:39:47 -0400
Received: from localhost.localdomain (227.178-201-80.adsl-dyn.isp.belgacom.be [80.201.178.227])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id A811520006
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Aug 2016 18:03:32 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH/HACK 0/7] r8a779[01]: Enable IOMMU usage for the VSP1 and DU
Date: Thu, 18 Aug 2016 19:03:53 +0300
Message-Id: <1471536240-25082-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This patch series enables IOMMU usage for the VSP1 and DU on the R8A7790 (H2)
and R8A7791 (M2) platforms. It is available for convenience at

	git://linuxtv.org/pinchartl/media.git iommu/devel/dt

The patches are not meant to be merged upstream at this time, but serve as a
base to implement and test IPMMU support in the VSP1 and DU on Gen2 (quite
obviously).

Less obviously, the patches are also useful for Gen3 development. The H3 IPMMU
hardware is known to be buggy, but development can be performed on Gen2 to
some extent by mimicking the Gen3 VSP1 + DU combination. This is performed by
patches 4/7 to 7/7 for H2. Corresponding patches for M2 are straightforward to
implement.

Please note that applying the last three patches break DU operation as the
framebuffers are mapped through the wrong IPMMU instance. This will be fixed
by a subsequent patch series, these patches only serve as a development base.

Laurent Pinchart (7):
  ARM: shmobile: r8a7790: Enable IOMMU usage for the DU
  ARM: shmobile: r8a7791: Enable IOMMU usage for the DU
  ARM: shmobile: r8a7790: Enable IOMMU usage for the VSP1
  ARM: shmobile: r8a7791: Enable IOMMU usage for the VSP1
  [HACK] ARM: shmobile: r8a7790: Link the VSP1 and DU
  [HACK] v4l: vsp1: Disable UAPI for VSP1D
  [HACK] drm: rcar-du: Enable VSP source support for R8A7790

 arch/arm/boot/dts/r8a7790.dtsi         | 23 ++++++++++++++---------
 arch/arm/boot/dts/r8a7791.dtsi         |  9 ++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c  |  9 +++++----
 drivers/media/platform/vsp1/vsp1_drv.c |  1 -
 4 files changed, 27 insertions(+), 15 deletions(-)

-- 
Regards,

Laurent Pinchart

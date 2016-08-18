Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:49550 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754409AbcHSA7j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Aug 2016 20:59:39 -0400
Received: from localhost.localdomain (227.178-201-80.adsl-dyn.isp.belgacom.be [80.201.178.227])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 433C9208DA
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Aug 2016 18:03:34 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH/HACK 6/7] [HACK] v4l: vsp1: Disable UAPI for VSP1D
Date: Thu, 18 Aug 2016 19:03:59 +0300
Message-Id: <1471536240-25082-7-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1471536240-25082-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1471536240-25082-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

VSP1D is controlled from within the kernel by the DU DRM/KMS driver,
disabling the VSP userspace API.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/vsp1/vsp1_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
index 64d832ef9ef3..2c2bb68df626 100644
--- a/drivers/media/platform/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/vsp1/vsp1_drv.c
@@ -611,7 +611,6 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
 		.uds_count = 1,
 		.wpf_count = 1,
 		.num_bru_inputs = 4,
-		.uapi = true,
 	}, {
 		.version = VI6_IP_VERSION_MODEL_VSPS_M2,
 		.model = "VSP1-S",
-- 
Regards,

Laurent Pinchart

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:60205 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753668AbdKOHNn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Nov 2017 02:13:43 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL FOR renesas-drivers] R-Car DU IOMMU
Date: Wed, 15 Nov 2017 09:13:53 +0200
Message-ID: <1663509.2FqCFAqz4G@avalon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

The following changes since commit d65d31388a23b14df9494135ad6c6549a59a3caa:

  Merge tag 'drm-misc-next-fixes-2017-11-07' of git://anongit.freedesktop.org/
drm/drm-misc into drm-next (2017-11-08 05:22:49 +1000)

are available in the git repository at:

  git://linuxtv.org/pinchartl/media.git drm-du-iommu-v1-20171115

for you to fetch changes up to 6cb711c0fabae1101bfde1c8dce0dfd992822f6b:

  drm: rcar-du: Allow importing non-contiguous dma-buf with VSP (2017-11-15 
09:00:43 +0200)

----------------------------------------------------------------
Laurent Pinchart (2):
      drm: rcar-du: Set the DMA coherent mask for the DU device
      drm: rcar-du: Allow importing non-contiguous dma-buf with VSP

 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 13 ++++++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 39 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_kms.h |  7 +++++++
 3 files changed, 58 insertions(+), 1 deletion(-)

-- 
Regards,

Laurent Pinchart

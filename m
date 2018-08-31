Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:46804 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727201AbeHaWVn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Aug 2018 18:21:43 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 0/3] drm: rcar-du: Update DU support
Date: Fri, 31 Aug 2018 19:12:56 +0100
Message-Id: <20180831181259.29529-1-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

3 patches to remove current limitations in the DU.
Image formats that the hardware is capable of were not listed in the
driver, and are added by Koji Masuoka.

Frame sizes on Gen3 platforms were artificially limited to the Gen2
framesizes, and so this has been lifted to support larger displays such
as 4K outputs.

Finally restrictions on the framebuffer strides and alignments are
lifted due to the greater flexibility of the VSP.

Kieran Bingham (1):
  drm: rcar-du: Update Gen3 output limitations

Koji Matsuoka (1):
  drm: rcar-du: Add pixel format support

Laurent Pinchart (1):
  drm: rcar-du: Update framebuffer pitch and alignment limits for Gen3

 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 81 ++++++++++++++++++++++-----
 1 file changed, 67 insertions(+), 14 deletions(-)

-- 
2.17.1

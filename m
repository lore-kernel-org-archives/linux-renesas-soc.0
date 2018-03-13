Return-Path: <linux-media-owner@vger.kernel.org>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 01/11] media: vsp1: drm: Fix minor grammar error
Date: Tue, 13 Mar 2018 19:05:17 +0100
Message-Id: <fb63b62b1d6c42f887e2dd8cf7652f14b87d1bd1.1520963956.git-series.kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <cover.89a4a5175efbf31441ba717a99b0e3c31088179f.1520963956.git-series.kieran.bingham+renesas@ideasonboard.com>
References: <cover.89a4a5175efbf31441ba717a99b0e3c31088179f.1520963956.git-series.kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <cover.89a4a5175efbf31441ba717a99b0e3c31088179f.1520963956.git-series.kieran.bingham+renesas@ideasonboard.com>
References: <cover.89a4a5175efbf31441ba717a99b0e3c31088179f.1520963956.git-series.kieran.bingham+renesas@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The pixel format is 'unsupported'. Fix the small debug message which
incorrectly declares this.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/platform/vsp1/vsp1_drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/vsp1/vsp1_drm.c b/drivers/media/platform/vsp1/vsp1_drm.c
index 3c8b1952799d..0459b970e9da 100644
--- a/drivers/media/platform/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/vsp1/vsp1_drm.c
@@ -363,7 +363,7 @@ int vsp1_du_atomic_update(struct device *dev, unsigned int pipe_index,
 	 */
 	fmtinfo = vsp1_get_format_info(vsp1, cfg->pixelformat);
 	if (!fmtinfo) {
-		dev_dbg(vsp1->dev, "Unsupport pixel format %08x for RPF\n",
+		dev_dbg(vsp1->dev, "Unsupported pixel format %08x for RPF\n",
 			cfg->pixelformat);
 		return -EINVAL;
 	}
-- 
git-series 0.9.1

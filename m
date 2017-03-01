Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <SRS0=VNCf=2K=ideasonboard.com=kieran.bingham+renesas@kernel.org>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com,
	linux-renesas-soc@vger.kernel.org
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [RFC PATCH 1/3] v4l: vsp1: Register pipe with output WPF
Date: Wed,  1 Mar 2017 13:12:54 +0000
Message-Id: <c49f9bbdc3061afda54dfeab3b0d05c309a2e0c4.1488373517.git-series.kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <cover.79abe454b4a405227fcacc23f1b6ba624ee99cf0.1488373517.git-series.kieran.bingham+renesas@ideasonboard.com>
References: <cover.79abe454b4a405227fcacc23f1b6ba624ee99cf0.1488373517.git-series.kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <cover.79abe454b4a405227fcacc23f1b6ba624ee99cf0.1488373517.git-series.kieran.bingham+renesas@ideasonboard.com>
References: <cover.79abe454b4a405227fcacc23f1b6ba624ee99cf0.1488373517.git-series.kieran.bingham+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

The DRM object does not register the pipe with the WPF object. This is
used internally throughout the driver as a means of accessing the pipe.
As such this breaks operations which require access to the pipe from WPF
interrupts.

Register the pipe inside the WPF object after it has been declared as
the output.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/platform/vsp1/vsp1_drm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/vsp1/vsp1_drm.c b/drivers/media/platform/vsp1/vsp1_drm.c
index cd209dccff1b..8e2aa3f8e52f 100644
--- a/drivers/media/platform/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/vsp1/vsp1_drm.c
@@ -596,6 +596,7 @@ int vsp1_drm_init(struct vsp1_device *vsp1)
 	pipe->bru = &vsp1->bru->entity;
 	pipe->lif = &vsp1->lif->entity;
 	pipe->output = vsp1->wpf[0];
+	pipe->output->pipe = pipe;
 
 	return 0;
 }
-- 
git-series 0.9.1

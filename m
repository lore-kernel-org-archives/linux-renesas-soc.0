Return-Path: <linux-media-owner@vger.kernel.org>
Date: Thu, 6 Jul 2017 15:25:32 -0500
From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
To: Kieran Bingham <kieran@ksquared.org.uk>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Subject: [PATCH] rcar_fdp1: constify vb2_ops structure
Message-ID: <20170706202532.GA12160@embeddedgus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Check for vb2_ops structures that are only stored in the ops field of a
vb2_queue structure. That field is declared const, so vb2_ops structures
that have this property can be declared as const also.

This issue was detected using Coccinelle and the following semantic patch:

@r disable optional_qualifier@
identifier i;
position p;
@@
static struct vb2_ops i@p = { ... };

@ok@
identifier r.i;
struct vb2_queue e;
position p;
@@
e.ops = &i@p;

@bad@
position p != {r.p,ok.p};
identifier r.i;
struct vb2_ops e;
@@
e@i@p

@depends on !bad disable optional_qualifier@
identifier r.i;
@@
static
+const
struct vb2_ops i = { ... };

Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
---
 drivers/media/platform/rcar_fdp1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar_fdp1.c b/drivers/media/platform/rcar_fdp1.c
index 3ee51fc..3245bc4 100644
--- a/drivers/media/platform/rcar_fdp1.c
+++ b/drivers/media/platform/rcar_fdp1.c
@@ -2032,7 +2032,7 @@ static void fdp1_stop_streaming(struct vb2_queue *q)
 	}
 }
 
-static struct vb2_ops fdp1_qops = {
+static const struct vb2_ops fdp1_qops = {
 	.queue_setup	 = fdp1_queue_setup,
 	.buf_prepare	 = fdp1_buf_prepare,
 	.buf_queue	 = fdp1_buf_queue,
-- 
2.5.0

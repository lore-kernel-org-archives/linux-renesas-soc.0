Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.14]:61920 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754692AbdKAPkR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Nov 2017 11:40:17 -0400
Subject: [PATCH v2 1/2] drm/rcar-du: Use common error handling code in
 rcar_du_encoders_init()
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: kbuild test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, kbuild-all@01.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <201710262044.165nsaJp%fengguang.wu@intel.com>
 <26b811dd-9dfa-cfd3-7d4d-e7f1c852b8ed@users.sourceforge.net>
Message-ID: <56554dfd-6990-e104-ea70-e457f250fe5d@users.sourceforge.net>
Date: Wed, 1 Nov 2017 16:39:54 +0100
MIME-Version: 1.0
In-Reply-To: <26b811dd-9dfa-cfd3-7d4d-e7f1c852b8ed@users.sourceforge.net>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 1 Nov 2017 15:57:31 +0100

* Add a jump target so that a bit of exception handling can be better
  reused at the end of this function.

* Increase the scope for the variable "ret".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---

v2:
The declaration for the variable "ret" was moved out of a loop.

 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 566d1a948c8f..b6b341164aab 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -365,6 +365,7 @@ static int rcar_du_encoders_init(struct rcar_du_device *rcdu)
 	struct device_node *np = rcdu->dev->of_node;
 	struct device_node *ep_node;
 	unsigned int num_encoders = 0;
+	int ret;
 
 	/*
 	 * Iterate over the endpoints and create one encoder for each output
@@ -374,13 +375,10 @@ static int rcar_du_encoders_init(struct rcar_du_device *rcdu)
 		enum rcar_du_output output;
 		struct of_endpoint ep;
 		unsigned int i;
-		int ret;
 
 		ret = of_graph_parse_endpoint(ep_node, &ep);
-		if (ret < 0) {
-			of_node_put(ep_node);
-			return ret;
-		}
+		if (ret < 0)
+			goto put_node;
 
 		/* Find the output route corresponding to the port number. */
 		for (i = 0; i < RCAR_DU_OUTPUT_MAX; ++i) {
@@ -401,10 +399,8 @@ static int rcar_du_encoders_init(struct rcar_du_device *rcdu)
 		/* Process the output pipeline. */
 		ret = rcar_du_encoders_init_one(rcdu, output, &ep);
 		if (ret < 0) {
-			if (ret == -EPROBE_DEFER) {
-				of_node_put(ep_node);
-				return ret;
-			}
+			if (ret == -EPROBE_DEFER)
+				goto put_node;
 
 			continue;
 		}
@@ -413,6 +409,10 @@ static int rcar_du_encoders_init(struct rcar_du_device *rcdu)
 	}
 
 	return num_encoders;
+
+put_node:
+	of_node_put(ep_node);
+	return ret;
 }
 
 static int rcar_du_properties_init(struct rcar_du_device *rcdu)
-- 
2.14.3

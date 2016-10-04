Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-3.sys.kth.se ([130.237.48.192]:39965 "EHLO
        smtp-3.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753967AbcJDNJo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Oct 2016 09:09:44 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/3] gen-image: support overlapping hue areas for HGT frames
Date: Tue,  4 Oct 2016 15:09:13 +0200
Message-Id: <20161004130915.28812-2-niklas.soderlund@ragnatech.se>
In-Reply-To: <20161004130915.28812-1-niklas.soderlund@ragnatech.se>
References: <20161004130915.28812-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

The HGT can operate with hue areas which are not directly adjoined. In
this mode of operation hue values which are between two areas are
attributed to both areas with a weight for the final histogram.

Add support to generate such histograms using gen-image which can be
used to verify correct operation of the HGT. Previously gen-image could
only generate histograms with adjoined areas.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 src/gen-image.c | 98 ++++++++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 79 insertions(+), 19 deletions(-)

diff --git a/src/gen-image.c b/src/gen-image.c
index 688f602..9cd5eb9 100644
--- a/src/gen-image.c
+++ b/src/gen-image.c
@@ -1301,7 +1301,7 @@ static void histogram_compute_hgt(const struct image *image, void *histo,
 	uint8_t rgb[3], hsv[3], smin = 255, smax = 0;
 	uint32_t sum = 0, hist[6][32];
 	unsigned int x, y, i;
-	int m, n;
+	unsigned int hist_n, hue_pos;
 
 	memset(hist, 0x00, sizeof(hist));
 
@@ -1317,24 +1317,84 @@ static void histogram_compute_hgt(const struct image *image, void *histo,
 			smax = max(smax, hsv[1]);
 			sum += hsv[1];
 
-			/* Find m and n for hist */
-			m = n = -1;
-			for (i = 0; i < 6  && m == -1; i++)
-				if (hsv[0] >= hue_areas[i*2] && (hsv[0] <= hue_areas[i*2+1]))
-					m = i;
-			for (i = 0; i < 32 && n == -1; i++)
-				if ((hsv[1] >= 8*i) && (hsv[1] < 8 * (i+1)))
-					n = i;
+			/* Find n for hist */
+			hist_n = hsv[1] / 8;
 
 			/*
-			 * The HW supports a declining weight to be applied
-			 * when hue areas are not directly adjoined. This
-			 * test can not replicated this, the hue areas need
-			 * to be set without any gaps else the weights from HW
-			 * will be wrong. Max weight is 16.
+			 * Find position in hue areas which is greater than the
+			 * current H value. Special consideration is needed for:
+			 *
+			 * - Values inside a hue area are inclusive, values that
+			 *   are between two hue areas are exclusive.
+			 * - Hue area 0 can wrap around the H value space, for
+			 *   example include values greater then 240 but less
+			 *   then 30.
 			 */
-			if (m != -1 && n != -1)
-				hist[m][n] += 16;
+			for (i = 0; i < 12; i++) {
+
+				/* Special cases when area 0 wraps around */
+				if (hue_areas[0] > hue_areas[1]) {
+
+					/* Check if pixel is inside the wrapped area 0 */
+					if (hsv[0] > hue_areas[0] || hsv[0] <= hue_areas[1]) {
+						hue_pos = 1;
+						break;
+					}
+
+					/* Exclude first area point from normal logic */
+					if (!i)
+						continue;
+				}
+
+				/* Check if H is inside one of the hue areas */
+				if ((hsv[0] < hue_areas[i]) || (i % 2 && hsv[0] == hue_areas[i])) {
+					hue_pos = i;
+					break;
+				}
+
+				/* Check if H is larger then area 5 */
+				if (hsv[0] > hue_areas[11]) {
+					hue_pos = 0;
+					break;
+				}
+			}
+
+			/*
+			 * Figure out which areas the current H value should be
+			 * attributed to. If the H value is inside one of the
+			 * areas the max weight (16) is attributed to it else
+			 * the weight is split between them based on how close
+			 * the H value is to each area.
+			 *
+			 * If ''hue_pos'' are odd the H value is inside an area and
+			 * it should be attributed the full weight to area hue_pos/2
+			 * else it should be split between area hue_pos/2 and
+			 * hue_pos/2 - 1.
+			 */
+			if (hue_pos % 2) {
+				hist[hue_pos/2][hist_n] += 16;
+			} else {
+				unsigned int hue1, hue2;
+				unsigned int length, width, weight;
+
+				hue1 = hue_areas[hue_pos ? hue_pos - 1 : 11];
+				hue2 = hue_areas[hue_pos];
+
+				/* Calculate the total width between the two areas */
+				width = hue2 - hue1 + (hue1 > hue2 ? 256 : 0);
+
+				/* Calculate the length to the right most area */
+				if (hue1 > hue2 && hsv[0] > hue1)
+					length = width - (hsv[0] - hue1);
+				else
+					length = abs(hsv[0] - hue2);
+
+				/* Calculate weight and round up */
+				weight = (length * 16 + width - 1) / width;
+				/* Split weight between the two areas */
+				hist[hue_pos ? hue_pos/2 - 1 : 5][hist_n] += weight;
+				hist[hue_pos/2][hist_n] += 16 - weight;
+			}
 		}
 	}
 
@@ -1349,9 +1409,9 @@ static void histogram_compute_hgt(const struct image *image, void *histo,
 	histo += 4;
 
 	/* Weighted Frequency of Hue Area-m and Saturation Area-n */
-	for (m = 0; m < 6; m++) {
-		for (n = 0; n < 32; n++) {
-			*(uint32_t *)histo = hist[m][n];
+	for (x = 0; x < 6; x++) {
+		for (y = 0; y < 32; y++) {
+			*(uint32_t *)histo = hist[x][y];
 			histo += 4;
 		}
 	}
-- 
2.9.3

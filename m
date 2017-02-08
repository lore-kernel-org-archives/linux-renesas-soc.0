Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:41504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754540AbdBHOEP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Feb 2017 09:04:15 -0500
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org, kieran.bingham@ideasonboard.com
Subject: [PATCH 2/5] vsp-lib: Filter non-filesystem regular characters
Date: Wed,  8 Feb 2017 14:03:57 +0000
Message-Id: <9205d7a3e6fa64aa86ddc99d88b84008213015e7.1486562055.git-series.kieran.bingham@ideasonboard.com>
In-Reply-To: <cover.381fcf0d4db5fa66965cf3d2fca214970f22122b.1486562055.git-series.kieran.bingham@ideasonboard.com>
References: <cover.381fcf0d4db5fa66965cf3d2fca214970f22122b.1486562055.git-series.kieran.bingham@ideasonboard.com>
In-Reply-To: <cover.381fcf0d4db5fa66965cf3d2fca214970f22122b.1486562055.git-series.kieran.bingham@ideasonboard.com>
References: <cover.381fcf0d4db5fa66965cf3d2fca214970f22122b.1486562055.git-series.kieran.bingham@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Parameters can contain characters not suited to use in filenames.

Add '=','(', and ')' to the filtering, and replace with '_'

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 scripts/vsp-lib.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
index 5aff30217a27..08bf8f36c582 100755
--- a/scripts/vsp-lib.sh
+++ b/scripts/vsp-lib.sh
@@ -263,6 +263,9 @@ compare_frames() {
 	local params=${args// /-}
 	params=${params:+-$params}
 	params=${params//\//_}
+	params=${params/=/_}
+	params=${params/(/_}
+	params=${params/)/_}
 	params=$in_fmt-$out_fmt-$size$params
 
 	if [ x$__vsp_pixel_perfect != xtrue ] ; then
-- 
git-series 0.9.1

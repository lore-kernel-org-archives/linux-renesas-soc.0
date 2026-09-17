Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2806B3B6BE4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 10:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789640368; cv=none; b=ejJOc1+9tuaNtu1sxAlY/+q9rM6cVK7q0+31A1BEl6y0/u+SyRqOEtEt2bzdKG/+NqTyvwZZJXd/B+h390ViXc/gkt2d4OCx3Z0EvfM6h9JaBt0CNX3nC0dFXE2l1H4USKLAagRdpAQ4BQ924+vgP6BtTo9QNnbBl9hW8k3InDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789640368; c=relaxed/simple;
	bh=VmL8RSeIZnUVHyGTUi66fBgqprYiUQsbt4bkqxuZ23w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=phJxkJf5LOJz74jYFPt3SwmDZJMjGsgzhn0AuZh+dlfpOvmz1SC3sP/cDwDXAN10EVVlC+agvNFKEgrc2vQgR/dMPX96IV7NbdHqOj9dA9+3k1fh5w2o6WZR/fd9ljr67K4MVP3ey33O/hlS4163GsuOGFuQEcBaMxEin0BFDDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=p09JxV4B; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p09JxV4B"
Received: from neptunite.hamster-moth.ts.net (unknown [IPv6:2400:2411:160:2f00:a4f1:7e05:2192:a835])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E4D822C6;
	Thu, 17 Sep 2026 12:17:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789640263;
	bh=VmL8RSeIZnUVHyGTUi66fBgqprYiUQsbt4bkqxuZ23w=;
	h=From:To:Cc:Subject:Date:From;
	b=p09JxV4BdXHxi/mrT6HdcQPHGOg+PiDRmbTYN+NvNBNCnhksUHb3Yza10BgjCeliy
	 FPJmcdTzpMuaMRGMa84icnjiyuINdhJUD+OAvmUhmjIUmma53hay4QuQkHw4w8xj+9
	 r9STR833bAD1i9e/DdFS7SnYB1+l+xlonBSDKKkA=
From: Paul Elder <paul.elder@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH] src: gen-image: Fix compiler warning
Date: Thu, 17 Sep 2026 19:19:12 +0900
Message-ID: <20260917101912.3891324-1-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix compiler warning for maybe uninitialized.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 src/gen-image.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/gen-image.c b/src/gen-image.c
index 26d7f0d28417..401e1316ae5a 100644
--- a/src/gen-image.c
+++ b/src/gen-image.c
@@ -386,7 +386,7 @@ static int pnm_read_integer(int fd)
 
 static struct image *pnm_read(const char *filename)
 {
-	struct image *image;
+	struct image *image = NULL;
 	unsigned int width;
 	unsigned int height;
 	char buffer[2];
-- 
2.47.3


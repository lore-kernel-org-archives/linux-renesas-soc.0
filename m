Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06B93939BC;
	Wed, 18 Mar 2026 23:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773878366; cv=none; b=ZNjNOrG2oeOK96hhBPGXa7oCg0uQOYk5VdhzFoEb4dD6vGloJ9gYcyy9+U07ooFv/Kw3bWIc+YjpKni94JMgND8gUMpj0Djvh/AbWyJLujMv81/r1TbCG6lnAxtnqlD5fu8MFbCLxao1+wADP7ulNmehFc2jATl74ACj24r0OBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773878366; c=relaxed/simple;
	bh=XEOlXbZm4sVMR/hQWHXSdc1OSjlyxGgGH6dNpjX4iFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jhMkTdcih+h8uOzLE49wOnTHY1w9Yt8HqtMuJuMLGwkjY1RlePG2tMqE9PkUCQjUgOTEKipwp2h2HguOc0OR4fHLGzi65EoFgkQ7uX//8fywr2hOTqiUNSqYrTMfeJRmlNK/PVjfo8/9bxXm6OS1jL6o9ria4gf3BDpEQGJMGBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OMHtb+yQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OMHtb+yQ"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id ECEFC9A6;
	Thu, 19 Mar 2026 00:58:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773878288;
	bh=XEOlXbZm4sVMR/hQWHXSdc1OSjlyxGgGH6dNpjX4iFU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OMHtb+yQw7fQrZ5ZgmhfWj4uFJyKti3JJ5MRlNGz5KS/fdjtttMkp7cavRyCXPS42
	 owzmpMnQ2jEMJTIcVkNJGtZDYlWNLCnRGobmmWtuX6svMaxWiVROTcig9aSxwCWA/i
	 hh7/9QYmSZYy4ak3wq9l6RYKSjGHjGqQdu29vnGk=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v4 09/13] media: renesas: vsp1: histo: Fix code enumeration
Date: Thu, 19 Mar 2026 01:59:03 +0200
Message-ID: <20260318235907.831556-10-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260318235907.831556-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20260318235907.831556-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The histogram media bus code enumeration does not check the index when
operating on the source pad, resulting in an infinite loop if userspace
keeps enumerating code without any loop boundary. Fix it by returning an
error for indices larger than 0 as the pad supports a single format.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_histo.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_histo.c b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
index d7843c170f94..f97aecb22058 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_histo.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
@@ -168,7 +168,10 @@ static int histo_enum_mbus_code(struct v4l2_subdev *subdev,
 				struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->pad == HISTO_PAD_SOURCE) {
-		code->code = MEDIA_BUS_FMT_FIXED;
+		if (code->index > 0)
+			return -EINVAL;
+
+		code->code = MEDIA_BUS_FMT_METADATA_FIXED;
 		return 0;
 	}
 
-- 
Regards,

Laurent Pinchart


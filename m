Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA53A33EAEA
	for <linux-renesas-soc@vger.kernel.org>; Sat, 31 Jan 2026 15:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769875139; cv=none; b=b4MaDJPwLpxkDMc/kiTgp52g/oCaz4x279orq4gmjzA62yoHvH19/y9lvBlKX5jyiS/hQuvril303FNh/BTYmCmUCz6RpMPtdp+qEPB8VRVqPQ9QuBsMDqZIOj6LdzdPGDz+mNJIgfvtNY3tZoherm9skN4QDWkeDRanXzS/Tmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769875139; c=relaxed/simple;
	bh=bczyOOkseIGllZ1KI2kQH9CHNFzTuiU+IBawx++FApo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cRR9NqPSEGBGr+IAL7aTMPgm23IEPma0DBCM+fstoQ2g9Z75IQcP1lP00PfyiPnHfkER84rZouFg0RBEAFl8gmNEtN6inY7PUt02R4XFVZJ7FBxrS3VGJNwaK42abQhKFqJhJNlPRdWiisO4zJ5h+gck1cRzCnQ24EBAZm40qWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1ydRNdvw; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1ydRNdvw"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5347DC22F7D;
	Sat, 31 Jan 2026 15:59:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 68B45606B6;
	Sat, 31 Jan 2026 15:58:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E32EE119A88ED;
	Sat, 31 Jan 2026 16:58:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769875135; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=D7K4F1HrIRTsPGZNGwzk5i8tsCCw6aOJmgJvAPraxf8=;
	b=1ydRNdvwB7R0kZe9ZPntmALDCX7si7xmTy1IchtGSw9oszcrW9Vt3sq2TOT3gZx9uPAezZ
	7xuKOFJgwqssR2HkmiHi5JUDIWrgt81+4ha3+1Dmww0vXw3oDGvVNFMNfS49o/rXLQyA1U
	rCcnlZLrPKpsrZSbkRHb5gbYX/dWSLdjhDJEA+Fh8faGzPDevw46hnIuG/WBmSzzzGM+47
	C/X3JubjViBGxR4vl8VOEJ2F5GVn0glpiq4UJasjXXaZ9nag593Dhn46UIvXpqqag66Hm3
	iD08uQFI8dvWrJtvkWMqmwVBAmjtg1Zayt9xuc8JJLWld0OKPRyB2pCiUTkT0w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Sat, 31 Jan 2026 16:58:35 +0100
Subject: [PATCH v2 3/6] drm/mcde: dsi: mcde_dsi_bind: break when a panel or
 bridge is found
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260131-drm-bridge-alloc-getput-drm_of_find_bridge-4-v2-3-e081bcdc1467@bootlin.com>
References: <20260131-drm-bridge-alloc-getput-drm_of_find_bridge-4-v2-0-e081bcdc1467@bootlin.com>
In-Reply-To: <20260131-drm-bridge-alloc-getput-drm_of_find_bridge-4-v2-0-e081bcdc1467@bootlin.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

mcde_dsi_bind() has a loop over all subnodes looking for a panel, but does
not exit when a match is found and only stores the last match. However this
will be problematic when introducing refcounting on the struct drm_device
pointer in a following commit, because of_drm_find_and_get_bridge() would
get a reference to multiple bridges.

There seem to be no real reason for looking for multiple panels, so just
break as soon as a match is found.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v2:
- break instead of warning as suggested by Linus Walleij:
  https://lore.kernel.org/r/CAD++jLm_Va+7c_usgoPDhsDiCr4NQMZWsQ3iJW5-a1ETP4EaJQ@mail.gmail.com
---
 drivers/gpu/drm/mcde/mcde_dsi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index a3423459dd7a..5893fd2681b3 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -1116,6 +1116,11 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 				return -EINVAL;
 			}
 		}
+
+		if (panel || bridge) {
+			of_node_put(child);
+			break;
+		}
 	}
 	if (panel) {
 		bridge = drm_panel_bridge_add_typed(panel,

-- 
2.52.0


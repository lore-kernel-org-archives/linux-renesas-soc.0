Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC4C3939AF
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 08:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776328463; cv=none; b=nNh16HrrG4wZbryYOAlotzEBBzQvfA4ZbAtTIBbm60rcQ9QTZxdh1KpHCZks4NEUzMY1uTPNsPz4P8o9sObo3ZT3zbgYRwN4LnY9n9VqSEzNz7G2/W/hPZOwJ4t/Nt8D631Rw7EMGwsNNf7CxITfDEvA8xnNjZRxHzBzFwfQx7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776328463; c=relaxed/simple;
	bh=C2WoqBYsRLcsHbdwl7Tvi6cvPdURHndVFdUmm98T9OY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CQ0UPk44IrsydVsf/q0zqrdRC9ws8bSKomHWmNx6v1vNkQjzXHJyKyz/GxV7PfGaGevWs+Le69vAwhIIwwZILJ6WIZAyTpuyasR04Jp2Xcw48SOsyPunVVNW0COEAWw25L7nNcCTPBibHfPbFWjvk+m2wP2yyipBkoToY/d37xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ld8Cagol; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ld8Cagol"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 079DD1A32F2;
	Thu, 16 Apr 2026 08:34:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C71C05FDEB;
	Thu, 16 Apr 2026 08:34:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 23D461045A12E;
	Thu, 16 Apr 2026 10:34:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776328458; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fyPE2UcWoAtdUsdXR6/1PwlygsJ7Boci4kftRssSf8w=;
	b=Ld8CagolPV4TV3IRi8NXlQJkzddw9SoZsd0tLgN6f2o2PiU8FShYUO4gzqtWvGhvzEi/1p
	IO8s/ja/8t687CRuIfM+CA8S7PT7/NwpBMjNEpGCNFwlKsfSIqhpi7zBMKc39L8M2KISwv
	OJKyh/uXxCDqiprHUBOWryhPwgqlbDTjmpYLcMzz+vZZGtGOsy1+ZWWftLsBaZsQeZUhE4
	lH7xbq3PnngmCWroB9JdhF2UpAlPNd6wlsPaY1b7U74NV0g5hKDqiRWG8XixwasG+yaybY
	sWEvZZD8RtJFvt2dEIUfAFlbifNs5sCYpHTyrKdQTrXfsmpWJFvfQaXQ3mU2ng==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
In-Reply-To: <20260409-drm-bridge-alloc-getput-drm_of_find_bridge-4-v5-0-d7381c07788a@bootlin.com>
References: <20260409-drm-bridge-alloc-getput-drm_of_find_bridge-4-v5-0-d7381c07788a@bootlin.com>
Subject: Re: [PATCH v5 0/2] drm/bridge: convert users of
 of_drm_find_bridge(), part 4
Message-Id: <177632845284.4121728.12045102718276713702.b4-ty@b4>
Date: Thu, 16 Apr 2026 10:34:12 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3


On Thu, 09 Apr 2026 15:23:27 +0200, Luca Ceresoli wrote:
> This series converts many DRM drivers from the now deprecated
> of_drm_find_bridge() to its replacement of_drm_find_and_get_bridge() which
> allows correct bridge refcounting.
> 
> This is part of the work to support hotplug of DRM bridges. The grand plan
> was discussed in [0].
> 
> [...]

Applied, thanks!

[1/2] drm: renesas: rz-du: rzg2l_du_encoder: convert to of_drm_find_and_get_bridge()
      commit: ad964ab629ffe5551d43f848de823814958130d5
[2/2] drm: rcar-du: encoder: convert to of_drm_find_and_get_bridge()
      commit: 5b03d4907db93627ef48396f39c3455ce644c946

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0FD2C11C6
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Mar 2026 13:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772545337; cv=none; b=ASdShfWLikeSQV6aJyBxr2z0DDCvN5DA9gv4guGBBT2DQEaaU121cmXxC0SRLIdQ3M1R65Y9vsGw/nFQ7QH2LBd1XwM5WOrRQgD8SG5n0rZwh3USk2s1SRpqxJwmDOvhaszA8teC62Z8b6pSN+rXuRFPakmMTqVIcdWkp6LghQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772545337; c=relaxed/simple;
	bh=DZkF5PcCbMI8m09JxEhDCClI3xUSZAsE0/umwgopBLM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XwSeuZH/g4IZsWPQ6GcrcVp3qZyWIv6/VSK6r9V7aUf/Gpmw4Z5nNHJVFZtS4Gpi6OFgLj4aXJsg61N41G8crA3X+aTaWg1dzsi0dxgJbcLEaqQrFV5i+XXaCUjaW8XsAZX3902//G8aisG5z/60g5UYK8wWF82bJLXR9+Xs9NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=K4vsT1tK; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="K4vsT1tK"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 788FBC40FAA;
	Tue,  3 Mar 2026 13:42:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BD0D95FF29;
	Tue,  3 Mar 2026 13:42:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DC32A103685C9;
	Tue,  3 Mar 2026 14:42:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772545332; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=t6FnL1nGnOp3nQgTM5xZBDRFoD8EHpB/OxobjHHyrxA=;
	b=K4vsT1tK7wybbNAPe8tmCAogUGJOJbR+cUwZuB329VCiTkq0OJw40wUKgds69zvDmCo/hg
	as9j/05T4ZJFfMCjXfS9B+YjG9H6s0KF57maGUPNIf2i6SqHzR4P8Qo2xkg6avTtrscNJM
	nCIldUB1haMOCmyA4ZwjF0YsOXoppXtoCmsj6dhU9E3no6Myay1WxZ+iKW9De4/4YLILZc
	G7elJE+td/pcfDwOErWr6Nu8Pk0eG7Nxyp5sqyZvs+3mV7S/TRUfu4oHJrumIB2Q6jADxP
	0UPte8rL2CauGhdLcYpxsd9oFATYweHAqmw03Of+x25+nV7Z2p5omU1YhBmlkA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: dri-devel@lists.freedesktop.org, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Joseph Guo <qijian.guo@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20260115024004.660986-1-marek.vasut+renesas@mailbox.org>
References: <20260115024004.660986-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge:
 waveshare,dsi2dpi: Document 1..4 DSI lane support
Message-Id: <177254532764.177236.18347134827363909064.b4-ty@bootlin.com>
Date: Tue, 03 Mar 2026 14:42:07 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3


On Thu, 15 Jan 2026 03:39:42 +0100, Marek Vasut wrote:
> Describe 1..4 DSI lanes as supported. Internally, this bridge is
> an ChipOne ICN6211 which loads its register configuration from a
> dedicated storage and its I2C does not seem to be accessible. The
> ICN6211 supports up to 4 DSI lanes, so this is a hard limit for
> this bridge. The lane configuration is preconfigured in the bridge
> for each of the WaveShare panels.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: display: bridge: waveshare,dsi2dpi: Document 1..4 DSI lane support
      commit: 2befa6407d5c8b543be32c2276d396db395d9d02
[2/2] drm/bridge: waveshare-dsi: Add support for 1..4 DSI data lanes
      commit: fca11428425e92bf21d4a7f5865708c5e64430e4

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


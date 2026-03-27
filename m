Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE47937D13B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Mar 2026 07:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774598281; cv=none; b=LqzR6DIivPw1NDYZg8YbBhXurYnu5C7RFHez+fGHPAUdJgPlciu7Hd0G53xkM9fDIobzDSxB0VIE2MeJgBIUZ0+KplAnauQy+tZEfSeFRy9RVDvIC4SR62QjZprBaPchD+9Vw9aLzyhQ28YGV8JRJnPajnrZ4/LL/JtvvA3Fo6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774598281; c=relaxed/simple;
	bh=BvIvOiULdSDzr1AdSUV8P2PsoZVED4hMWpwkQzx9zas=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=TwdO5lofNDRV9m9gaGNyRT0MkGg3BgHX3NWZcQeWOH0msegWFEG/yc+RQv30UVOen6wDDswFDKM9hk9Nm956O+6XgIwZymvZ3XfXwMdcwL0M7Sm5iw9KHG3UHoEqrsdih6NP7TBItcf7u31OlqLDjpHktp5/Hwm7hOzPRc9Lf3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nC677v1O; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nC677v1O"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EE47D1A3018;
	Fri, 27 Mar 2026 07:57:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C102260230;
	Fri, 27 Mar 2026 07:57:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E20E810450F0A;
	Fri, 27 Mar 2026 08:57:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774598272; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FFBfGsTXnTK41d/BbkcMjWKr681rJqWXfmtbDSwR6W8=;
	b=nC677v1Otou6cBTVPwLOC+9wP0nDsMdCloupXcLWPT6Wo8EyVvSpstWjA5dZ8HxYQRPtcN
	kjAkSq9Eusjh7k4jh6o3I6X5hEQSWe76lhf0jf9RyxzOYpmyEmmeLFqkiqe5b5vhuXURFE
	6QmSjZVLhLTcwuVGUia3lXYE1tfkKVc4xNHYZC0TjYQg+gKLci5HYhSYDnD163+rT/DIw6
	YTmGam1BoOtZUWd6vf32MHiGWCEgoUO/7DA76E6nsXBcItwDnNi8zogFw79d1haTTr+834
	4eMEG0qCHrJED15sXRxX+ht9rXOcNm79UvIv/4bjTV6QUkQmoEu8R0yEzULEbQ==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Mar 2026 08:57:45 +0100
Message-Id: <DHDEL0VTRYDP.2D45EP8E07Y08@bootlin.com>
Subject: Re: [PATCH] drm/rcar-du: Convert to of_drm_find_and_get_bridge()
Cc: <dri-devel@lists.freedesktop.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Amin GATTOUT" <amin.gattout@gmail.com>, "Laurent Pinchart"
 <laurent.pinchart+renesas@ideasonboard.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, "Magnus Damm"
 <magnus.damm@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260326-bridge-v1-1-c0c44b53f7b6@gmail.com>
In-Reply-To: <20260326-bridge-v1-1-c0c44b53f7b6@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Amin,

On Thu Mar 26, 2026 at 9:10 PM CET, Amin GATTOUT wrote:
> of_drm_find_bridge() is deprecated.
> Replace it with of_drm_find_and_get_bridge() which increments
> the bridge refcount as required.

Thanks for taking care of the conversion to the new API!

> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
> @@ -72,7 +72,7 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  		if (IS_ERR(bridge))
>  			return PTR_ERR(bridge);
>  	} else {
> -		bridge =3D of_drm_find_bridge(enc_node);
> +		bridge =3D of_drm_find_and_get_bridge(enc_node);

This change alone is not correct I'm afraid. The difference between
of_drm_find_bridge() and of_drm_find_and_get_bridge() is the latter get a
reference to the bridge, so you have to put that reference when the bridge
pointer is no more accessible.

Have a look at previous commits doing the same API replacement, you can
find examples similar to this one, where:

 * the bridge pointer is stored in a local variable (not saved in a struct)
 * the bridge pointer could be set wither by of_drm_find_bridge() or
   a function adding a panel bridge

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

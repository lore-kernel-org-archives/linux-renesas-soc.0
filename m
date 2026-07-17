Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB28E176FB1;
	Fri, 17 Jul 2026 15:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784301686; cv=none; b=FOdUlXU3f1K2YlrDfGF1mBWrK9XeUBeDR4S/ha/RoOLPQi6w3oskp45DCil2L88LNnmQUXh9caKEUOYbelU692OW6oTySqg7e8Sb5jrZH4dmguMP45dwvGUdnHOClaiDawagGxFB0r7OuMqrc8TzNOCoNxF3AEOn6hmtWcc+Eso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784301686; c=relaxed/simple;
	bh=YD6WlIeKxDKq9qGgJN8u7mjDpxxE0F1ly6iDo+PVh1k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ElJUOkj4/MAjak2muxvyAOU7M4keVF24gUyKliE0lMKk4RzNSxa4opm5V88NeHYucVsPymf45i3oGkTWrovaDWuOMJY+Fx0CcGkU5Pe3ZzKuDL3rFyqjbBpQIhjO1v26acks/38FS6FgVP0HMZ1hfVBJqoDP737ghRuAXQmmqi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jcSYDkA2; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jcSYDkA2"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 039171A1067;
	Fri, 17 Jul 2026 15:21:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BDFC360361;
	Fri, 17 Jul 2026 15:21:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E796F11BD0007;
	Fri, 17 Jul 2026 17:21:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784301679; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nalHUOdm7VQVimzU6YnOC1j2OEES9BvqlJ7ozQWcY3c=;
	b=jcSYDkA25yOnOGUnVeJf8gDepP8BEEtaSQXvujl53JXFhhiH52FBqxKzswsczT2ieY4lYw
	2Oz0o+BgQOHqRLR/s/3JAG1638E3jqVOHRr3SwCMk2dMbiqNsL2AxNDJtM/5gRT9nIdwWJ
	5sd/oOUgSVYDk5Q6SD3uuhNBwY16uhSTT89BklfIEBrkNLolcr8fZqioxBg4fDD/a3VDMq
	mMrmu8LFIPT0Oe8GYbytbC6YjPMubjRBY57jyFZewflgSUo/ApdEm8upq5GfeBu86UmjGL
	XBQzMfIvqIXOskEO9cyttWNCJj+sVZwGViYCQ62RuLdJ8u9TE4S++lzsg0BVWg==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jul 2026 17:21:11 +0200
Message-Id: <DK0Y5JTE66EA.111RUXTL6W8FA@bootlin.com>
Subject: Re: [PATCH 2/4] drm/bridge: display-connector: Fix I2C adapter
 resource leak
Cc: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>, "Thuan
 Nguyen" <thuan.nguyen-hong@banvien.com.vn>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Magnus Damm" <magnus.damm@gmail.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, <linux-renesas-soc@vger.kernel.org>,
 <stable@vger.kernel.org>
To: "Johan Hovold" <johan@kernel.org>, "Laurent Pinchart"
 <laurent.pinchart+renesas@ideasonboard.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.21.0
References: <20260705213542.28987-1-laurent.pinchart+renesas@ideasonboard.com> <20260705213542.28987-3-laurent.pinchart+renesas@ideasonboard.com> <alpEVeVmH5oiqmaj@hovoldconsulting.com>
In-Reply-To: <alpEVeVmH5oiqmaj@hovoldconsulting.com>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Jul 17, 2026 at 5:03 PM CEST, Johan Hovold wrote:
> On Mon, Jul 06, 2026 at 12:35:40AM +0300, Laurent Pinchart wrote:
>> If the probe function returns an error after getting the I2C adapter for
>> DDC, the reference to the adapter is never released. Fix it by releasing
>> it in the bridge .destroy() handler.
>>
>> There is no need to test the ddc pointer with !IS_ERR(), as
>> of_get_i2c_adapter_by_node() returns NULL on error.
>
> I stumbled over this this morning as well and posted a fix here (which
> releases the adapter on driver unbind as is currently done):
>
> 	https://lore.kernel.org/lkml/20260717085716.1619275-1-johan@kernel.org/
>
>> Fixes: 6de79dd3a920 ("drm/bridge: display-connector: add ddc-en gpio sup=
port")
>
> I believe this issue was first introduced by commit 2e2bf3a5584d
> ("drm/bridge: display-connector: add DP support") a few releases
> earlier.
>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.c=
om>
>
> Reviewed-by: Johan Hovold <johan@kernel.org>

While Johan's patch has the benefit of putting the i2c adapter at remove
time (as opposed to destroy time, which is potentially a long time later),
it is also more complex. So I'd say this patch is fine.

Maybe we should have a devm version of of_get_i2c_adapter_by_node() to make
it all simpler.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

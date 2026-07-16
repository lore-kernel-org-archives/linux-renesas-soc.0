Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820B73DBD6F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jul 2026 08:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784190304; cv=none; b=PhLgXyMdnsnQq/p+w0/XSrdqJYYSaa+epbYzTItyYsV0r92YZp5tMEHb34AWKbAHm9YF3kqo+UOSGaT8/pVBvG0kzXSTlNY6somu7x7eZAVck2PDImtrgid9ZVPIRIGA2suYGP1hM6I0sAODNV6mstiW3tNzP0uRHdJJzskZZIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784190304; c=relaxed/simple;
	bh=s9CuyhlzHYaOIObOvl7RYKjdhHvVMr2Qp8TS9dl5Mak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XwaiYnxP3S+/i2s1MWb40ifXesKaQYmE5u+icgfYM1rEwe2nHaKN3nGElXPGhnMd32+uPZyWUfMFJfgf6ctNDjqFYNW0/G1Uoc9f7StYneCggcXN3Saje1hH/KibQGUcuEz4z63xyH/p509YSZUiCkXIGwvlPs0HzzjLmlSz3Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bh4re1UI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bh4re1UI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=m+IG
	cg8S2PNbdHOMlD4HmdwJVgpvkudUdaSBUvH0Fhs=; b=bh4re1UIs3wXZGuIY1Mp
	U0huKFwzWzdJypH/Pe+WU9YSMLhqZDVNO+DewqRUzQ6eGXAJgjauyM+XkVzUla+f
	WQKrxhSrSdGGFav+EzdujmllAKxeoKgu38jxf5NguTpE/AEKOe1uXY9KUkuXSB/B
	xd6P5clnXW4ZZJsBJtX8k/qlqNx/FrNqKJmO0X+VarzHN9lH7yeTL7tIdtHwqSSG
	O+V7xPktBSzwR1xKFaaJbadfEcT6f6UBS0JbloTlflBJUrdFYAGVJleLX9pzzZQc
	lT2N5Oj/MBzrpfVRqXCtm6aF+CXzONLyW7461iHKlSiwhpQIQVi9hX3f9XQdJf6z
	Qg==
Received: (qmail 979495 invoked from network); 16 Jul 2026 10:24:55 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Jul 2026 10:24:55 +0200
X-UD-Smtp-Session: l3s3148p1@crW9LLZWDpsujntt
Date: Thu, 16 Jul 2026 10:24:54 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org, sashiko-reviews@lists.linux.dev
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable GPIOs
 on CN12
Message-ID: <aliVVqnokN4s856T@ninjato>
References: <20260715122341.47838-2-wsa+renesas@sang-engineering.com>
 <alfNV-_Cb3WlqiHB@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8BQGfmeULC7Ogh7f"
Content-Disposition: inline
In-Reply-To: <alfNV-_Cb3WlqiHB@shikoro>


--8BQGfmeULC7Ogh7f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> > The snps,dw-apb-gpio driver iterates over its port subnodes (like gpio2b)
> > to register gpio_chip interfaces, but it doesn't appear to register these
> > subnodes as independent platform devices.
> >
> > Because the driver core only applies pinctrl-0 properties automatically
> > during probe for fully initialized device instances, this configuration
> > might be silently ignored by the kernel.
>
> True. Will rework.

After some more research: not true

gpiolib handles this, check this comment:

5351 /*
5352  * The DT node of some GPIO chips have a "compatible" property, but
5353  * never have a struct device added and probed by a driver to register
5354  * the GPIO chip with gpiolib. In such cases, fw_devlink=on will cause
5355  * the consumers of the GPIO chip to get probe deferred forever because
5356  * they will be waiting for a device associated with the GPIO chip
5357  * firmware node to get added and bound to a driver.
5358  *
5359  * To allow these consumers to probe, we associate the struct
5360  * gpio_device of the GPIO chip with the firmware node and then simply
5361  * bind it to this stub driver.
5362  */

Further proof, 'pinmux-pins' in debugfs shows that these pins are tied
to the gpiochip with this patch. It doesn't without this patch.

I think it is okay as-is. But I need to make another update anyhow, so I
will send a v2 nonetheless.


--8BQGfmeULC7Ogh7f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpYlVIACgkQFA3kzBSg
KbbkPhAAi0TEZA7foWQWPRdzjz6wKn+SqHwPsiScZj/fmC0C9yBo2rmXnFo+4EC6
YiofFpn0y1oDjR5Y6zpxaJ7xkYTFryIyQSg74raot/OOL2LwRpPNXesjFz85fnNz
IuoLTeO+JAUjVfZLxDmqCUKnvxvVgqgd62102hhIxWRFT0k9Bprr53LlnhRyia6+
9OVIrKULthTzSNqIW5x0HkEd3BszjUJf/ZaziZMYAp58QNIMp5vR6qRUf9wSxEaa
yINgQUMVq0h2gtxl5JYweAEzaHvD9ik8vQTUVj+zj+/pK6Zd01GQxmb/TrXJL2dr
eYltyipNs6JJZLGY+BSdnKid/Qte0dORdhtEho5SkTrVuCddYZSnmJyLX68hJsh2
SUGSO45V2SCgyiKtStjHL/0Fm+OaV+5Ots38kKpL/oPG1F6y0hzGLRRNWTc+bfng
UoFJU1ggCjHkFTzU9gLcbbAKb8isYyOd83XAmLgciMPWOkYge3CSOmtMLfWNlL2q
ZaFLF7SQDLUYYhI4+jpbavpq8rbjnRk92cdSLQXcAwkuFFldnJYjNBUt4hfEYBGW
S6BJKLpgjhjZ8Tty2z5HZQE6ynOtlT0Z+qzDI10U56kcGZkIRF3IAIicSBemzdDQ
Z2tqW1UyBUZwWqi90nJ0MshKfCKw148by/sWK+xprObdIc67YKo=
=6KMV
-----END PGP SIGNATURE-----

--8BQGfmeULC7Ogh7f--

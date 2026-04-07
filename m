Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB28B26F46F
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Apr 2026 10:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557428; cv=none; b=FnZ8+qaqvh3rYCEDCnghWD7CPhg/pgHnUjCHnyoeab+IwKqKoqvAXZfTCeVCR9SkQrOiCcFzB1iyLoql/IklBwp7IWgebbASch7RBo7JEHAjnlRY6tog+FhqPeogK3QG9gIP4wlafL47G8VlVTACIzJ/5DmPrPm1Am5WSV3qjHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557428; c=relaxed/simple;
	bh=dfXG+jQlKcyTLXDA9CIPvtBGyxH35ZHNG/YcedSTuVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aVCxyaUWRoEU/nlhg6JOmm2upP43PuV5rbkOpTdUPsTTc/uzEiC0XXRGXLkurrye/6szWf8mKBJv5MMYVmWK+PsBtwbzg4wC3FRritZ5N4PYv3lpS5oN5cTrK9+iEyPeSK5vc1EZwmBvCgX/Q2WalgknQ9fTqysKCRyRjKF6LfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HtqL6xq0; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HtqL6xq0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=+3cI
	JKMkt/1wfbFPjETEm4fFjmCjhrnqDJYVqTQSjRw=; b=HtqL6xq0r4NXUvJBmyUu
	1reYLIcT5KDzkgUF0ARC0ht7IEfmkQ6St+DRtGlKcnD+8sRSJ6CDoHBDC6MfGDnK
	4361+fLmG2OZWDHTSB2bkjySnoOzPIU0Ed+sL/jr0WUWj8dsoyxuxTv0aZ4ju8Pd
	qkQ5LDiq8Q3SvwLf4ZnVh1hHDPvyyQmRoU8E4NhaxDUmhnnKXNV2gpVjQb4XT4pd
	fLv5XWusLAOJgGpj0PGqJWU3rTqqT8aPDbnxUHuXpt/mPY08HuvOd9gzvuC3A0kt
	3xLohgPJw0TSV+Ca0eT9dUsRjKR4dAR06FhB/d2fXtMAtVCnKwlp1zooRG7A3EvN
	fw==
Received: (qmail 4191889 invoked from network); 7 Apr 2026 12:23:45 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Apr 2026 12:23:45 +0200
X-UD-Smtp-Session: l3s3148p1@E1WVLdxOapsujns2
Date: Tue, 7 Apr 2026 12:23:44 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
	Mark Brown <broonie@linaro.org>
Subject: Re: [RFC PATCH] mailbox: don't free the channel if the startup
 callback failed
Message-ID: <adTbMCsgwpqVYADU@ninjato>
References: <20260407101714.39990-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V58cR35/KIcRZX0g"
Content-Disposition: inline
In-Reply-To: <20260407101714.39990-2-wsa+renesas@sang-engineering.com>


--V58cR35/KIcRZX0g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> A second thing is that module_put is called. This should also not be
> done when startup() fails. It breaks the expected symmetry that
> request_channel() gets the module and only free_channel() puts it again.

This part is bogus...

> This patch is RFC because I am still somewhat new to the mailbox
> subsystem and might miss something.

... which proves this point ;) ...


>  			dev_err(dev, "Unable to startup the chan (%d)\n", ret);
> -			mbox_free_channel(chan);
> +			scoped_guard(spinlock_irqsave, &chan->lock) {
> +				chan->cl = NULL;
> +				if (chan->txdone_method == TXDONE_BY_ACK)
> +					chan->txdone_method = TXDONE_BY_POLL;
> +			}

... module_put needs to be here.

Still, not calling shutdown() still seems essential to me, so I'd
appreciate comments about the patch still.


--V58cR35/KIcRZX0g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmnU2ywACgkQFA3kzBSg
KbZQbw/+I6auViezfuy+rZldHXpzINL0fu8RtGDe04xgOyuR32Qg3AKdE4XPPphp
IEOLI38EVbhakL0Le8jGflBJ6X6/VxPunZIHVkqqz4FHjZ5hu1Poztpbh+otT6WN
+KOgAwWk5jPiMiaM4A5rowYpPP0Pk1x0XzUJeE0r3EODSihscAyAtGhVg+KbIQO9
U5yCyXCVokTyB1WkHGLYQetIh6vVUGsAsZVV/+jkjmtKfzSN2XMW2IgkkIUWbNzj
UYD8KYUWiDkztD0sRS4MIj/Rhnvs24sQ377Zwh7CdvxxRekfjlf05KpKR90ZoTsg
oUnndmJnk7ma+Hcy6mjpts3TX1+SG6/J8o1eG+yOnndbI4GICqKFZm2uZcJdI4HJ
HaelUebD2KQp4wBEnn1MJKxlXuo0hajGBix4RgzuemfxuFFEDLlivfCuKx+ioaMu
ULmv6rrPFqtBJtixox4ExPBO6CdrKJ81kaxdoKEIGbaM+R4/F0OMtes0ECLQOBDh
/QlyWjM52gkfLCtz47AxheyBEnE4KghtuRjkVkTkXEk/T+XJmb/B+wvplRVpLXCp
xzmTSjgGNyjWJDKxSnn/DQG68szh2yf4fbBpqTCtELKkaywUJGDf2PFlKmkoiBF9
8nKAFOv3xxrMZawGDuJyCv0OMX2wCe9E5r9HGFkCITgtaDm/9Mo=
=GabT
-----END PGP SIGNATURE-----

--V58cR35/KIcRZX0g--

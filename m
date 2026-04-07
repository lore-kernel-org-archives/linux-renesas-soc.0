Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1FE3A381E
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Apr 2026 10:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558183; cv=none; b=PlVGR+d6E4SIVmdU03OOPOLUO1BfaTG7yLQqpbt0m6PjbBhmyujfEnHCOylCJpoeefohFiZGp2Ae5FddOQ2PZVkPoyzyucZUYVTEvsFEmyOOofQ4R5TJmSIK+tevY6tHGaXnMKfa9HZ4PbH9EggSAeMeZoGkgMMvke5VaN05UaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558183; c=relaxed/simple;
	bh=CPvjmKWdu20rOw0DgyI/PkBx05k78qrl1YfZ8vdIxac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QIl6XZ1H9012EXwd1i3tyeFqzXIVqip05je6ThtLXWPhR/FzJnrfjGDu0nB3O5Jf6PMhr1SRxmjyV2VhM6wEsYj2zS4p5vwx2yC31jVoLaMBr8cjAWL2zwu+2cHDgTKyHDI7e9ycILaBICAnViV8n9O61P+GnY2vcNnN08EAdjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PFz+C8L2; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PFz+C8L2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=CPvj
	mKWdu20rOw0DgyI/PkBx05k78qrl1YfZ8vdIxac=; b=PFz+C8L233CYU+hs/rf5
	6Tr7mLP1qB+f0Ny5qudKXLZfxfJBOJpjHy0qjoJHBaxfdxGhLJd8uwAq2Vkn1p82
	UbV50Arb1y1iZ6CnmiZ19DCZ0t9CYaJY0RFlebk2LKyaNp9vtsG+i+lvIxGujgut
	4JFmbhoUiNZmO8dFHMugVofZL2CcqvrWaNalgjaGMBv4ZZaO3ARFyTtVoVXBtnhL
	0m2fd77Z0dl+qZ0Cky85CzieNodRvjkdS6g4R3isTNrbeOzh0ZtGIDRHY47lrH7e
	VpDKwBwuuY3Hut5K2pWNS6nkO7vgV7KikXWv4l98uAJPXFxkINtwxk7grCoKU7h1
	oA==
Received: (qmail 1784 invoked from network); 7 Apr 2026 12:36:19 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Apr 2026 12:36:19 +0200
X-UD-Smtp-Session: l3s3148p1@kF6TWtxONsQujns2
Date: Tue, 7 Apr 2026 12:36:19 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
	Mark Brown <broonie@linaro.org>
Subject: Re: [RFC PATCH] mailbox: don't free the channel if the startup
 callback failed
Message-ID: <adTeI0ea7cQ8ZNUB@ninjato>
References: <20260407101714.39990-2-wsa+renesas@sang-engineering.com>
 <adTbMCsgwpqVYADU@ninjato>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mLTh2P3Fnw9fmTP7"
Content-Disposition: inline
In-Reply-To: <adTbMCsgwpqVYADU@ninjato>


--mLTh2P3Fnw9fmTP7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Still, not calling shutdown() still seems essential to me, so I'd
> appreciate comments about the patch still.

Another option which I discarded but maybe favored is to introduce

__mbox_free_channel(struct mbox_chan *chan, bool do_shutdown)

When startup() fails, it is called with 'false'. mbox_free_channel wraps
it with 'true'.


--mLTh2P3Fnw9fmTP7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmnU3iMACgkQFA3kzBSg
Kbbgzg/9HeL5p70c2fuy11aCxTHOhy7K90S4st84RvMjCJzDMJSaGx/IzvdBZXzf
HWrLkqpgHtqldmjfD+MBwxkII4UOmpBmFZP7UovA7ySKuppVaX8C2WSXH3vBe4GY
VgdJHOnHsGAfI8np1qHw59BL9BIxtaFUHBj6YrsJJf9+qHEzmdxhursOxR2aTy7w
0Nvoud/0miB4qrfMcKljPCQuZgqDcQlC9EOOgkrrN6XMg5irL33jN3EMGkQYSAjE
B9f9kRw1+rw07oJrFOte0h92plYYF0Jy2pvLEDlHAOAaXUh22BT2uO49VcG14tAU
rTycH27Wv+PVmFifug675E0Atuy+KEQhAHvYo22NTPg/1BeH0FPZAb5mV8VAQEuE
RKFWugHjxSRbNIonm7kEwHej0IzKdYc4+M19hYTc457Z2EyfzNRq2ont0hh4mBKz
Whq2blKt9Yol4yMdkwWkmsBYavu+WOKkB99sByG2btasmMeT3xrFG1KJAQ2GWH96
jae9NQtioRKfkS9KjUDG1z1yr/un6zslBPSoKF1oN5cQTgvOnEy7L/rTo/+Xi8DI
MvMMwxqKlgqm5Wp3O6DUtCxuznxNkZ7MNBxdBxKv1O9Elw8AOAl+dn0ToGubmizl
24BXvplcKT2N6EhgvV08jEwGnHEPvD66OboKrRmk69R5Cg3eBBo=
=T8/t
-----END PGP SIGNATURE-----

--mLTh2P3Fnw9fmTP7--

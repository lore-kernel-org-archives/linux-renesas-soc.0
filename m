Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429293783A7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Feb 2026 19:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771357156; cv=none; b=JrgdieYHjWsHIeA5HNZn2wsdWBNUDpZm+SrhDFAniC/UgTBTGFuEj0PtDuNFwDGRK+M/xcb6XpbhPkHvmjPDfSdK6ry9g8aQAKeiG6n7+3KQDJE0CE0tVwslAkWaV6yGeG6twWrRwW9XE8ZRW/xklsGyBLiicVSIW4swObQCQ9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771357156; c=relaxed/simple;
	bh=IK18cBySaPurfrZbZnqDlwYTaCTdfRgdlhdXcdigkDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWq28LaIVo7Tq0BfQvARjshDFC8IJYDK9kWeqLv0AxXong5KHpyj30U1qWSpzvIbiRnbPsd4yx/4norTM7Hc+3EwTb8oermZpc0SSMvWUj6TBWbUv75lO1gJKOpjtp5AduWBziE1uG3MhB79KuDm53Gv1/fGivB6x76lEw0rnC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=isn8ONMQ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="isn8ONMQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=h7RC
	KHyaRPjRE/aGdOK1ICa4hrZr4t33OdR/svNJ55A=; b=isn8ONMQO3Q7JZl8HWVZ
	cLVlD6R2rYhfwWYOjSE6vKZW2A89/7IsFWR+sAJj7kD80TWVT8dOXrKROVs2nNM2
	2E88EbDboalhWU9dHIimAdkMzBd2YsK+sTaQLsUO6xNrgpF1HNAE0tPXJsrVcMeL
	QUkTQ/HhaSEdKfPmbXY3HR3VwQOriKcFgbtpIZg2zNUhlOKoWxpsfqiYriRuelfE
	PyZ6B+nvYOHH6VJWcJecYGPGRdKEE/2pYNXv77suX57ubuhyGjoryic29eqOC/RY
	Qk66yrMB4pwmtc9M2U2yD6iEuu0K3jlxVPKeMLSOVeB67A+Fge8MzkrsBhGItxnp
	9A==
Received: (qmail 3811238 invoked from network); 17 Feb 2026 20:39:09 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Feb 2026 20:39:09 +0100
X-UD-Smtp-Session: l3s3148p1@nNuhOQpLupcujnuy
Date: Tue, 17 Feb 2026 20:39:05 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH] mailbox: test: really ignore optional memory resources
Message-ID: <aZTD2VtM6CX0NcvW@ninjato>
References: <20260217140614.64581-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DfajdkElKpmso02X"
Content-Disposition: inline
In-Reply-To: <20260217140614.64581-2-wsa+renesas@sang-engineering.com>


--DfajdkElKpmso02X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);

This breaks using a single MMIO for TX and RX. I will work on a better
solution.

> +	if (res) {
> +		tdev->rx_mmio = devm_ioremap_resource(&pdev->dev, res);
> +		if (PTR_ERR(tdev->rx_mmio) == -EBUSY) {
> +			size = resource_size(res);
> +			tdev->rx_mmio = devm_ioremap(&pdev->dev, res->start, size);
> +		} else if (IS_ERR(tdev->rx_mmio)) {
> +			tdev->rx_mmio = tdev->tx_mmio;
> +		}

--DfajdkElKpmso02X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmmUw9QACgkQFA3kzBSg
Kbbd+xAAjS5DrAStYS44CYXdixp9BGe+4A9BXJSlQNlV1N4hp+cT5Ef5JZHfBkCI
ZwGztnwOBEO/UgXHqIbSj1bexBMJFDk/D6Ng7WEUVVESznkSWsfmquH88nL5KCiQ
hmBG5TMERcQ+r5gveROE9vxeXqxzLhNLY1lj6YCvJmH1RR7Wes5KE0Ig6GxD35gZ
fOeYFK2Vu3W5CwgMyU/AmE7SDDYt1+t5kJ4jgyIjkE0yU6W5wGyZmHQjYZ5m9D0i
Nhl2qEY6Nkm7Aza1PPyB7k0Mt+qtf6fUkcWr50neBjBl4zaSQT0IGBZdH9gRsQlJ
CDtegU18BBI1BwTSbAaiUlDE8dQafFJVuf+cGGfi9XigT6gcAPodyFV3x59LO0eM
SuQiSiVeqHAxTCapYoxwkA8Z58YB2O1mV8G+XRg0czrUJlVnaXF+/lRDI6QMtMhO
hzpxo6ipktWExV1RgPh7y7pcAHxVsYDg1gL534twPV0LJZDxYhdOhMmSbyfjkPzw
FXkg+W3R0gWQcE2IevLdDXhnVGoXufx0PrZ3Y/jl0Y/wWLKgb3csv0THXiidDf9l
dgaflh6grwqhyuxUZo1gmuAfk92Wy7kqcp73xB3QG24+YjUofFYNhouAOZk23H0p
3ai64VeCh+mTFClCoQM7gpvs8H7zdRg1TXeOx8ZqA8vJEoHCfIQ=
=o3fu
-----END PGP SIGNATURE-----

--DfajdkElKpmso02X--

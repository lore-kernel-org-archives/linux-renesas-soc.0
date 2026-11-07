Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794053239;
	b=iNnQtwrnz2cmZvB6HdlTWPrjPjGq+ES/uW3e2f5dmC/4+kDuWuuMPeUPdLUHEkWUyP22
	 K5dN7AlekE/8nlUaz0jkvtC/VyxAF12ZZhZcw51HCsYjib/mnqK/KKf0zu7O5oLTBkw3C
	 v/02Gu2elPj/LBmJwHdyGnhy8rVRJREvlvID5B860IJIpXyy8LnoyTnxUlO9rtDevA6xO
	 a3NNZg85lRcVl8uxlJDUkbBmaEa3qvjeVbvHlCfVVa9Xe91IxlAaXLfMxMmAlYDNKpzQD
	 HihvEEk99QTSQFLYnLnfUSgVkw3GuD9WPJu9hH4wls9vzxhDsvR/sx2jtZHLuOACqZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794053239;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=+JzAAS2x7fEgbHj5CSPAlBmEsMb1voacpQwNV9Y9qUg=;
	b=AMwveITt+al6Nyl74g+bm1AQWJZ9h/+9Ur2LT+s4LHeK55GHUuvhnAtsq1sKFdjV/dXB
	 b5ktFI01kFAkLdNbSfbQa6rkgoefMI3J9vVOgeU6Azy4ERunDe4znHSy3t9zrQUIwG21k
	 hkRip67kAu7Iu8Iya8D6Pjrj+60qSHgcKzzMq6p6V40EV61Lf9aHbs9canoTuQU3iqd/E
	 BfV1IZqp3qhCu20cpZ/6ZJAbuafdLaAh1kH/kYNj5AMjFNoZ4NxroToKCUhfx9UcHCNt6
	 L7QpMu7kmXEhdLqzehmhtqX05tBhP6VXYwmiWMXzqk6coBeobRJ5NF/ntO2IGmTuZ2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=ZS4DGizJ;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FAD606A326
	for <linux-renesas-soc@vger.kernel.org>; Sat,  7 Nov 2026 12:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82FAD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=ZS4DGizJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=+JzA
	AS2x7fEgbHj5CSPAlBmEsMb1voacpQwNV9Y9qUg=; b=ZS4DGizJg2JMziQKWdUe
	5b6m0XZW/yxoRaTTcXYHA3d3NNvzTtpREB++8w4NZGtdpTnZBOpu/ss/xWhJ2jfb
	X532v4mHws8tRyRNzs5EEVOZ1J1c3tfgKrNYV33gtNKcOf5XIimeGJiFCqFbKyTK
	yAjK8Rl/uE6evJT+W0ZnnIezMn35UN8VOpZSe5pBYPGlIrYhnS5/V/sBBPnUmouZ
	WS9vQR0dYvCH/a9blkuwwYB3Dvdry4GKykTY+3k0NJYIrx4Eunx+uSQdH3YGBn+r
	RFNpqRCt6bKX8PEVG8rrbbOLSEs6rczbZvhmyS7uv8hHeLD5RZSQwxh3vSxVne5X
	wg==
Received: (qmail 2468557 invoked from network); 7 Nov 2026 13:07:06 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Nov 2026 13:07:06 +0100
X-UD-Smtp-Session: l3s3148p1@jMpAka5fxLJtKDBm
Date: Sat, 7 Nov 2026 14:07:05 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: dmaengine@vger.kernel.org, Frank Li <Frank.Li@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 0/3] dmaengine: rcar-dmac: collection of small missed
 fixes
Message-ID: <au8UZSg9x9PlXG2E@shikoro>
References: <20261012123020.11320-5-wsa+renesas@sang-engineering.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lugVjYw/nM+zy6c1"
Content-Disposition: inline
In-Reply-To: <20261012123020.11320-5-wsa+renesas@sang-engineering.com>

--lugVjYw/nM+zy6c1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 02:30:20PM +0200, Wolfram Sang wrote:
> While working on this driver, I found that there were these small fixes
> contributed in the past but they have not been applied yet. So, I
> collected and rebased them, added review tags and minorly improved the
> commit messages. For v2, I addressed review comments. Changes are
> described per patch. Please apply.
>=20
> Tested on a Renesas R-Car X5H Ironhide board and R-Car V4H SparrowHawk.

Still applies cleanly on top of v7.4-rc1.


--lugVjYw/nM+zy6c1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmrvFGUACgkQFA3kzBSg
KbYR3g/+PHyuXagUR5COmfE2uNTJYlMovD8BwXVKgHfO6YCIXv4zlhL3Mgqu/+iA
UmQ6Z6IxHiBUB76bLriNTuAnrQTA0daGJFva+PQoWD1Qql1lYhGb5JHRga3mCp0t
iTlttbhCxpQoEoGiMu4bzBGDaxgWUU7Ok1KKWeJ4mPFih/PKF1X6XizW7AuERg5K
SXVoXFvAjDk8xI1IYdQSWjHj6SF4Jer0a8v5G2FdvCP7iQOnjgRPmt72MAc993i/
sWbky8Exj3AFxbbeacYDnLYRKuHOeVEM8uY5Ku1yHqc8QIjOHJZBzNZI6m5WJPpU
Rl3A45E5mS3Tc0HZmA+5SIcEXv4cKr3WnjQwK/MCIyHNd243Es/ab8mM003fMsqs
bNMA5Zs31PtOMF1gBpEuQ5ZNJdOOUWxDePCUVDTeACjYYiJWG3IviDN6VlhIRB/4
xt6pMzwOULO8iX4yq6Kb3///fyjnxPfv5Gbada+D4edIKUOXqN8Iwzqsb5BzReNz
EnoRw3VNEDqBT9J4Hztn8+//1+G2XfgkESrCzJfgiDYAMFBkr3iOtri0SNTumqoN
Md1eJRsn/+CMyd44EQTAKUqIWXNX3JpszgxuhxDINNOR6/l1QkhYknW34RtiIjKr
o0kfYYhCQn0l/LYbx1yNWCJDCnfe+eCP6bXm91/Hht4oQ7T43sA=
=RsFD
-----END PGP SIGNATURE-----

--lugVjYw/nM+zy6c1--

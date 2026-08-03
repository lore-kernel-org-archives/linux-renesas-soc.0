Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C85345EC8
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Aug 2026 07:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785742809; cv=none; b=qdLUSOYoBlLJ6z07BPuFOxS6RviZbg13jbL9Flv1vXLZHumijxU9bdIyFvvdGJ9nVD1gh08YyACTqVlxL0Rl+7Wwm1nDay7TrHoWV9krMJiIJW/nWiJlDBZQd2OGBPorRfhdNkG/7JZs48t28skBs1NXiHLvE4yACQpBeQ9c+oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785742809; c=relaxed/simple;
	bh=0HljTYdCGcFVMCod8zygYvHUQ0C87lBSE7qZYqKH/vQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iZsgy22USxpgeeEyAQdZcpJyj5Ir2XsAL69JuupdFbfxYRVGTI5fgdeBT1rukfIqVx5GQMAmtmdhHQDh6vR/AmxYM0SuV9R8+Doa2Ix+Hp43tySA/wtGCcB3XcaumPFz1h5Lg0ALpN6QzyQJ8+DPHnjpN0n8ElZ4Uey6iMgaNcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Vl/VebxI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Vl/VebxI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=0Hlj
	TYdCGcFVMCod8zygYvHUQ0C87lBSE7qZYqKH/vQ=; b=Vl/VebxIeCMviV5x1WHg
	r1mC5PgLL6Q/29Ngobg/hujOtjawsAT79G5N77mRJ+WHXfaJim1oEsZkAUIVfckC
	Lh+Ik0nEXr1Tqn9WqlY8Bgf3KvqiQyAfMll54Crymhcte8999UrGXFjcLhUvFcGs
	iJNAMn3wQvQ9Uz4xfERvBbgQDExB4JLMxE/SoAuI1WZe00MR0TVXehw96LXaUw+l
	E8i1k0/OWZHhBAoBJEJcNMXlKw/Fmv29YVYKaYmOiIPkUxolo0ymryDby5wH0rnp
	SEGy2GIa9DeNHXKdfv0kptYA0Afx64L+HChxVYPXYLDNFHg/NNCQvAh5WQzFCBdv
	Hw==
Received: (qmail 2948613 invoked from network); 3 Aug 2026 09:33:21 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Aug 2026 09:33:21 +0200
X-UD-Smtp-Session: l3s3148p1@xIB4jR9Yvp4ujntL
Date: Mon, 3 Aug 2026 09:33:20 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 6/6] memory: renesas-rpc-if: Use runtime PM
 autosuspend after transfers
Message-ID: <anBEQJ4VAaZfsUTw@ninjato>
References: <20260727103449.3188105-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260727103449.3188105-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d3Mhk3lKqygFcu9s"
Content-Disposition: inline
In-Reply-To: <20260727103449.3188105-7-prabhakar.mahadev-lad.rj@bp.renesas.com>


--d3Mhk3lKqygFcu9s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 11:34:49AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Replace pm_runtime_put() with pm_runtime_put_autosuspend() after manual
> transfers and direct memory-mapped read/write operations.
>=20
> Flash page programming may be performed as a sequence of closely spaced
> transfer operations. Calling pm_runtime_put() after each operation allows
> the runtime PM core to suspend the controller between successive
> transfers, introducing unnecessary suspend/resume cycles and potentially
> interrupting multi-step transfer sequences.
>=20
> Use pm_runtime_put_autosuspend() instead so the controller remains
> active while transfers continue, allowing it to suspend only after an
> idle period.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

I tested this series with my SparrowHawk but it doesn't use the xSPI
code paths, so only this patch is only affected. No improvements, but
neither regressions.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> Note corresponding pm_runtime_set_autosuspend_delay()/pm_runtime_use_auto=
suspend()
> calls are already present in SPI driver.

Unless I am missing it, there is no pm_runtime_set_autosuspend_delay()
in the driver nor in this patchset?


--d3Mhk3lKqygFcu9s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpwRD0ACgkQFA3kzBSg
KbZNKA/+M8ti7cYOvVQOWc7jd3tv3gM7luc8Lt5C95zmR+dO3ycLlxcu8Tgvvac+
JS9mJT7p7PpPpVOfyg91AxywpHli5GD99LeiDl2JOWNQPoAybhVkzYVQIxjyJI2H
TZZ8CzAivqvChP4hYmlPcM09UWTzqAki+WGQw/XyQP4d6z+x4soz7VmaQFANhStl
QmovIBvmnU8Ln5p7GagIaiAWbeJfbIA22FzTQWwRLgVvsruhXUrNMd6S/ogeVQik
rYDjEy0mgug7dFm7pyFOc6mvBeKvx7dud6WQbdjk2JBMvjiByKpzWx1vJ98RrttQ
web/JxUGthcarHHTBilGkCQZZoEW+ICgoVHeSRkP80B7ADut1yB1bRo362RF49Nh
arwe5jnuZphh4GQtFBGr2g7I6DbwFC7IlpxgZRPoOVgYB1vyYHiGnS87uRqB7Tzg
PyHYlWPa4XjSE6GxVNU9U95H1zXGYLj0hqeuBiiug88x3dhJNgpaHdQP6Ov878z0
4XCU2sKjiBJTBaoFTvNwMhpcRcmS5wREqv7f/n7+xVPU7ykU8DYlqX7u9vU0f+e/
rEibQNBEk9LtjjpaCbm9mu91Q8ZnVdUoYjnjZnzOWio+hlbsHbkhaLB8AVKDCg6n
0Z9wzbc4x2EBDuOyIf4hfxeZtO8B20FxO/9l39D/706XvYWLTto=
=r0Yh
-----END PGP SIGNATURE-----

--d3Mhk3lKqygFcu9s--

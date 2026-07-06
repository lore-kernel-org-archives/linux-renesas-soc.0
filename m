Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D4F406820;
	Mon,  6 Jul 2026 08:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327965; cv=none; b=UoCAez10FlTdoioA7wN05gd89Hnb88i0tND+oJArzrUuoWkuBwSi8FefFNXzWsxiNVyzDJsA0fZC+neGQuohHo0SqRJvOVEm4QuUWPpJ6VShyCEfT+CiPmcSvvTOSk/RvSJK94zpxnTgAgHS5CfHvL+Fm23slGrAU8Pxy3A8BO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327965; c=relaxed/simple;
	bh=wIgTYuQ7l0g07yaHqfXyOdwj4xENzmwI7JEobCJI7VA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DYAM3wQ3UJNIEv04dSDgSsdbkOdt2bQcrXwPB/t8wlQh/8QbfWLA1xnuz7c8Ywr963q3ntQBPB236pxuWNATYHnJi3P+XOj3mer0UlYCdAcYtUylmAc753O6dH9dM2hjTXvbUX/0dhuu0ego4z96OpCGdFk4JRFJJdFpC8b6/7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RLOO8DoQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RLOO8DoQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 412BA1F000E9;
	Mon,  6 Jul 2026 08:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783327956;
	bh=wIgTYuQ7l0g07yaHqfXyOdwj4xENzmwI7JEobCJI7VA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RLOO8DoQdzaIda/SCOUZkb7TZDmZU8+VEb2miT3ha6NG/chlSw9oPS5iFZs+3FN+H
	 ss1CRc7OnMp9UOKGS1o9kuNv8H+1WnAXgfMZL1xmi1//PS62mRhyUFxFEYFJL+D/1o
	 xiYwfpJZZ+NfzcyQ7+yCE7NEbf16+AkAWuqVa/gUXNnPiqb/davqw58D/0MpB6YD/0
	 CHy4FCrsaWs1rBgkqGiUqyGyo9FDZsOA8tjdAzLb1LyGVP9El/x+zSrRRkPx1xFibX
	 fCA0bNZfLZn3cl19Fz14Q9+v2TA+kMfm8TTDKAVHZzs6mB9OCeZO3REbsT1q+LPdHr
	 1UWcRfCM06mdg==
Date: Mon, 6 Jul 2026 10:52:32 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display: vga-connector: Allow
 hardcoding EDID
Message-ID: <20260706-capable-beaver-of-excellence-a3cf10@houat>
References: <20260705213542.28987-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260705213542.28987-2-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="jpva27qzwjiuqi3k"
Content-Disposition: inline
In-Reply-To: <20260705213542.28987-2-laurent.pinchart+renesas@ideasonboard.com>


--jpva27qzwjiuqi3k
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/4] dt-bindings: display: vga-connector: Allow
 hardcoding EDID
MIME-Version: 1.0

Hi,

On Mon, Jul 06, 2026 at 12:35:39AM +0300, Laurent Pinchart wrote:
> Since DDC version 2, introduced in 1996, VGA monitors have exposed EDID
> data over an I2C bus. The bus is also used to detect the presence of a
> connected monitor by trying to read the EDID data.
>=20
> Some devices where the VGA display is integrated in the device and
> always connected do not connect the DDC pins. Some development boards,
> such as the Renesas M3N Salvator-XS, also do not connect the DDC pins.
>=20
> To support those, add the ability to provide hardcoded EDID data in the
> device tree. This is mutually exclusive with specifying a DDC bus, and
> can only be done when the VGA display is guaranteed to be always
> connected.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>

This feels redundant with the EDID firmware loading mechanism we have in
KMS already. It should at least be mentioned why we would need to set it
in the device tree at all.

Maxime

--jpva27qzwjiuqi3k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaktsxAAKCRAnX84Zoj2+
duZWAX43C0adUSkYo2BCyUyrRlzje+lQ2rlOLgawSEEJ4RdYIn1llvkxQUUxz95n
cjgoCQcBgKZkLYlZB8XX1RTuVKcL/FZXQVybRx4SAV+4U5ftuAUjRItDGm9NzAfO
rM0iCuQS6A==
=EqG+
-----END PGP SIGNATURE-----

--jpva27qzwjiuqi3k--

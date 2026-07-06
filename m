Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9FA3264EF;
	Mon,  6 Jul 2026 15:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352434; cv=none; b=jurNINUZKpysxvjgW+aYcN/TVGyxNGYKMIdMeaUwbv6bAbHCEGHZnNqBGAlM1AoutkAy/YdHt/tARnBfHvShynCLYA+PMSqcKvJeD7SUrvCChSWLhGaRqUqcRO6Sn/FQWHxpeDoV2xWRQj/56Q2ZSz7XWShvUNvELGeYZItcCqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352434; c=relaxed/simple;
	bh=sq9myvMBUQkbRyNRLO5CYLPkeIVl5NyZugHb9gwmj6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rc7l8MwKrpZbPyU7g8KT1ST9IpNhq8VeOqTN6USuthlp+B4dQbNoSCHPPUzDJlw5CKH8l0k79dXa+wqvpUXuwh6wcsHD/zMXRxNvEKbYIpnD6exM+PLPcZUKaLijsnaY78e4QQBtX69+4mfyoa2MkC3syMt/n9eknjY8/VZxK0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ooaw4qqN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ooaw4qqN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 832591F000E9;
	Mon,  6 Jul 2026 15:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783352433;
	bh=sq9myvMBUQkbRyNRLO5CYLPkeIVl5NyZugHb9gwmj6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ooaw4qqNCGvTrWxYIfRFfWAtkuCsiDDA2I+tbf1K2FpTUWL22L5TkByhLoJg1RoUm
	 b1HTCBb97IDpTsU7/+fGGbtaKnKJlnthSTw1FpLpDwYiLdvIrOrS+FuSSHkXfUFG0h
	 OCjCwyvYsvBobG3vZO84nxDvDhgffPjt8ZmA3C9qlHEnexvMqSTSc4DUZjeHP4gUAV
	 IVOUw9aM7IpdRGCp4ISVjHSyJiBaLUwJqtaG0ES88xEePxpt7CIltlWbcjcQBXiOmD
	 g0foH6m+kPb0R8Q9fauNTg/hJhf1JXziofKiOAs5f0gShmioW8g1gxMFTWqsvh5Pfz
	 hQ5dSRQnEH6Rw==
Date: Mon, 6 Jul 2026 17:40:30 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Message-ID: <20260706-fancy-perch-of-satiation-0c220e@houat>
References: <20260705213542.28987-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260705213542.28987-2-laurent.pinchart+renesas@ideasonboard.com>
 <20260706-capable-beaver-of-excellence-a3cf10@houat>
 <20260706094522.GA42740@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="tpzfirttked2lrai"
Content-Disposition: inline
In-Reply-To: <20260706094522.GA42740@killaraus.ideasonboard.com>


--tpzfirttked2lrai
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/4] dt-bindings: display: vga-connector: Allow
 hardcoding EDID
MIME-Version: 1.0

On Mon, Jul 06, 2026 at 12:45:22PM +0300, Laurent Pinchart wrote:
> On Mon, Jul 06, 2026 at 10:52:32AM +0200, Maxime Ripard wrote:
> > On Mon, Jul 06, 2026 at 12:35:39AM +0300, Laurent Pinchart wrote:
> > > Since DDC version 2, introduced in 1996, VGA monitors have exposed ED=
ID
> > > data over an I2C bus. The bus is also used to detect the presence of a
> > > connected monitor by trying to read the EDID data.
> > >=20
> > > Some devices where the VGA display is integrated in the device and
> > > always connected do not connect the DDC pins. Some development boards,
> > > such as the Renesas M3N Salvator-XS, also do not connect the DDC pins.
> > >=20
> > > To support those, add the ability to provide hardcoded EDID data in t=
he
> > > device tree. This is mutually exclusive with specifying a DDC bus, and
> > > can only be done when the VGA display is guaranteed to be always
> > > connected.
> > >=20
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboar=
d.com>
> >=20
> > This feels redundant with the EDID firmware loading mechanism we have in
> > KMS already. It should at least be mentioned why we would need to set it
> > in the device tree at all.
>=20
> Very good question.
>=20
> I assume you're talking about CONFIG_DRM_LOAD_EDID_FIRMWARE, as the
> debugfs override_edid feature isn't meant for production. If there are
> other relevant mechanisms I'm not aware of, please let me know.

No, that's indeed what I meant.

> In the use case at hand, the VGA display is an integral part of the
> device, the same way an LVDS or DSI panel would be. Using
> CONFIG_DRM_LOAD_EDID_FIRMWARE, the manufacturer would need to set the
> drm.edid_firmware command line parameter, and provide EDID as a file in
> /lib/firmware/ (possibly in an initramfs). Beside the complexity, and
> the fact it won't be very friendly to people who run a different
> userspace on the device, I think EDID counts in this case as system
> description, the same way we support specifying panel timings in device
> tree.

It's *some* hardware description, but you have no idea whether it's
actually the hardware you're running from. What would be in that EDID
anyway?

There's another alternative we've used several times already, in
simple-bridge for example: just register any VESA mode up to a given
resolution:
https://elixir.bootlin.com/linux/v7.1.2/source/drivers/gpu/drm/bridge/simpl=
e-bridge.c#L66

I guess it's what you would do with that EDID anyway?

Maxime

--tpzfirttked2lrai
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCakvMbgAKCRAnX84Zoj2+
dgK7AYCeOYF3c0NZpI970cu+5GFGs5suqhHnO75/KQE5k7Q0HURhHfAGGF1k1ASy
Kzh7Xn8BgPSqaEpt7A9lKOPDUcZdmfuuSQQSFJ2uzQAj557UJ7Fj3xU6BczlxWJB
0kIM/EaNow==
=7U19
-----END PGP SIGNATURE-----

--tpzfirttked2lrai--

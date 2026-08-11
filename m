Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C65744C4FB;
	Tue, 11 Aug 2026 14:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786460089; cv=none; b=IURklqiRTMXcN1j+YNLZmxQCq9x65T1Lf5VhL2D8OICr/OoqhrR+1ugbcRL1bxKiz11/xRt4UjspwFnsu1qJGwsv9D9bWyk1LBnHU384qVqWhfhaNZQ2uylS1AlwGN5/BdgECJtCQmDMwpcQeH0QRKjjsvtoCFbbZ3W+DUn+Gao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786460089; c=relaxed/simple;
	bh=mJCYBk04d7QN2ruzGE52+bwVYK0VfiWCVXL0oXJimGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=prENC2aF+getrxQ39iVy4dM0IE0IVq1gplsSJCMZejWhMCxPLjVsSmJx5dENnUJL4qZ3qEIr2tE7KzvZikCWhh5TFNev7c8LR9Zq6qSS+ABRDeZY1yi3ThdL0m6gx1COaAknoa1oie8oW7AaCW22J1/LtST6uir8IZ8+TWyoaQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QIgpNoyD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QIgpNoyD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC5C1F00A3A;
	Tue, 11 Aug 2026 14:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786460081;
	bh=mJCYBk04d7QN2ruzGE52+bwVYK0VfiWCVXL0oXJimGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QIgpNoyDN+uPPxkPJtkUqTbnbpkZG7p5wB0UyJ3yf1+gmao3KZgxvPgAzI8e6+ncr
	 AgGjPvaZpLfPq8IutfeFeBA2k8PGesJH7L2phfNjcr3Mn235qD2ge66n0wgivX8nJg
	 ffvlcIIgFexSjfnzzcKE+VclfDh66bl9jO9mEedrLu0kVYncc95/eAgRnNXoJJwXev
	 0x4T2u1ZPeTpZ3Bcw30vkoopDzH1RmHCnziB3aCnvgUwVOVXbz59i3bCaWxozzC93U
	 IQhkljhtFGMdxV54UPr9QzhkhVpZ4SOhg6IjFQSYG9NkTgn9Z812LNdx/4Yt+pw3iU
	 bcVfedxIRnsOg==
Date: Tue, 11 Aug 2026 16:54:38 +0200
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
Message-ID: <20260811-quantum-strange-hound-0f81f2@houat>
References: <20260705213542.28987-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260705213542.28987-2-laurent.pinchart+renesas@ideasonboard.com>
 <20260706-capable-beaver-of-excellence-a3cf10@houat>
 <20260706094522.GA42740@killaraus.ideasonboard.com>
 <20260706-fancy-perch-of-satiation-0c220e@houat>
 <20260706160243.GB106045@killaraus.ideasonboard.com>
 <20260707-meaty-chocolate-lemming-fa9ead@houat>
 <20260707080143.GA211515@killaraus.ideasonboard.com>
 <20260717122530.GA1955120@killaraus.ideasonboard.com>
 <20260810095657.GA2954498@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="6wrixx3ampr44ixr"
Content-Disposition: inline
In-Reply-To: <20260810095657.GA2954498@killaraus.ideasonboard.com>


--6wrixx3ampr44ixr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/4] dt-bindings: display: vga-connector: Allow
 hardcoding EDID
MIME-Version: 1.0

Hi,

On Mon, Aug 10, 2026 at 12:56:57PM +0300, Laurent Pinchart wrote:
> On Fri, Jul 17, 2026 at 03:25:30PM +0300, Laurent Pinchart wrote:
> > On Tue, Jul 07, 2026 at 11:01:43AM +0300, Laurent Pinchart wrote:
> > > On Tue, Jul 07, 2026 at 09:46:52AM +0200, Maxime Ripard wrote:
> > > > On Mon, Jul 06, 2026 at 07:02:43PM +0300, Laurent Pinchart wrote:
> > > > > On Mon, Jul 06, 2026 at 05:40:30PM +0200, Maxime Ripard wrote:
> > > > > > On Mon, Jul 06, 2026 at 12:45:22PM +0300, Laurent Pinchart wrot=
e:
> > > > > > > On Mon, Jul 06, 2026 at 10:52:32AM +0200, Maxime Ripard wrote:
> > > > > > > > On Mon, Jul 06, 2026 at 12:35:39AM +0300, Laurent Pinchart =
wrote:
> > > > > > > > > Since DDC version 2, introduced in 1996, VGA monitors hav=
e exposed EDID
> > > > > > > > > data over an I2C bus. The bus is also used to detect the =
presence of a
> > > > > > > > > connected monitor by trying to read the EDID data.
> > > > > > > > >=20
> > > > > > > > > Some devices where the VGA display is integrated in the d=
evice and
> > > > > > > > > always connected do not connect the DDC pins. Some develo=
pment boards,
> > > > > > > > > such as the Renesas M3N Salvator-XS, also do not connect =
the DDC pins.
> > > > > > > > >=20
> > > > > > > > > To support those, add the ability to provide hardcoded ED=
ID data in the
> > > > > > > > > device tree. This is mutually exclusive with specifying a=
 DDC bus, and
> > > > > > > > > can only be done when the VGA display is guaranteed to be=
 always
> > > > > > > > > connected.
> > > > > > > > >=20
> > > > > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas=
@ideasonboard.com>
> > > > > > > >=20
> > > > > > > > This feels redundant with the EDID firmware loading mechani=
sm we have in
> > > > > > > > KMS already. It should at least be mentioned why we would n=
eed to set it
> > > > > > > > in the device tree at all.
> > > > > > >=20
> > > > > > > Very good question.
> > > > > > >=20
> > > > > > > I assume you're talking about CONFIG_DRM_LOAD_EDID_FIRMWARE, =
as the
> > > > > > > debugfs override_edid feature isn't meant for production. If =
there are
> > > > > > > other relevant mechanisms I'm not aware of, please let me kno=
w.
> > > > > >=20
> > > > > > No, that's indeed what I meant.
> > > > > >=20
> > > > > > > In the use case at hand, the VGA display is an integral part =
of the
> > > > > > > device, the same way an LVDS or DSI panel would be. Using
> > > > > > > CONFIG_DRM_LOAD_EDID_FIRMWARE, the manufacturer would need to=
 set the
> > > > > > > drm.edid_firmware command line parameter, and provide EDID as=
 a file in
> > > > > > > /lib/firmware/ (possibly in an initramfs). Beside the complex=
ity, and
> > > > > > > the fact it won't be very friendly to people who run a differ=
ent
> > > > > > > userspace on the device, I think EDID counts in this case as =
system
> > > > > > > description, the same way we support specifying panel timings=
 in device
> > > > > > > tree.
> > > > > >=20
> > > > > > It's *some* hardware description, but you have no idea whether =
it's
> > > > > > actually the hardware you're running from. What would be in tha=
t EDID
> > > > > > anyway?
> > > > >=20
> > > > > It would be the EDID corresponding to the connected display :-) I=
 see it
> > > > > as identical to how a user of the simple panel driver is responsi=
ble for
> > > > > listing the timings corresponding to the hardware in the device t=
ree.
> > > >=20
> > > > What's the expected user-experience for someone with that board
> > > > unplugging a display and plugging another then? Update the device t=
ree,
> > > > rebuild it, rebuild the firmware and / or resign it and reboot?
> > >=20
> > > The whole point is that they can't easily unplug the display. This pa=
tch
> > > series is meant to support devices where the display is an integral p=
art
> > > of the device. The user experience is expected to be the same as for a
> > > user who will take a phone, remove the display panel, and plug a
> > > different one. It's certainly possible, and they would have to update
> > > the DT indeed.
> > >=20
> > > > That doesn't sound very practical, and even impossible in some case=
s.
> > > >=20
> > > > > > There's another alternative we've used several times already, in
> > > > > > simple-bridge for example: just register any VESA mode up to a =
given
> > > > > > resolution:
> > > > > > https://elixir.bootlin.com/linux/v7.1.2/source/drivers/gpu/drm/=
bridge/simple-bridge.c#L66
> > > > >=20
> > > > > I don't see how that would help. The goal is to provide the kerne=
l with
> > > > > the data corresponding to the display integrated in the device.
> > > >=20
> > > > How is that not helping? Your problem is that you have a display you
> > > > can't get the supported resolutions from. What I'm suggesting allow=
s you
> > > > to create all the possible resolutions for that display, allowing t=
he
> > > > user to use the display, which is what we did for multiple drivers =
with
> > > > the same problem.
> > >=20
> > > How would the possible resolutions be provided to the kernel ? Isn't =
it
> > > the whole point of EDID ?

We have multiple way to provide EDIDs to the kernel. In this thread
alone, we discussed EDIDs (from DDC or the firmware loading mechanism)
and drm_add_modes_noedid. And then you have panel-style fixed modes.

> > > > You seem to be set on providing the EDID to the kernel, but it's a
> > > > terrible idea to begin with, so I'd rather discuss alternatives.
> > >=20
> > > Could you elaborate on why it is a terrible idea ?
> >=20
> > I'd be happy to continue this discussion when you'll have time.

Because I've yet to see a *good* EDID in the wild. They will need to be
updated, and possibly changed by the users, which might or might not be
possible depending on the system the user would use.

Maxime

--6wrixx3ampr44ixr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCans3rgAKCRAnX84Zoj2+
dnySAYD+LbBqa7P/JKb7PUGmFKFt/9iY7tbB9mvpvX7IC1i5vyBhdNUxtwWBjUgR
PDM3x/IBgPQ0xp9zj5FdXSP9RfbeYkL7AdHnGPG/y6XBeb3qKebEcLzvXXOAaCaB
rdTzKOyidg==
=8KXB
-----END PGP SIGNATURE-----

--6wrixx3ampr44ixr--

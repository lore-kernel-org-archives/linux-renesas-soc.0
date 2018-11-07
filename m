Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:56632 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726598AbeKGWic (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Nov 2018 17:38:32 -0500
Date: Wed, 7 Nov 2018 14:08:10 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Marek Vasut <marek.vasut@gmail.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: devicetree@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V3] arm64: dts: r8a77990: ebisu: Add and enable SDHI
 device nodes
Message-ID: <20181107130810.GA18223@kunai>
References: <20181106204647.18051-1-marek.vasut+renesas@gmail.com>
 <20181107085056.GB31092@kunai>
 <7154affe-751a-7cb4-48ea-3d4d6f467ac8@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline
In-Reply-To: <7154affe-751a-7cb4-48ea-3d4d6f467ac8@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Nope. I tried that patchset on M3N again yesterday and got error -84
> while initing the eMMC, so I need to look into that first. Then I'll
> try it on E3.

Hmmm, we tried M3N at the hackfest and it worked great there.

First idea: are you sure you have all depending patch series applied as
well?

@Niklas: Have you/can you push a publich branch out with everything
included.


--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvi47YACgkQFA3kzBSg
KbbAig//dbvaXahwhQpHdm5shpDLHCYRjXDEkIkiYylYfNtJdHlo+hxIupEHf79F
j0XMr7BaTpaYKBfUtZ6AF9mcqBrYZukGhq5hubxdhE08wPHH37zQ6Gz6bxgxCQjm
333b3QdKe9pLFDna8FHXea1CzNxwisXPVgVmVlwK7g4ZfbjZUjeo0Cx425kXmxol
MA4OKpBokz82lUdfkjhkNPcviVr3CDRns0iclkYXHzdlEkJQ3hcu4Al8iCSEEjDQ
PtVPMpUwCyg7IP0SLCL92OMSP2aD/Tt3cbe9P/LJy3jniIZVu8hBYAS5SFZ9N5bK
4NA1CMKyFILXuWgD4I+EzTHrm3xLECffGeF8vML1PevFADAqN+aCYCKSkZ29udCJ
w/7FE9uUKkwkSamBkmyud34fU8OxoPO4K2rDnYaLsgQimKqhwv/PDotF8Hmuuu8m
pGeED1+SEh8seMuBU8IMzFwOCqeBaogyeMIUHvoeaUMbs20VZidMSre3Nx7iChm7
PZN8RoxjEV0wSz5qLZ3Msj3Jgz8c9nJvp3mD/L+8m5Gp60q5hd/zpVoA19Ma2kr+
l+SjV4XrS57KYmok6OXl+zSrJ6JD96rQqYLHk63HBKNjcShdXOW2HLHBL3QVhoRX
pXh7h6BHpwfoJYqoxhBw7neRErTB/1pNjEEyT+Yc0BoWnDTzeZU=
=Vgxq
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--

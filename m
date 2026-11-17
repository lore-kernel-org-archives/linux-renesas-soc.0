Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937661;
	b=yY3ib0C+zHiPjxJ8/uaThAZKUdv1dSrSyqT2EZobdzQaBtJ4HyCP1EF3Qg0bMM/deejB
	 EUHeFxpcBCyfGL/hc3zNNkJjuvk58f5jiezJ6hJF5oTSYrMq72rBZNxpNEbdv6VDvq9qS
	 au/WJtARCNXElmKbQghlYB+xdaPVe708Av7gAnTTloAUfVf4wCjdAL2weyEFXvyGs38MQ
	 ahNrGnzW9dI2G8NlbWwc6m37Q9q7Kln6jsuBLbf+IL4GNxFO7qlCBDngTm3erB9y7libq
	 3MdRF/wXKlZ4d790n1qxDLptUL6BDpXcSxUvb/0SqbJMiSLL/QE0T/BWNLEVMNAzgCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937661;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=cR2AOpEGYiKzlikyUl8O8YBDqVn1oEriwrxHwFqrRDc=;
	b=oSCo3jrwxXU9UR+EQIf/NiznVD62nk8i4ChKWWt+asbij0UtbDxjPSPX5Ebv7JqJddoQ
	 gmkCsEg742bycPFRAxX76RpPFcglpMXCN4hL2K2qv5Jyq6wyOO/yuJ8v0ktkd+m6qbI1x
	 /MnLMt68d9+EVTPKWM4+Dgh6/6iH+kjozQ8ONGbVjTxhDogkgLCnzoTWSJt3Jq/YxM7fL
	 RWiQ+3mFArUU4KOerTVdVH7hpWRT2ylNgh3IK35vJswVa7lS1RLLyr68nfSehYrSXa3wf
	 EoDQ5c5hZs7p0iuKxCIPDp34OyaGMNs/UlTOkrrUTksSsA4BlbO4TcckSt2ToOCvpNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZEmtPG3s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFEE606A31C;
	Tue, 17 Nov 2026 17:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZEmtPG3s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E5B21F000C4;
	Tue, 17 Nov 2026 17:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794937660;
	bh=cR2AOpEGYiKzlikyUl8O8YBDqVn1oEriwrxHwFqrRDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZEmtPG3s6pzK3McY+POU0Zq2TtX9e07Rj1YqBffwbPVGP8TkDyQJCNbdPeg2omzxW
	 faO2+XQKzaVmTsVMjy4bEJ9cWc0xGyqjv92fhd0DO2LTt3egZtGCtK7DzJMeS501eq
	 mOzVO6yAQHf8dxcm57tesdPrPpt1U1REoMWk//2mNIlHiAmixSEY1FCMGteYEB+Tpk
	 XBEEneUOaZCy5JVsvirYZWR/hreA139SsdaICnhvMAExt0Ey4XACSXIYgDooRh+qjd
	 exUltOpX4iTIn8XI04WZwuCbRjG50FeYqJ5lv4u2+v5YgoGDyo/TrfO/aNiWXGugaq
	 UGOcPA2xwfI0w==
Date: Tue, 17 Nov 2026 17:47:35 +0000
From: Conor Dooley <conor@kernel.org>
To: Mina Chou <minachou@andestech.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, jic23@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	randolph@andestech.com, cyyang772@andestech.com,
	tim609@andestech.com, az70021@gmail.com
Subject: Re: [PATCH v2 19/19] dt-bindings: riscv: add Andes A27L2 CPU
 compatible
Message-ID: <20261117-yippee-blissful-76204cadd922@spud>
References: <20261116003937.1776888-1-minachou@andestech.com>
 <20261116-dreamless-matador-3163d4abbf0b@spud>
 <avvH6t8NHrya+hz6@atcsi01.andestech.com>
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
	protocol="application/pgp-signature"; boundary="yL4HbPHY7ZmtVyGZ"
Content-Disposition: inline
In-Reply-To: <avvH6t8NHrya+hz6@atcsi01.andestech.com>

--yL4HbPHY7ZmtVyGZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 11:20:10AM +0800, Mina Chou wrote:
> On Mon, Nov 16, 2026 at 06:26:33PM +0000, Conor Dooley wrote:
> > [EXTERNAL MAIL]
>=20
> > Date: Mon, 16 Nov 2026 18:26:33 +0000
> > From: Conor Dooley <conor@kernel.org>
> > To: Mina Hui-Min Chou <minachou@andestech.com>
> > Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
> >  alex@ghiti.fr, jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
> >  conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
> >  prabhakar.mahadev-lad.rj@bp.renesas.com, linux-riscv@lists.infradead.o=
rg,
> >  devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
> >  linux-kernel@vger.kernel.org, randolph@andestech.com,
> >  cyyang772@andestech.com, tim609@andestech.com, az70021@gmail.com
> > Subject: Re: [PATCH v2 19/19] dt-bindings: riscv: add Andes A27L2 CPU
> >  compatible
> >=20
> > On Mon, Nov 16, 2026 at 08:39:37AM +0800, Mina Hui-Min Chou wrote:
> > > Add the compatible string for the Andes A27L2 CPU core, which is used
> > > in the Allwinner V821 sun300i SoC. The V821 devicetree will be submit=
ted
> > > separately by Allwinner.
> >=20
> > I'm going to apply this, on the basis that it will be used elsewhere.
> > Ordinarily, it should come with the allwinner series.
> >=20
>=20
> Hi Conor,
>=20
> Got it, thanks for applying it~

Just to note, because this patch was separated, sashiko did not review the
driver changes. They looked fine at a quick glance, but I would like to
see another revision (with this patch excluded obviously and the things
that have been commented on so far solved) so that it can take a look.

Thanks,
Conor.

--yL4HbPHY7ZmtVyGZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavyTNwAKCRB4tDGHoIJi
0nDfAPwKHrmXEY408835g7LwKKUsD3y2VAZE1B3oMkjVyjOigQD+NM5PZ2WItqP6
lGZX8OLP+0WQqR6FozKNWS1q0T38KAg=
=oYqq
-----END PGP SIGNATURE-----

--yL4HbPHY7ZmtVyGZ--

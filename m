Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:44932 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727623AbeINStx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Sep 2018 14:49:53 -0400
Date: Fri, 14 Sep 2018 15:35:18 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        dmaengine@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [RFC PATCH] dmaengine: rcar-dmac: set scatter/gather max segment
 size
Message-ID: <20180914133518.GA1413@kunai>
References: <20180913145256.12261-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdWDKapncucL2t_hGDop_XfgJrLmEUOwC5zxZOBKD7PQtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWDKapncucL2t_hGDop_XfgJrLmEUOwC5zxZOBKD7PQtQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> > +       dmac->dev->dma_parms =3D &dmac->parms;
> > +       dma_set_max_seg_size(dmac->dev, 0x01000000);
>=20
> That is one too much, cfr.
>=20
>     drivers/dma/sh/rcar-dmac.c:#define RCAR_DMATCR_MASK             0x00f=
fffff

I see. Will fix and send an updated patch. Nice to see that I was not
totally wrong but just off-by-one.

> And yes, this depends on the data length, which is not known at probe tim=
e.
> Of course, dma_set_max_seg_size(dmac->dev, RCAR_DMATCR_MASK)
> should be safe, albeit (slightly) suboptimal.

True. But still *way* better than the current default of 64K.

Thanks for the heads up!

Regards,

   Wolfram


--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlubuRIACgkQFA3kzBSg
KbYDVg//bh36euxWfK0dddVBPVqm1s4zCPNzupGqOMeJXeOdE6jAkuHfePRjta8x
PMgoScr4JvODfNPvIF+wR2pfc7/7WYgMK3+L3fwCaeNMyRxTFNDEvE/E0IkN+OXr
oCBEuDRnPpeAXVNnvpKqBGwlmKC8o8PVoloGfjDBgbNz+LFJPyaJFnkVrZv3tdJp
/nbJnVJ6Dxs7GmhcJNH9ZSEFGZuYrKqJjHf3WYR96Ef4bsjSNxEkmCxunWhZjPvR
8moF2UWpRPwMBYD7LEAoHdHL2c+phiB2v5bcKP6g0MnD1eAcdJ52GEKtBM+trzsT
Qg19sOdYaQ6J8T8oVe40gJywUtbZ6sTmygKy3a1JNmPL+6hE5WULekMTVDo9Ipo2
mWuWCNh99IOY6kYNZMg6h4LXeLaB1NS46nLsaDOJ4evWK+E4pc8/7ATOBX57/KfE
PMWpt7Te7WbE46pXRC2QoqMOg93Vhh77J9iA3uh/FlciGKoLqZjPBhWi5NSeylqD
PyLxiZnPVrRYzdqMLXhbupz/PkjiuuGFrcjwG5+8KbXZFVIaNCFSlW1A4+U/Y65h
Tr2b558f+JWMIzkABQyKu43/b/YtmZKfn49dMd+kEfcGkGERDxt/tJXi7LM3npI+
cBLoN3LoHzQIeXmHTZqIuRqh1grdOyUqb751g92oOvByd/nNnkE=
=Wmfh
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--

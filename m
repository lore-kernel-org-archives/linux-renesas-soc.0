Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:42418 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390076AbeIUWxz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Sep 2018 18:53:55 -0400
Date: Fri, 21 Sep 2018 10:03:59 -0700
From: Mark Brown <broonie@kernel.org>
To: Nguyen An Hoan <na-hoan@jinso.co.jp>
Cc: linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        laurent.pinchart@ideasonboard.com,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        magnus.damm@gmail.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp,
        cv-dong@jinso.co.jp
Subject: Re: [PATCH] drm: rcar-du: fix probe error when DRM_RCAR_DW_HDMI
 disabled
Message-ID: <20180921170359.GE20825@sirena.org.uk>
References: <1537530543-29518-1-git-send-email-na-hoan@jinso.co.jp>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="r7U+bLA8boMOj+mD"
Content-Disposition: inline
In-Reply-To: <1537530543-29518-1-git-send-email-na-hoan@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--r7U+bLA8boMOj+mD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 21, 2018 at 08:49:02PM +0900, Nguyen An Hoan wrote:
> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
>=20
> Skip return EPROBE_DEFER when DRM_RCAR_DW_HDMI is disabled in case HDMI i=
nitialize.
> At this time, the rcar-du driver not be able to successfully initialize
> if disable DRM_RCAR_DW_HDMI (rcar_du_probe return error),
> so can not use other features such as RGB Analog, this patch to fix.

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--r7U+bLA8boMOj+mD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlulJH8ACgkQJNaLcl1U
h9ARZwgAg+LLqgwdEwTyfkrB+enFrjtz92KeXHoelKaTa8nZx5Zd6PnBVEkwdnFK
DVf4P53qXXFQ++zM1dRlcVvGA5t26KHkhKoVnJ2wVSwT1fgt24lc3wCsIkrfRueF
FGPoc8OuWYyquJCueWl67D5M7K/+nadmDMytm1VGnbT1TPSgn8E61qmme+0s52IM
jGRSfH+XE1Uk24QTgY9ccLbBY19gjm7umKvDg7TQT8cMnujkOHx0NqbM1Gc4fNaI
rmdHaKsoP9vhSQLZ24d1IFcWOl6MHjx7AAz5XJfrhQ/ANCV/ofkZNgRlj6w/bJFO
JXlLw2aquAZ1OTLEpC5a13moxjJYXw==
=zVh4
-----END PGP SIGNATURE-----

--r7U+bLA8boMOj+mD--

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:44318 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728149AbeIUXL5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Sep 2018 19:11:57 -0400
Date: Fri, 21 Sep 2018 10:21:59 -0700
From: Mark Brown <broonie@kernel.org>
To: Nguyen An Hoan <na-hoan@jinso.co.jp>
Cc: linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        laurent.pinchart@ideasonboard.com,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        magnus.damm@gmail.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp,
        cv-dong@jinso.co.jp
Subject: Re: [PATCH] drm: rcar-du: fix probe error when DRM_RCAR_DW_HDMI
 disabled
Message-ID: <20180921172159.GF20825@sirena.org.uk>
References: <1537530543-29518-1-git-send-email-na-hoan@jinso.co.jp>
 <1537530543-29518-2-git-send-email-na-hoan@jinso.co.jp>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uTRFFR9qmiCqR05s"
Content-Disposition: inline
In-Reply-To: <1537530543-29518-2-git-send-email-na-hoan@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--uTRFFR9qmiCqR05s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 21, 2018 at 08:49:03PM +0900, Nguyen An Hoan wrote:

> @@ -66,8 +66,15 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  	/* Locate the DRM bridge from the encoder DT node. */
>  	bridge =3D of_drm_find_bridge(enc_node);
>  	if (!bridge) {
> +#if IS_ENABLED(CONFIG_DRM_RCAR_DW_HDMI)
>  		ret =3D -EPROBE_DEFER;
>  		goto done;
> +#else
> +		if (output =3D=3D RCAR_DU_OUTPUT_HDMI0 ||=20
> +		    output =3D=3D RCAR_DU_OUTPUT_HDMI1)
> +		    ret =3D 0;
> +		    goto done;
> +#endif
>  	}

This seems to make sense to me assuming there's no other encoder that
could possibly connected though I'm not 100% up to speed on the DRM
subsystem so it's possible I'm missing some framework feature that
should help here.  I'm not a DRM expert though.

--uTRFFR9qmiCqR05s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlulKLYACgkQJNaLcl1U
h9DZowf/XnbJhYYcMuzOMXViBh736tQYCCbUy8FYtFOMV8xgUR7m65dsAdiJzwEB
0Mmj8gALMyN3PXZ9ZwDVfX0vigMgwpvTonR9falz8i1k86OBqYOvoaIjDL27LHjG
Q0k2gUvoRlmcdUo4+thIODkbQnaaFZ27tFSPC6Qd3FeJJqPCHSoNPGUvecZ6hOSD
FdJoOIuuYB6arqTP3taxNYP4rdzAH9v5kApKFEeLJemeDodxcPJvUxmXdaUl8hsL
ZY0pRM/AG5lsi2fYawwztBEBotkx86BGMORZwO7IHtQfwWbgh1wDBylaMKK534KU
MKkJClF/9kDKWnNosNleIM5lFXND5Q==
=zP+u
-----END PGP SIGNATURE-----

--uTRFFR9qmiCqR05s--

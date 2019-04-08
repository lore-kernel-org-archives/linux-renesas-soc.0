Return-Path: <SRS0=yOlw=SK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 186D9C10F13
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 11:12:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DE01A20863
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 11:12:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbfDHLMz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 8 Apr 2019 07:12:55 -0400
Received: from sauhun.de ([88.99.104.3]:33094 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725983AbfDHLMz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Apr 2019 07:12:55 -0400
Received: from localhost (p54B335C3.dip0.t-ipconnect.de [84.179.53.195])
        by pokefinder.org (Postfix) with ESMTPSA id 2E3134A134D;
        Mon,  8 Apr 2019 13:12:53 +0200 (CEST)
Date:   Mon, 8 Apr 2019 13:12:52 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Simon Horman <horms@verge.net.au>
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH/RFC net-next] ravb: Avoid unsupported internal delay mode
 for R-Car E3/D3
Message-ID: <20190408111252.GB4553@kunai>
References: <20190408082928.22840-1-horms+renesas@verge.net.au>
 <20190408090104.GB1615@kunai>
 <20190408094823.24bbzfp63mhzdkaa@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VrqPEDrXMn8OVzN4"
Content-Disposition: inline
In-Reply-To: <20190408094823.24bbzfp63mhzdkaa@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--VrqPEDrXMn8OVzN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

^
> > > +static const struct soc_device_attribute ravb_delay_mode_quirk_match=
[] =3D {
> > > +	{ .soc_id =3D "r8a77990", .revision =3D "ES1.*" },
> > > +	{ .soc_id =3D "r8a77995", .revision =3D "ES1.*" },
> > > +	{ /* sentinel */ }
> > > +};
> >=20
> > I might have missed it but is there a plan to fix this in later
> > revisions of D3/E3? I was under the impression that it is not and then
> > we could base it on compatible rather than soc_device_match?
>=20
> I am not aware of any such plan (or the absence of such a plan).
>=20
> I was unsure weather to go with the compat approach of the quirk approach.
> In the end I went with the quirk approach as it seems simpler. But
> I'm happy to re-arrange things.

I see. Well, I don't care super much. The tiny drawback here is that we
will have a potentially broken D3/E3 ES2.0, if they have not fixed TXID
there. Then we need to update the above pattern. So, revision =3D "*" (or
the compatible approach) might be a tad better. Then we "only" have 1G
disabled for no reason until we whitelist it.


--VrqPEDrXMn8OVzN4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyrLLQACgkQFA3kzBSg
KbZrQxAAm+egEH+VkuZm5kE6HT2t5wpJ4MZli7fRH+tbVuUkIExXeD4DSaL3uBUJ
57d7eumLpmY6RXLhPEfqCOpcx1g/D3R5Kw0eSNxr6b5pPn00y6OxJofF6IYgnyZT
Gay1Esl4RN3vAv7rqgZEQUG9dQiD2n5fjruKq2FSesTkVy915ZAk8zZb2GK+4dG5
h6g4nvVMbcr9FAt9iwhDx8FtBmlMAmQkQcAVU9tWt85a6hBxAQq6lUE9JwWovte6
Xw0KKakye6blZ7MOh1t8BOX0p9S+NbEpYNHdEVnGdA04R6nxQBp6EoygwyDpoT70
WxoMDYfeHFHezDoph95w04FUbM5lVSe0gl5UX1cEGihEQqFPphB0ze+tbNwzUgDD
+9mOlMCbp0KTQEOEnxVi+8M1iMZZlQmKmFXLHySyYUBkkziU0MlAVWbw5VwkAKT3
mt9/iKBqZnBBD6z4M7WnUuXPa6c5Pz+kjwT+fmrDOYox/4A6h8U54+Z0eQJ6Lw9F
VEcpGP+idG7K+Ere0GeUGUYyXs3GFfc4D+jYa25mw/up4FDUwIAAbr/hBus3t7N3
s+K2pVuxlWEl+YIIyDkgmei2/CFuBOmBiRjGogmtAUiez7F3rvaU3ecc7SWlt2ub
elGQ4G74lzFEQJgBZD0OT+ph/sBCx2/nn93lu9zVZtUXzeHbfsU=
=AzQB
-----END PGP SIGNATURE-----

--VrqPEDrXMn8OVzN4--

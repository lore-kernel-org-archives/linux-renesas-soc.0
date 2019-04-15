Return-Path: <SRS0=pBJi=SR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AADDC10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Apr 2019 12:17:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6B23520645
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Apr 2019 12:17:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727319AbfDOMRV (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 15 Apr 2019 08:17:21 -0400
Received: from sauhun.de ([88.99.104.3]:41274 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726785AbfDOMRU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Apr 2019 08:17:20 -0400
Received: from localhost (p54B331F8.dip0.t-ipconnect.de [84.179.49.248])
        by pokefinder.org (Postfix) with ESMTPSA id BDF582C0114;
        Mon, 15 Apr 2019 14:17:18 +0200 (CEST)
Date:   Mon, 15 Apr 2019 14:17:18 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Chris Brandt <chris.brandt@renesas.com>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: riic: Add Runtime PM support
Message-ID: <20190415121718.gdowmtgwqi2aa4zp@ninjato>
References: <20190320103003.20107-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bumn54iq4fpzj6q6"
Content-Disposition: inline
In-Reply-To: <20190320103003.20107-1-geert+renesas@glider.be>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--bumn54iq4fpzj6q6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2019 at 11:30:03AM +0100, Geert Uytterhoeven wrote:
>   - Replace explicit clock handling by Runtime PM calls,
>   - Streamline Runtime PM handling in error paths,
>   - Enable Runtime PM in .probe(),
>   - Disable Runtime PM in .remove(),
>   - Make sure the device is runtime-resumed when disabling interrupts in
>     .remove().
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> I don't think it's worth splitting off the last bug fix in a separate
> (first) patch, using explicit clock handling, as that will be replaced
> immediately by Runtime PM calls.

Chris, what do you think about this patch?


--bumn54iq4fpzj6q6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAly0dk4ACgkQFA3kzBSg
KbaDVhAAo1TJqLJn+8CyI2ZkDxqVp+Tvyq7aIK93qvk5L+TFmH3xlVxrkydP+0E+
cvDpG1ogX8qO6aaZ1/sgJud7HfV+Ivd+AYZksJPSeQlDGuilORv+diYq30MptCF1
ix+vGCDjuiLPpq4EB6q6GeoI0NyqZyvgP8TceUr5QXecmAS3Lbvp9Vi9XvxDkIN2
pvmXdi19ohPOBj8PX6+Fv+sQXraK7N32f1iaZcgfxENpupfeKolcydagIyS2xclD
pgOzfzkLLlEeVP0c4aUGKfXhhZJvsNHyjDoa7npmsrxz+WzGnwgdJmJ2dfRZiOCk
frjCZWAP/f98N7SuktPPcfJNRi3idzZq7W3LFotaLURjZ9R+1c5p3VIwgj15LY8L
6Aq17BrtmVj9gfCpsXvvXp0fgA1QUK2l0ykyYOdTYHF1SYvgERbWk7W0juiDg2Iu
Mk4AYOYvah3fpKSaJNKv/o1h25R7iW4PLZUbqtV5EJb6CvPWOTKAnMYx3tELN+0E
HeLw1GwPjs+dDbHjoau9kG7X1cQ11jT+9hIe+XgT7XvAmRpNbt48CiuKx4UN0sde
O0v5tbF9UssUZbylMEyHjHug2cBIHdk2zrhiBqa+MlYrSzcWSBH1rkzJfdKAvsUC
3TouH/zV5bjTRRWUbY/H4MtfcTocSMsGEMaHaGRyk++ISyUM/GU=
=4RXI
-----END PGP SIGNATURE-----

--bumn54iq4fpzj6q6--

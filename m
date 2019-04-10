Return-Path: <SRS0=jOjt=SM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF658C282CE
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 12:17:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 87C862075B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 12:17:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729037AbfDJMRx (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 10 Apr 2019 08:17:53 -0400
Received: from sauhun.de ([88.99.104.3]:51862 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727497AbfDJMRx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Apr 2019 08:17:53 -0400
Received: from localhost (p54B33309.dip0.t-ipconnect.de [84.179.51.9])
        by pokefinder.org (Postfix) with ESMTPSA id 7EA482C3F83;
        Wed, 10 Apr 2019 14:17:50 +0200 (CEST)
Date:   Wed, 10 Apr 2019 14:17:50 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     David Miller <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 net-next] ravb: Avoid unsupported internal delay mode
 for R-Car E3/D3
Message-ID: <20190410121749.GA9471@kunai>
References: <20190410114502.30362-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline
In-Reply-To: <20190410114502.30362-1-horms+renesas@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2019 at 01:45:02PM +0200, Simon Horman wrote:
> According to the R-Car Gen3 Hardware Manual Rev 1.50 of Nov 30, 2018, the
> TX clock internal delay mode isn't supported on R-Car E3 (r8a77990) or D3
> (r8a77995). And by extension it is also not supported by RZ/G2E (r9a774c0=
).
>=20
> This matches all ES versions of the affected SoCs as it is
> not clear if this problem will be resolved in newer chips.
> This can be revisited, as necessary.
>=20
> This patch does not error-out if PHY_INTERFACE_MODE_RGMII_ID or
> PHY_INTERFACE_MODE_RGMII_TXID are used on SoCs where TX clock delay
> mode is not supported as there is a risk of introducing a regression
> when used in conjunction with older DT blobs present in the field.
>=20
> Based on work by Kazuya Mizuguchi.
>=20
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyt3ukACgkQFA3kzBSg
KbZjIQ/9HtujtK/pD6DQnL2LMK+Qe3KoJX4n7PbsuFdFv1u3JhnWBVBGh6DQUEsh
Q1fKm0Pod2tofoAhOUIMXA87oeKTnfnsdXZW01nimcXodVwO6ReaqJdPgKS3xHW+
8SZqHbHwQ2HZcqMjTg/Gr+pUjje/9IPZdipng4Mmq8KfhkKIxLY0xkztUEMGRh5D
2jd/mmBd51Std8ZI37DAd+1YsWZkx/52d72cMX8GX4upa+UQw9LRMFPXGJD6rJII
C1qhbD6QGC2o0MI3UZcF0lB5afb8TKGmoFshW9F26rfG2Bq2U0BOswO26VbI7Tco
MGz2Mw3Y9gN+CGAjPetJzz9SB+gIvbli+Q0X6voFAcl5qdArOhHrZ9med75Fc8M9
fYYnGl4OL+9/tZS3LSsu8rXG+2W3LETO4PpasTNqdunCaKfmID3W1iz3Vv+/8a1n
jaCbiCMY0bTktRUViuG58ggWbjyQcAFqmh1jEe+8aMZMzOp4EFL+lx0Mu9wHfnhg
TH+VPLCNQER5oU2UF0vq2PSDLzROlfhzen+2+/2+pl0zJ++rm1BDI1BxfE46EjKM
Cm1QcCQozi3634yvVjlp1iOOQuZ0N8rhg7sFLPSrM5rarCi+PmFHZrLdmiloJimV
zx929k/dcFinu4gu5C0wzblnly0nSeFfXlPx3M1YX6k0I83fFuk=
=XoKP
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--

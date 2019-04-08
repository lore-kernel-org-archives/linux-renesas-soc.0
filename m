Return-Path: <SRS0=yOlw=SK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C63C282CE
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 08:41:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9EA0D20880
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 08:41:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbfDHIlr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 8 Apr 2019 04:41:47 -0400
Received: from sauhun.de ([88.99.104.3]:60268 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726189AbfDHIlq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Apr 2019 04:41:46 -0400
Received: from localhost (p54B335C3.dip0.t-ipconnect.de [84.179.53.195])
        by pokefinder.org (Postfix) with ESMTPSA id F1E654A134D;
        Mon,  8 Apr 2019 10:41:43 +0200 (CEST)
Date:   Mon, 8 Apr 2019 10:41:43 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH/RFC] arm64: dts: renesas: ebisu, draak: Limit EtherAVB to
 100Mbps
Message-ID: <20190408084143.GA1615@kunai>
References: <20190408083148.23134-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
In-Reply-To: <20190408083148.23134-1-horms+renesas@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Mon, Apr 08, 2019 at 10:31:48AM +0200, Simon Horman wrote:
> * According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of
>   August 24, 2018, the TX clock internal delay mode isn't supported
>   on R-Car E3 (r8a77990) and D3 (r8a77995).
>=20
> * TX clock internal delay mode is required for reliable 1Gbps communicati=
on
>   using the KSZ9031RNX phy present on the Ebisu and Draak boards.
>=20
> Thus, the E3 based Ebisu and D3 based Draak boards reliably use 1Gbps and
> the speed should be limited to 100Mbps.

"cannot" missing?

> Based on work by Kazuya Mizuguchi.
>=20
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 1 +
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 1 +
>  2 files changed, 2 insertions(+)
>=20
>  Based on renesas-devel-20190404-v5.1-rc3
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/=
boot/dts/renesas/r8a77990-ebisu.dts
> index c72772589953..05214b8dd2c5 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> @@ -272,6 +272,7 @@
>  		interrupt-parent =3D <&gpio2>;
>  		interrupts =3D <21 IRQ_TYPE_LEVEL_LOW>;
>  		reset-gpios =3D <&gpio1 20 GPIO_ACTIVE_LOW>;
> +		max-speed =3D <100>;

What about adding a comment explaining this speed limit?

Thanks,

   Wolfram


--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyrCUMACgkQFA3kzBSg
KbbWDA//fLRfV7qk/zfY9LCpWoZmMA/QUAS7J7myt2N4ObHF1ktns05Ygbf7JD0Y
A40y6KKPe0tCxXZgQMKLIvv3lyvayXcIDZFDVPJnGiBzhV6DRQSib5Y+CKZaADnm
dcXy9uv6sx2sXDhjLcQOtBNflPmUdOa7FgOqoYucdkd3a+tOXyjZdhVnqiYxMfor
ziivYmmHFfNCKFPb1uW4N6Ptkq57mAU+dNV3A174oKFrx4Libj0IaVVIObXExpfK
vam1jpwHZZStQNXAWhbfmuaDUz6gco4GxKCHae/mGfjghHej+ymrFX09GuKPG/XR
dmf8s1pNDprsenZ9jQ0uJDjEJuyiaIRQ8LByb0RDOUc0jvss0jgST8ZhsKCsnkcM
gG2LAFhn1jogDZScb8VjpMmMNRHDw9QjKFldcr6lGv9ORp26KzjahchhaGKjqAWX
/4flEUEZq++5LinfuTOQ5tAwnz0Yh5SgXYD00a304tCRTy6hx3p9yCkiF56GH3OE
SzJInAvpj0PPghZRxQHg3FxpgIK0tPhjFXUvgqscpgmUp/2SYcJUSpjpj2bBg4ks
NVJRyQifrRXQ03dlMJNGfY/r/6uDds43WRnfCBGO8qCiFSFRv3uuLjQy2RoPEfXt
V4OrBWcPWn9sG212phy5Bttr6tKpW+OuJb0LwIYZCDxZkfBw8wk=
=FbDl
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--

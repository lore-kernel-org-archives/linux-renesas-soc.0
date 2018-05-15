Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:47065 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752054AbeEOHVo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 May 2018 03:21:44 -0400
Date: Tue, 15 May 2018 09:21:32 +0200
From: jacopo mondi <jacopo@jmondi.org>
To: Simon Horman <horms@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH] ARM: dts: r8a7740: Add CEU1
Message-ID: <20180515072132.GP5956@w540>
References: <20180507123757.4708-1-horms+renesas@verge.net.au>
 <20180515071006.vmtxzwrppzrgekmf@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="cxMSjUqMQBJIqbX5"
Content-Disposition: inline
In-Reply-To: <20180515071006.vmtxzwrppzrgekmf@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--cxMSjUqMQBJIqbX5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Simon,

On Tue, May 15, 2018 at 09:10:06AM +0200, Simon Horman wrote:
> On Mon, May 07, 2018 at 02:37:57PM +0200, Simon Horman wrote:
> > Describe CEU1 peripheral for Renesas R-Mobile A1 R8A7740 Soc.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
>
> Would anyone care to review this change?

That would be me, as I've sent patches for CEU0 on R-Mobile A1, sorry
about that.

>
> > ---
> >  arch/arm/boot/dts/r8a7740.dtsi | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> >  Depends and based on:
> >  "[PATCH v2 2/2] ARM: dts: r8a7740: Add CEU0"
> >
> > diff --git a/arch/arm/boot/dts/r8a7740.dtsi b/arch/arm/boot/dts/r8a7740.dtsi
> > index 508d93440ee8..af4c071c9178 100644
> > --- a/arch/arm/boot/dts/r8a7740.dtsi
> > +++ b/arch/arm/boot/dts/r8a7740.dtsi
> > @@ -77,6 +77,16 @@
> >  		status = "disabled";
> >  	};
> >
> > +	ceu1: ceu@fe914000 {
> > +		reg = <0xfe910000 0x3000>;

The reg property start address does not match the device node unit
address (which is the correct one according to documentation).

Thanks
   j

> > +		compatible = "renesas,r8a7740-ceu";
> > +		interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
> > +		clocks = <&mstp1_clks R8A7740_CLK_CEU21>;
> > +		clock-names = "ceu21";
> > +		power-domains = <&pd_a4r>;
> > +		status = "disabled";
> > +	};
> > +
> >  	cmt1: timer@e6138000 {
> >  		compatible = "renesas,cmt-48-r8a7740", "renesas,cmt-48";
> >  		reg = <0xe6138000 0x170>;
> > --
> > 2.11.0
> >

--cxMSjUqMQBJIqbX5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJa+op8AAoJEHI0Bo8WoVY8E+8QAKdD/4WNT8v2umStKnggeekn
8DUaS7v3rfVRyTmCH5ZUWafhrnmVxuPBZymaYM9PiOo0ZmQNuJFq1Xe2UOx+Wf7n
xkwkWMhQoq8m5DRBF7GAK7RCJKZNZ054qt2BGcfa7alXHztou5hRQ+sNnN2cJufQ
uJs+RCWnmCPlyj+hKKMrRqBJ/v+Gj/y/F3Fp0aWKzwh4VlTGm4nZpVyhbHv7AQdZ
Z5kNguNxcWJ+rRarfRLnHSuun8hhLZysjhU0IhnwVvyKjP90MAyQQC6tjtYu1rjF
BrtOajQGlUzJ28uw+fJNULXvfgflrro2Mbb/AhSiDF0WXbvMVG/m26gvDljuyjsn
unPoLdnqjGOwMzchctWlFKQ7X+JPYovSy1XwdmZyW+d/1lQAyJy+2GeBGi4Rybxm
aNYmxv3chcihz79bezQvyQyc7jDubc/g3kEFlZWQmgfpotM/wYqU/4tKmzuyq6WS
aKTD5hCx4dJwR3/tHG+HlygFhf226iODN6jhpWw8Cmy8kCwFnVXx1TxnQwt/ukn5
tQrrV9w1l/jUJLxrCnaRQ+0vnx766//bsXpPNrnaFUEMJW3g8/x/hAB/JAgI6yy+
bL/b06siUB3z5YB0pnWmlXo+tYOJjDxOGKklgbqdfCs2LBSHPe0WtpHXrRxPRH4J
Bku9+nJkhVEaRR8W0imt
=d0v5
-----END PGP SIGNATURE-----

--cxMSjUqMQBJIqbX5--

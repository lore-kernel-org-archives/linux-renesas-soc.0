Return-Path: <SRS0=0aVP=RX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9683AC43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 16:58:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 607412146E
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 16:58:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbfCTQ6T (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Mar 2019 12:58:19 -0400
Received: from sauhun.de ([88.99.104.3]:54932 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726937AbfCTQ6T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Mar 2019 12:58:19 -0400
Received: from localhost (p5486CF7E.dip0.t-ipconnect.de [84.134.207.126])
        by pokefinder.org (Postfix) with ESMTPSA id 81AF24A1346;
        Wed, 20 Mar 2019 17:58:16 +0100 (CET)
Date:   Wed, 20 Mar 2019 17:58:16 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Gareth Williams <gareth.williams.jx@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt: snps,designware-i2c: Add clock bindings
 documentation
Message-ID: <20190320165816.s3ng554yuxdzvsg6@ninjato>
References: <1551361930-24434-1-git-send-email-gareth.williams.jx@renesas.com>
 <1551361930-24434-2-git-send-email-gareth.williams.jx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="q7zwttsblrjnjpcu"
Content-Disposition: inline
In-Reply-To: <1551361930-24434-2-git-send-email-gareth.williams.jx@renesas.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--q7zwttsblrjnjpcu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 28, 2019 at 01:52:09PM +0000, Gareth Williams wrote:
> From: Phil Edworthy <phil.edworthy@renesas.com>
>=20
> The driver requires an undocumented clock property, so detail it.
> Add documentation for a separate, optional, interface clock.
>=20
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Signed-off-by: Gareth Williams <gareth.williams.jx@renesas.com>
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to for-next, thanks!


--q7zwttsblrjnjpcu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyScScACgkQFA3kzBSg
KbazFg//d5fFa3Imt8/gfS6xaC2dePl0sWlugUBlyhQGaQcVGMMBY0/9QsWUaHZN
73CaGi11JyVEFuyglN36dNoOoQJ6acrpJZG7Ig9cLGH4s2BpJGeOkNqhapHib0FA
dPITtgNshuxUzlNG7kiEob8NJ30VZe4Pag5kSwKNfM/gksSUelCCeGSV4p5K0dg3
BhFHxuytNDDJ8uFIFXHJYKTBxiL7bpEWgAsBR0fidbzdrA7hcMrU+M/cNubKHJEI
MGF4ooThJgUlouS8VMJ1GsLZ5FYoeQtz22sQq2tUdr5JZjyd3Zh+Zmz7rc3ie1uz
O9Tl63/StZ12Ma8WTW2hXcgLhhRfIQaYdVMB1ytVmADCUV0IkDSpNUFW9YgEioah
OUgRisKrSfBrp5Eo6dAyGoBv4FS0dr9jjWkX06YL9FpNWnyGZvebKpcMgOGAF2nV
v4b08tbTAOgjJLCRq3v0ZJf3gbDxhOQo+WbhHe0sjUo5clXgwtUzPgEpgfhUDiPn
fELT1ZeLGCLRKGGCksxdRniy/ecp+9sIDRtfVJtnOd89NAUvtYLSYtuvP/ec3eSz
qE6rXBgE/RqbIFyhWC9tUSJ8L38EgTUS4zMtt5PaRjtz8FIPK9jhp/wb1Z8pXZYM
s16dV+vEvDJw1o2U3lMrSbtP+knXfFadHYfrKQQpmfoIRpS7tto=
=12pE
-----END PGP SIGNATURE-----

--q7zwttsblrjnjpcu--

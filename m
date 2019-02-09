Return-Path: <SRS0=bfNf=QQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC1FC282C4
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  9 Feb 2019 21:41:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 39B1121929
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  9 Feb 2019 21:41:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbfBIVlB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 9 Feb 2019 16:41:01 -0500
Received: from sauhun.de ([88.99.104.3]:39964 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726898AbfBIVlB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 9 Feb 2019 16:41:01 -0500
Received: from localhost (p5486C39D.dip0.t-ipconnect.de [84.134.195.157])
        by pokefinder.org (Postfix) with ESMTPSA id 440092C7BF4;
        Sat,  9 Feb 2019 22:40:59 +0100 (CET)
Date:   Sat, 9 Feb 2019 22:40:58 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] mmc: tmio_mmc_core: don't claim spurious interrupts
Message-ID: <20190209214058.n6qdemed3bcjkefk@ninjato>
References: <c737228e-fde2-33a0-2fdc-d88f0bfd2a9b@cogentembedded.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="e7pilt6yu3cmvnjr"
Content-Disposition: inline
In-Reply-To: <c737228e-fde2-33a0-2fdc-d88f0bfd2a9b@cogentembedded.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--e7pilt6yu3cmvnjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 09, 2019 at 10:13:44PM +0300, Sergei Shtylyov wrote:
> I have encountered an interrupt storm  during the eMMC chip probing (and
> the chip finally didn't get detected). It  turned out  that U-Boot  left
> the DMAC interrupts enabled while the  Linux driver didn't use those.
> The SDHI driver's interrupt handler somehow  assumes that, even if an
> SDIO interrupt didn't happen, it should return IRQ_HANDLED. I think that
> if none of the enabled interrupts happened and got handled, we should
> return IRQ_NONE -- that way the kernel IRQ code recoginizes a spurious
> interrupt and masks  it off pretty quickly...
>=20
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Looks OK in general.

> +	return ireg ? true : false;

	return ireg;

?


--e7pilt6yu3cmvnjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxfSOoACgkQFA3kzBSg
KbZe0A//YsnV/vK/PiJkActojVST3Qh9hZczy0huoc3ZpZf+1/NmcrqidFcAdZCf
MqVww8RK1s+AU0ISb9+VOmVIHQvFIc3T827bhLhOiMmvFBUCqQ4fOeBW9jqLCeu9
l7FacamlEyUpPqlmNbQxv/HgmNZ+jnEDjgmZyA8c0k0+f3Gx9vsggbAMLLzzOwCy
IuLa47IXxkkc/3xH3wkt9XmDt+TzyvY9POOWb/gYAr4+5eByhatQOLg1LjRTEQyw
pev2k4fpgrjYDaGloCPVk4Q8ffd+QjQGyk1bddVW1QgqOvJzOQOqkGjdETNJWO3B
ribeI6a3+ObWUHP5bqWmOGkycCmcBLn7VlHE0A4JzjXx/177wHKfkL3O5ZmcAGCJ
K7RmuSjPTwLLGLLCkxIkb45EHLpXRMeywZYrGDvvYUMW3BcChGbXeZnk+0svEfKF
3mp2WvDNkazI1rzeu5gIt/cQ63EYJv0d/5RlG2vQYQlorQcArj1sfgm3RFismrIe
NYpiTVdypKlmOaHq8F9Yqmfq8WqZTWYPk9gw3hnaLmeDw+PNHayMyA24D9PkRZ3t
fdfVD9sjgOBf7pRAAq4tp5Qg8aAT2bMCDRY4z+sQxnDkNtE7Quy8/8vSyA9qWlXN
i681sHN4XtXdcMFHQ+ir0yhXqkuIajqJSRyWePPBq7NM+nZfKpM=
=KOW6
-----END PGP SIGNATURE-----

--e7pilt6yu3cmvnjr--

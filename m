Return-Path: <SRS0=QNR1=P6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA6DC282C3
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 23:12:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8802920866
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 23:12:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbfAVXMo (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Jan 2019 18:12:44 -0500
Received: from sauhun.de ([88.99.104.3]:56800 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726175AbfAVXMo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jan 2019 18:12:44 -0500
Received: from localhost (p54B333AA.dip0.t-ipconnect.de [84.179.51.170])
        by pokefinder.org (Postfix) with ESMTPSA id B50A72C78FF;
        Wed, 23 Jan 2019 00:12:42 +0100 (CET)
Date:   Wed, 23 Jan 2019 00:12:42 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC/RFT 0/7] i2c: sh_mobile: state machine simplifications
Message-ID: <20190122231242.lxuvubnondgzx7of@ninjato>
References: <20190116210555.12209-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zwiuqdb4r637qi6o"
Content-Disposition: inline
In-Reply-To: <20190116210555.12209-1-wsa+renesas@sang-engineering.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--zwiuqdb4r637qi6o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 16, 2019 at 10:05:48PM +0100, Wolfram Sang wrote:
> While I was working on this driver to debug some issues, re-understanding=
 the
> state machine was harder than I expected due to some confusing code. So, I
> decided to reorganize this a little to make my life easier. There is pote=
ntial
> for more cleanup, but I propose this as a first step.
>=20
> No regressions experienced so far on my Renesas Lager board (R-Car H2). T=
his
> series is RFT because this needs to be tested on a Gen3 SoC as well, but =
this
> will probably be happening around FOSDEM where I get access to proper HW.
> Still, release early...
>=20
> If you have comments, feel free.
>=20
> Wolfram Sang (7):
>   i2c: sh_mobile: simplify sending address for RX
>   i2c: sh_mobile: remove get_data function
>   i2c: sh_mobile: drop 'data' argument from i2c_op function
>   i2c: sh_mobile: remove is_first_byte function
>   i2c: sh_mobile: replace break; with if-block
>   i2c: sh_mobile: refactor rx isr
>   i2c: sh_mobile: update copyright and comments

I removed the one copyright line we discussed about and applied all to
for-next!


--zwiuqdb4r637qi6o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxHo2oACgkQFA3kzBSg
Kbbfvw//S5myK/njXSqBUH6Y3rUaL57AB5boqRbHTaYLWOi4YRMA0L58vpgJbWEi
IGe0NFJtsWs7W1OIi4/V1Tkpp4+eFEuOfr9G2FIYMXmssdFTx9K4PLQyLijq11n6
C4bbmMOsrUbXPfjFM6a0uDWFhIE+1UZFlcnh/e3dpmUs1hYNoDOdqTuWl7F+qFG8
XgI0VUQ+FYC1ErfjTHqlIPO4kHuEoc+92B6X1wVOt1O6JOZJIeopOEVD80NrUGKN
qC244MfSFRsOQyO7D/LisHH8ycUywPjye7WDvodVoNtzwc+Z1PNgraXolVKgEcfl
KihowcavxctKPUQeB08rSKjDeseTZDqGr8DvJtL3205O1mdOSArpchtc1BUXvHaz
rN47qEG76SystDFdffIm/U77FCnNOUT2haplRiIr5/fcKf14MjG6CJJJbKMtU6Ab
Rfktr2aQMg3IQQw77HmggbDpJwWoh7qB5P5DH1wqj+Uh0bJ7BWrVBJeTCR0hf5n8
KS0Z0o2/Nwnp+1+uvupBHSplYC/yiovRhLQrgh38j98gzUjexjoPEKVxcoAv7tKk
OTtu8f5TQlRrT/pMxa/aqpQrdE2fcEGt7hLiSfpQ3nm2LWlBZ/bmKnryAdVfuWSO
9+n5Yo4CSXczvP7xtBXLpR/nYwDE5jBKjZW9dnztiTPhFJEBp0Q=
=Eabw
-----END PGP SIGNATURE-----

--zwiuqdb4r637qi6o--

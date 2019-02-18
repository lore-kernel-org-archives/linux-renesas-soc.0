Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D75C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 17:54:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E90AA2173C
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 17:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550512477;
	bh=SM3b6yBMrTjaafPkyRScv56A6QvovN0Ex3Ijc7LgJF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=u+tSr9VqONrK0ia9Cxpez4A2fa+EWV9Vn8SfWapsMRkcw45K7Wk1fEGQAR+ZCNOKM
	 57iinnUUs812YWVn9UC8waKgSKWNjxfBQa6V4DEpEPh/8B+BKuk0/S7y4GegVaGQEC
	 JIpq9UzpvHmvYfitVMTjQWPLo7+y10efa/DWjeKM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391593AbfBRRyg (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 12:54:36 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:34166 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733043AbfBRRyg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 12:54:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=s5yVJqf8BMNE29QQ3wt83M9ZOT5NoIP/QVwEkT0dq/c=; b=xpOvf5AGjAHvPzGM4mY5lGNz/
        eoHDh/2MbRMxPNKDcQMhjH6Xl+aYBt1f2ZOUBqc6KnLIjEVeNx6mfP4A2WABGYABgPYDLTHZ8oiEL
        MtNf5+lRxtaB0DB2kS4+M1VGh2cklErSMBG9Xj/k9h03/O+6Buf7ef3sfrHIFMCC6Gl0Y=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=debutante.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1gvn7e-0001OA-PG; Mon, 18 Feb 2019 17:54:30 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
        id 633821128008; Mon, 18 Feb 2019 17:54:30 +0000 (GMT)
Date:   Mon, 18 Feb 2019 17:54:30 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     Harald Geyer <harald@ccbib.org>, devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] regulator: gpio: Reword the binding document
Message-ID: <20190218175430.GC10794@sirena.org.uk>
References: <20190216174859.15738-1-marek.vasut@gmail.com>
 <E1gv6SG-0000Jv-KB@stardust.g4.wien.funkfeuer.at>
 <83550921-b0ec-fa34-b120-2dd159f256d8@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Sr1nOIr3CvdE5hEN"
Content-Disposition: inline
In-Reply-To: <83550921-b0ec-fa34-b120-2dd159f256d8@gmail.com>
X-Cookie: Take an astronaut to launch.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--Sr1nOIr3CvdE5hEN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 16, 2019 at 10:37:37PM +0100, Marek Vasut wrote:
> On 2/16/19 9:20 PM, Harald Geyer wrote:
> >> From: Marek Vasut <marek.vasut+renesas@gmail.com>

> >>  - startup-delay-us	: Startup time in microseconds.

> > Not relevant for your patch, but I wonder why this is not in the
> > generic regulator binding.

> Presumably because it's implemented only be the gpio regulator driver,
> however it could be moved into the core (?)

The core can do the ramping but for most regulators it should know any
ramp rate restrictions just from knowing which regulator is being used
(and possibly some device specific configuration like the values of some
passives), there should be no requirement to manually configure the
required delay in the DT.

--Sr1nOIr3CvdE5hEN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxq8VUACgkQJNaLcl1U
h9A7VAf+O+oj58O66vu3vZQB2/eZxCV8Qkpgg52G6Q0K81pabAVQF9E+vHU9wzg4
tmW9ZMrZ8tXAJZyL1FVq75g++O/3NjDswO0Xi5MH4m9Kwe4LRrGD3/i2GYG056Gf
0PqiSrIsG8XpZ/Vpnr+172rX49Dxv2MngHyrC+XzRldTrbeTatBhDcI8IHv4ZO1A
ZJvRnip+YenNvK1tcU3dhoetyRFO8HWFvEHdLj19rHc+YE00xnsKZtmrl4Dmu6f2
AuH90NXTEHKxDjso0o2I8Xqt7eKZtCBO4jk/Pc7Ce3RZG8hCwFOXirGAm3F2xAFt
cfvP1klU4WWJNuAia3QR1lGay1Sw5A==
=i6SP
-----END PGP SIGNATURE-----

--Sr1nOIr3CvdE5hEN--

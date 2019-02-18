Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C83CC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 17:56:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D9ABD2173C
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 17:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550512601;
	bh=v5xdo4qqIV0YX7Ip3J81P7jLFyxTPqDbRTEX7wOP2QI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=u0v8rNprQcimaDHkNiLh8R0gwWQRop9WlNMqtNYrDvjz6wRLLoR4sA7ARFT1XkH7q
	 I4zDkEVY7A9e3wUErS4f9Q05W2zwFItb4grN0w/gFQvOX4BwljaE4qRY5C72SmrSdS
	 DhQlwvaTRz4rARC36AQG2Zd4yBaFqGQxZ3y8XueE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389688AbfBRR4l (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 12:56:41 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:37652 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389053AbfBRR4l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 12:56:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=rxrW1bNX7ohCt/of/82XmtkDk5EHNrostvoGvGnws0s=; b=unfIuk3mbi2u7RkzPMzJ1I3Ie
        Ery4vFt8fq1dSeNtPvX9+HGqx+W39tSwJlOxGLWzJoViZIc9pVNqj4o/r5k2hW4nFyKNFlWj6a3PZ
        wt7PriMxJkCgZEB5gVicUoVVh/9MoOtw/ew/AgV3yInTXfEms4Ft5S9xopHM3xWAnEZTI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=debutante.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1gvn9g-0001OS-6H; Mon, 18 Feb 2019 17:56:36 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
        id 5B79B1128008; Mon, 18 Feb 2019 17:56:35 +0000 (GMT)
Date:   Mon, 18 Feb 2019 17:56:35 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Harald Geyer <harald@ccbib.org>
Cc:     Marek Vasut <marek.vasut@gmail.com>, devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] regulator: gpio: Reword the binding document
Message-ID: <20190218175635.GD10794@sirena.org.uk>
References: <20190216174859.15738-1-marek.vasut@gmail.com>
 <E1gv6SG-0000Jv-KB@stardust.g4.wien.funkfeuer.at>
 <83550921-b0ec-fa34-b120-2dd159f256d8@gmail.com>
 <E1gvNOx-0000Kc-Dc@stardust.g4.wien.funkfeuer.at>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yudcn1FV7Hsu/q59"
Content-Disposition: inline
In-Reply-To: <E1gvNOx-0000Kc-Dc@stardust.g4.wien.funkfeuer.at>
X-Cookie: Take an astronaut to launch.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--yudcn1FV7Hsu/q59
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 17, 2019 at 03:26:39PM +0100, Harald Geyer wrote:

> If continuous operation of the regulator is important, I'd expect
> we don't touch whatever the firmware setup instead of by default
> setting all gpios to low.

> However as we can't change this now, there isn't much point in
> discussin this further.

The issue here is that the GPIO API does not allow us to read back the
state of output GPIOs (even though for almost all hardware this is
supported by the underlying hardware).  With the GPIO API as it stands
it is unfortunately not possible to preserve the state, if the API were
fixed we'd preserve state.

--yudcn1FV7Hsu/q59
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxq8dIACgkQJNaLcl1U
h9CpIAf/f8pzBd5oBLBsZakxXoEaleo81gFzm3v6aj8OBLlWpnEQEswOYCPCvWiw
vI3h82co77N2kqqEpBnWANBlw05sNUClhY8DzgkqQSgaIzeT2i8yEZhtIgYfKgwK
4RJgisnINyQJvoL0AQ2++23DeXRC5kpiFE1uMATqfxDH3F96XlCtdaKsYHd4t8Fk
L2Vf6ollMiMZIlVk7kmjuIfUkrsjn53y8P79sZEDVy0zsMkxP5ZZhf7ZNLl5TeMo
1KT5yQ2WbKrePrjbWsmouc2jVGyr4sFdbpoYiqDKVYCQGAbJNj5dRLaPaMUzYMHx
0wnhYd//FJFWexN2qWPXCNKn4I3c4g==
=QLbi
-----END PGP SIGNATURE-----

--yudcn1FV7Hsu/q59--

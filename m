Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5895DC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 18:01:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2A3D521736
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 18:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550512876;
	bh=loqTqow8YT8xyAxynPqyYtp3T0ZYCqrHpD99N+Lxfu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=dYjf9aExQ1hCP7uZOlcsU3iiSWO4QYrnO/dBlLN+/XuTUBQnykbIY4xlG9BUSA5JZ
	 KjOo68cqW8gFEcgCETHDY8kk3OktN6YbiZouKsJspXQ/PjznFqiOeLjso7seI7q0tr
	 w1a/h6TzzsH/JgLM3Fh1+ep5Z9ElFCmm7/BKmkBc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389682AbfBRSBP (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 13:01:15 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:45308 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389649AbfBRSBP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 13:01:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=loqTqow8YT8xyAxynPqyYtp3T0ZYCqrHpD99N+Lxfu0=; b=rVINKpzWLblNX3U8zamrhV9cM
        o+zCicKKPpfh42+mGf7ZmO+0HuEZJNN9YhpNB8GXWUGQ6Vm6KcpHzCPLVkWhiLFYe2mJ45m9kRRWN
        l6Kxo/F4tNsG8LsVe1f7ycldOarWYCdC+xJu9nLHnpfmJbRciNQR9ZYJ1//P8dye3tZPA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=debutante.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1gvnE5-0001P0-68; Mon, 18 Feb 2019 18:01:09 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
        id 5721B1128008; Mon, 18 Feb 2019 18:01:08 +0000 (GMT)
Date:   Mon, 18 Feb 2019 18:01:08 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     Harald Geyer <harald@ccbib.org>, devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] regulator: gpio: Reword the binding document
Message-ID: <20190218180108.GE10794@sirena.org.uk>
References: <20190216174859.15738-1-marek.vasut@gmail.com>
 <E1gv6SG-0000Jv-KB@stardust.g4.wien.funkfeuer.at>
 <83550921-b0ec-fa34-b120-2dd159f256d8@gmail.com>
 <E1gvNOx-0000Kc-Dc@stardust.g4.wien.funkfeuer.at>
 <75846117-242c-6861-ace5-dccf88711208@gmail.com>
 <E1gvSbw-0000K8-Hj@stardust.g4.wien.funkfeuer.at>
 <7a993282-9137-caf4-ca0b-b2c01ea9959c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="h56sxpGKRmy85csR"
Content-Disposition: inline
In-Reply-To: <7a993282-9137-caf4-ca0b-b2c01ea9959c@gmail.com>
X-Cookie: Take an astronaut to launch.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--h56sxpGKRmy85csR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 17, 2019 at 10:57:26PM +0100, Marek Vasut wrote:
> On 2/17/19 9:00 PM, Harald Geyer wrote:

> > If this is the case, why would we need to set an initial state instead
> > of just waiting what the first consumer requests. I still don't see
> > a use case (aside from don't accidentally shut down something important
> > during probing).

> Possibly to prevent a state which might be harmful until the first
> consumer comes up. However this is rather theoretical.

This is the GPIO API restrictions again - there was a big push at one
point to try to ensure that we set the output state when requesting
output GPIOs, and a lot of the time requesting will set a state anyway
when it puts things into output mode so it may as wel be one we know
about.

--h56sxpGKRmy85csR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxq8uMACgkQJNaLcl1U
h9BrYAf9Gp7it3E9GdzB1w2s8DbV0dGv8pDScXg/DRT+V3BqE57PWEc2xYTPSDXd
ZjzZH2Vp6oX0sPR2xitBnOeac/Ohv23UsRwCLmYXUtv4FeEfQLHU+zzziab+h9ko
7nURAJcfhXFbZKA/XEq266V5+S7tB7SzF/3hx+ziyAfJEnKGYcgHxkzknHVIpcll
n6+7cXIxWetvS2W/dzu/cDV7l+ucQDMn4fSu/AXxGCxbFMrpNd/ls/JLS+StOgfq
d2T5CTr8zlm4nStr5XftCAdWZ9NNeSSq1V/csQZhBOUgqtLJt6oOn4Fdm/IG+Iak
PQFtWGduWTX6AZ3jym8fcpaxXjAnMA==
=PZkU
-----END PGP SIGNATURE-----

--h56sxpGKRmy85csR--

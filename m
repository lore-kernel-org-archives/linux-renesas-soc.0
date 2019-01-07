Return-Path: <SRS0=nqfF=PP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69238C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Jan 2019 18:15:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 29C552087F
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Jan 2019 18:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1546884910;
	bh=Yjn/CjIcPQt+KwjGKsMC4jV9ljCJ0lKmFrxHVpPbXek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=zifz9Ms8fF7qsVGk6wILQfaA3Qc3EXEbW0L01/ZZJS9nkXdHPyzVFss/YZ0AyEDS7
	 REGZUTwvrpNjpli4tGk3fIldazAMgcV5PBIYyJQ93WmF2mF6VsFdm6ENZ5FkAq7tt6
	 l9lP0yYyBbdFS4ZnlwjqT8AF2xJW7K4LiFRoo77k=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbfAGSPJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 7 Jan 2019 13:15:09 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:52962 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbfAGSPJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jan 2019 13:15:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=YFWtfbnrg0/8g6bubA+4fgj2KhRdtKwWCO0JWRPIdhY=; b=FqM1i1Xkk0/xor2FeIzDy0n/c
        1Z0Zivjj0iNJNQ60klMgmqTLveU/f9W9LaFt6Yi5euvTIzpjpnhDnqq3lE0LasB4FUCMoEfjlS/fz
        t/rgF5BGT2OCzMU6GDG55UzlklQHCSBbvqWH1sdPKJzczGcCBjv3Oe0s6eIrB0wVLaPSI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=debutante.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1ggZQX-0007bu-ML; Mon, 07 Jan 2019 18:15:05 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
        id 40C721127491; Mon,  7 Jan 2019 18:15:05 +0000 (GMT)
Date:   Mon, 7 Jan 2019 18:15:05 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     linux-spi@vger.kernel.org, Mason Yang <masonccyang@mxic.com.tw>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFT] spi-renesas-rpc: manual read issue workaround
Message-ID: <20190107181505.GR9570@sirena.org.uk>
References: <76eb5af5-756e-4d54-0be2-55573649d2d1@cogentembedded.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="brdEIFGMNIjz5YJG"
Content-Disposition: inline
In-Reply-To: <76eb5af5-756e-4d54-0be2-55573649d2d1@cogentembedded.com>
X-Cookie: NOBODY EXPECTS THE SPANISH INQUISITION!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--brdEIFGMNIjz5YJG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 27, 2018 at 11:21:14PM +0300, Sergei Shtylyov wrote:

>  drivers/spi/spi-renesas-rpc.c |   66 ++++++++++++++++++++++++++----------------

This does not exist upstream.

--brdEIFGMNIjz5YJG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlwzlygACgkQJNaLcl1U
h9BBOQf/dUnPS+HUzRRgDY+ObGE4PaYklVYk81xGgisYUz88R3L07mObXMTfQ3Iq
3qyOkqWZ1AByJrshrh2CMCcVznTU29m5zWZFgS+pHBx3dMiPbFLHzLFTk1swCLz/
HyrQ2D/md5B2MCjNBQIi9rsFAVOp7TtdDuauOaD35y4IyGwFn1R9+uLquBvcKges
VYK1DZA4NMZIgeohzNvu58hYbRKI6hFMqlkB4LHuZzpwV7+fFKoiK22v4+TtzlyV
/wtdc0HV1AvDPYIuwBv8CEraKeEvlHA/I6nKpGeGqvwmvLMMK4tqk1bbSazmMmOR
xXh/FYxg4SZdcx9wy5wgvZUCoZ291A==
=Pb70
-----END PGP SIGNATURE-----

--brdEIFGMNIjz5YJG--

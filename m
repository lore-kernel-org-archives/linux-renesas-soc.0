Return-Path: <SRS0=bVnl=PQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB882C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 12:29:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A3D5D20685
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 12:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1546950552;
	bh=m/AkMhjYm1pL71B5PhrCkhT3lt1P3y7Xa/66V+m16BQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=WWMfCD9NHRcCg9wCBZvLUuDgoANQBw47o/gMgoXMqkqFdJxcrqzRP20mS0CGgVEdI
	 KO1PpS7KBgu3KqJDfgPQGY5RTnIIcR+EhMB+ihV1TsjkXRZHxVY6jraOBS5j4lZXGy
	 CI73PfA1hjSaRMF9QhdGGPwJFsLoTFwBBxWP1BMs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728709AbfAHM3M (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 8 Jan 2019 07:29:12 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:55308 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728655AbfAHM3M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jan 2019 07:29:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=dQntaTrGliWeIftUtipKNinxlOJw9LVZs1D3L+bYKDg=; b=UTc7/s4WlwE9NmbikeNAdRH3a
        SlhLveYa8cmGRGebJ/fIL364wZWyp3Tjv40fDt9JOS0dQueV0cp7iCopJnJCAeR7WjbkHU1EXJ+ff
        pr3xAu+iaLh1WmwO43xcyjAmu2gf/5b/fi8vQPeVgnKMdn97xstmrhtucusCtVg6BPPuc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=debutante.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1ggqVI-0002jm-Eb; Tue, 08 Jan 2019 12:29:08 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
        id 05249112778A; Tue,  8 Jan 2019 12:29:08 +0000 (GMT)
Date:   Tue, 8 Jan 2019 12:29:07 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     linux-spi@vger.kernel.org, Mason Yang <masonccyang@mxic.com.tw>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFT] spi-renesas-rpc: manual read issue workaround
Message-ID: <20190108122907.GA6590@sirena.org.uk>
References: <76eb5af5-756e-4d54-0be2-55573649d2d1@cogentembedded.com>
 <20190107181505.GR9570@sirena.org.uk>
 <e56eec35-9628-9c75-4a8d-685ffef5e2b9@cogentembedded.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline
In-Reply-To: <e56eec35-9628-9c75-4a8d-685ffef5e2b9@cogentembedded.com>
X-Cookie: You look tired.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 08, 2019 at 10:52:11AM +0300, Sergei Shtylyov wrote:

> > >   drivers/spi/spi-renesas-rpc.c |   66 ++++++++++++++++++++++++++----------------

> > This does not exist upstream.

>    As I said, the patch was atop of the RPC-IF driver patch by M. Yang.

Please don't submit patches for things that aren't upstream upstream.

--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlw0l5MACgkQJNaLcl1U
h9AcfAf/QxNczcE/wnnH4jy6EmqaW2K0HjkuZX8qkrF8tOg7l/6FIlObViZHrUGS
Pv3HTiGhM8m9BcabFEo1EL7obPxXw2RotoGCyROLW8hcwLB3e01iBSsALjUSY/fX
oo98jpTvctuq3mgxF5bUGYOcIne8Kbxej+VqmHkJG5Wq1w188r6XpVCrF9+nUYuO
uoMPOcBYMk1oTJnX4kWpPLTB4AMExhzMYDIPVmalRC5kKzj+VVMhZe8MWfuOOBiN
XXGiPQDWAWMKmIfOzCfWiey5t11anJq6pLJs1hbb6godky+8nIO143Qo4eDTFB+E
bSwGXQEEj0UeYplUZkraufkjGqfgKw==
=z7gT
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--

Return-Path: <SRS0=sjaF=PT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DDF4C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 13:26:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3122A20675
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 13:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1547213180;
	bh=AbtgoI3kEXByb8d0lJtNgYjrwUSkNxaY3nyI/Y65KVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=2U/MinpaGj2C8YwYwvg9rMJHKJHDPJCXWVXDTpRinFyKtCL5gC+1YATSaWTH1gSzI
	 PYo1R1evRlSq2I2sa847+lPFmmB2U85cWbYq0aSwDem9eo0pjOo5VzJKgaa+2+eiu+
	 L+wIQTglSh5L0lgvh8rNb/ahZPlz6TIAKkgi+WoA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731059AbfAKN0T (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Jan 2019 08:26:19 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:34208 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729386AbfAKN0T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jan 2019 08:26:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=AbtgoI3kEXByb8d0lJtNgYjrwUSkNxaY3nyI/Y65KVI=; b=nVkir75D/hT8AgXqMoKbERWfX
        PzK3QtdkZZH0M2Qecr7NYnOv6ga+/eagmHP0oMbl89o/7u3e5KFpicMLAQ15Ey4VE9pTdttEeBbBW
        LPabvbDXqeObqFbQVn7O0QS0GQE+5eQQQ7TlQISBhIe8YUaMde1h8u1xBA2graSGk+YcM=;
Received: from 94.197.121.207.threembb.co.uk ([94.197.121.207] helo=finisterre.ee.mobilebroadband)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1ghwp7-0008Q9-M3; Fri, 11 Jan 2019 13:26:10 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
        id 75E5A440082; Fri, 11 Jan 2019 13:26:08 +0000 (GMT)
Date:   Fri, 11 Jan 2019 13:26:08 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Nguyen An Hoan <na-hoan@jinso.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        magnus.damm@gmail.com, linux-spi@vger.kernel.org,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, cv-dong@jinso.co.jp
Subject: Re: [PATCH 1/2] spi: sh-msiof: fix *info pointer in request_dma()
Message-ID: <20190111132608.GD2804@sirena.org.uk>
References: <1547197109-637-1-git-send-email-na-hoan@jinso.co.jp>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/unnNtmY43mpUSKx"
Content-Disposition: inline
In-Reply-To: <1547197109-637-1-git-send-email-na-hoan@jinso.co.jp>
X-Cookie: If in doubt, mumble.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--/unnNtmY43mpUSKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 11, 2019 at 05:58:28PM +0900, Nguyen An Hoan wrote:
> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
>=20
> msiof_spi_infor struct pointer was initialized in the probe() function,
> no need to get back and keep consistency.

These look good to me with the changes Geert and Sergei pointed out.

--/unnNtmY43mpUSKx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlw4mW8ACgkQJNaLcl1U
h9CB/Af/YwXQjyCEzjEePrwNQj02Mxi7h6e9hYA5o56Vx/9UEZM6eLAJ0KPhSfl8
DCld9E7pX1wTTLmB9uJKRKwQbd7TwOk4NITf4XTTq5xuZbgN8wRHXpY7FXLtRtLo
+V3hKDhaIItb0LW7x2PiPrtI50gj8fZ5u6nI1fkKrWrzHxfdTJ4eRuoMj76K4v5I
WPoTOovZCG3eiZ+tlRjAzU3ZwbNXW6s3GZETvy/TF2/tIgrswKXJmpxPmQmDpGe/
LAjRk65yBktBUea+EfAXzt4FBTMLiQPM67pguKIaV6KRzRgAfrkQL/urzni3s9de
XRPj7sve6h6YX4a82NbinJHjLdw5SQ==
=Dp1A
-----END PGP SIGNATURE-----

--/unnNtmY43mpUSKx--

Return-Path: <SRS0=w5fC=RE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3575C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 11:43:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC2422083E
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 11:43:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387649AbfCALnU (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Mar 2019 06:43:20 -0500
Received: from sauhun.de ([88.99.104.3]:55122 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725978AbfCALnU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Mar 2019 06:43:20 -0500
Received: from localhost (p54B33611.dip0.t-ipconnect.de [84.179.54.17])
        by pokefinder.org (Postfix) with ESMTPSA id 17EC82C7BF4;
        Fri,  1 Mar 2019 12:43:17 +0100 (CET)
Date:   Fri, 1 Mar 2019 12:43:14 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Mark Brown <broonie@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Subject: Re: [PATCH] spi: sh-msiof: Add reset of registers before starting
 transfer
Message-ID: <20190301114313.veihv2buhhhknxsa@ninjato>
References: <20190228110215.1657-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="y4srel56rrniateq"
Content-Disposition: inline
In-Reply-To: <20190228110215.1657-1-geert+renesas@glider.be>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--y4srel56rrniateq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	for (k = 100; k > 0; k--) {
> +		if (!(sh_msiof_read(p, CTR) & mask))
> +			break;
> +
> +		udelay(1);
> +	}

Why no reuse of sh_msiof_modify_ctr_wait? And can't we maybe even use
readl_poll_timeout() here since we know the register is fixed to CTR?


--y4srel56rrniateq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlx5Gs0ACgkQFA3kzBSg
KbYLdA//cnsg5gdmeATAVPZshmLNVvVt/sCYX9HyaXzJnb2OMbaVrYmfUb4PGTRE
Ny5JRAW/DiLwjIRx1ipQOQSRuEZ2MS0fJYlBlO7XQXrpVW9EficPW/I1NDo5xH/y
NX62QWpZtlMx/XMffIBNs2hd+GDeRT6FprZGpkpCrEY7DJQaZR3cFpT6liZrw4/7
h7ww/RLDUYcaTOgny/O9cIzgKgVWZbOlK4PIJ1m2kDHuc45Jz3nD91SeQHtwyFXU
7VpSECKriV6KKSEe0l/Anypx1eenbmX5qi4Y1uJ+j63ykRCTTBmYmkskLWlOn3II
8YWpWtb3yc76WzKaGhdhWxCw+P0GyWJrboASPZVihien3IDK99td5BkZcS9vI8Hv
3a7hUxx+q67l9M0RfTSyh6EklJuVTE3pLrbBsVsTLrLTjndHg7tAWyR0rnEHvUMH
lm+Y7w+iaUfKZ03n1o8TGnbKGiEAx4zvD5FlDhel0Nzuyh+zPRz3JFPLi1woGNmg
wDuGX0wIZ834ndhuZnhicbIs4t/++JyvMw8gqUR0hnW1T8W2JqDX6Wk2HcWIpywq
PVCst3knstmSJfqpAtPIxLOP2PfV8el2+NoMhBylxXngvFPXgYe5+PGp1hckLfNK
1V/BaA7meEurc1YUsZUGWG6+0txzSIX3M7oSV0dC/U5S3EhijE4=
=laJb
-----END PGP SIGNATURE-----

--y4srel56rrniateq--

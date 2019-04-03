Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF766C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 08:07:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B633220830
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 08:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1554278852;
	bh=IcL9fYrx7X/rzweBnBCH6HZoTwd0UfFfd3qnu/OhrDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=MGf6H4Y3Mly3MT8Rvg9266I2l5K0E8FVKwftmF+ZZFtFF6gwDxHvPYjS2lAl2FUWe
	 j6naqSmyzU/4/7Vg6cGEd4KevwfchBIFBBei0Z/xa6dhXFkNjpHo4MVag15KBuqjlr
	 HvUmEe8SvSUnZT2j7L/0Wqs4ThKzGssOEkSOh5Fk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728811AbfDCIHc (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 04:07:32 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:46116 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbfDCIHc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 04:07:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=IcL9fYrx7X/rzweBnBCH6HZoTwd0UfFfd3qnu/OhrDs=; b=iFNhoIJkbi0FWvK3Xac3a2V6O
        m8n+qhI1Yge85C9esuEeWMeAY5kevdbDy3YqhGad9blZkghB+eJ8hbqUWbHDEx4sBdaF5x+koYqJ9
        SoFmRdN0B+m8xBTzDmI/Yqz4ZYwhGDX81R7tuQ4unqhxZGJkhtllwcnmhV2Ec9/8L9hkY=;
Received: from [147.50.13.10] (helo=finisterre.ee.mobilebroadband)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hBavD-000561-Tc; Wed, 03 Apr 2019 08:07:00 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
        id 4EE6B440082; Wed,  3 Apr 2019 15:06:53 +0700 (+07)
Date:   Wed, 3 Apr 2019 15:06:53 +0700
From:   Mark Brown <broonie@kernel.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: Applied "spi: sh-msiof: Use readl_poll_timeout_atomic() instead
 of open-coding" to the spi tree
Message-ID: <20190403080653.GG5748@sirena.org.uk>
References: <20190402144023.27422-3-geert+renesas@glider.be>
 <20190403044219.41630440082@finisterre.ee.mobilebroadband>
 <20190403065406.GA1438@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="m972NQjnE83KvVa/"
Content-Disposition: inline
In-Reply-To: <20190403065406.GA1438@kunai>
X-Cookie: Replace with same type.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--m972NQjnE83KvVa/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 03, 2019 at 08:54:06AM +0200, Wolfram Sang wrote:

> Any chance this email address can be changed to the one I used for my
> Rev-by two lines below? Nothing major, but would be nice.

> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Required rebasing but it's only been published briefly so OK...

--m972NQjnE83KvVa/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlykaZwACgkQJNaLcl1U
h9BHhwf+NJnr/CkoaY1DROWYsQLfMF4aUeFrDzSqPsTsg36Xpmvkt5npbs6vlaER
nO5Eoh4Sm+/aO/iLGd+sDEAgk0iOhj9q5YETxLXG70vOJ5URr4Y0eZ7ySVCq8BQw
jN6jy0kclNNMiZTp2qCzW6ngsHFqd2GHUc5ZB4AXj/6XWy8jHIigknBKyBaiP5wd
8O92KwCs7hMOLZ6jxXzWKL8XwUvgg6E9o0hEBNNadICTk3wzbRk8lE5j6hfTTmbm
qWS5oTzGahLbiYtrWmqAWoUctbCHeYvhhRQaV0c49/Im/dmO5iXAchCXry9oNzFD
blXC8TDNZai7aMrS/it9sjIK0UQ3uw==
=/gOq
-----END PGP SIGNATURE-----

--m972NQjnE83KvVa/--

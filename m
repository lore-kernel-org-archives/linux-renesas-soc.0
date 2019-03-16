Return-Path: <SRS0=P06h=RT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD645C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Mar 2019 16:44:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE49C2186A
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Mar 2019 16:44:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726629AbfCPQo3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 16 Mar 2019 12:44:29 -0400
Received: from sauhun.de ([88.99.104.3]:46632 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726376AbfCPQo3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Mar 2019 12:44:29 -0400
Received: from localhost (ip-109-41-128-104.web.vodafone.de [109.41.128.104])
        by pokefinder.org (Postfix) with ESMTPSA id 04A543E42EE;
        Sat, 16 Mar 2019 17:44:26 +0100 (CET)
Date:   Sat, 16 Mar 2019 17:44:26 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Peter Rosin <peda@axentia.se>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kieran Bingham <kieran@ksquared.org.uk>
Subject: Re: [PATCH v7 2/3] i2c: core: add device-managed version of
 i2c_new_dummy
Message-ID: <20190316164426.GA1784@kunai>
References: <20190313165526.28588-1-wsa+renesas@sang-engineering.com>
 <20190313165526.28588-3-wsa+renesas@sang-engineering.com>
 <a3fd63fb-0eec-78f3-992f-84194bf571dd@axentia.se>
 <7a48e707-bf06-6a95-e1ba-08e45481715c@ideasonboard.com>
 <20190315210806.GA1749@kunai>
 <7d8b2a46-d349-5589-229c-f0c01c510feb@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline
In-Reply-To: <7d8b2a46-d349-5589-229c-f0c01c510feb@axentia.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I can't seem to find what you said to me anywhere, it's not in my inbox and
> I don't see any (other) reply from you on patchwork for this patch either.

Oops, my fault, sorry. I couldn't send it when I was on the train, so it
was still in my Drafts folder. Sent now.


--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyNJ+YACgkQFA3kzBSg
KbZe5w//YznpWZVAIIC0C7QjJyb1ccWlnYe3/TFWHxbvW9rPkMGySYa2MDJjMp5J
T65CuXozM4D/WHGCYj2NxKuhKUm17u6US1og4uwjHNvEr6OhEtQ4zPev4QvAdbg2
rWLVAOr4z72FIZZm1nitVqIloK4Jo/JS34LesMftT7DNVMjuuh3lYvAYn1RH+fwa
/oOXqviefgt71iLD3+WctDai0o33aN8IlK7eHJDjZ9jUcH4158bzXpRnjX+58GMc
BMHHzZWdPho0p1Yt+DO0pU4PhiLIKtfJjqbaQ1BVSQYUrtqo6H0lKP8bFPgZJH3y
+IvE8hCuNwRhvSXhBwV/omVxevG4aAoAfBqdcruM4V4l9x8vX9uh+WE9JK9R90MP
vhLhOdYXOfq5MK863WlWKGO28fCKx/z8Yi5W9abnowKxsBPU88JQglNIdYJRY3oU
+6P0annwMbWOW8cw1pYZHDrezb4FZn85A1SfdxTZmngWaFRrLH8CqtoQ7t/sSurV
jsIOgh684bMddGlxDn1xkEFfLnvvfb/UfNc+1iBFBPNsug/EC+DEEUrETlIIHPBW
zTeU8FrUkEUtWs76snhL4Hd/I6CK2nZjsJMNEtZTQXkGvf1EI5VmfRDf2Guc0MkZ
a1tufYnBvf70Pk9ZUIn2DcjiUrNg4/VOZx1JMAqiE53rOL9Nrl4=
=SZt1
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--

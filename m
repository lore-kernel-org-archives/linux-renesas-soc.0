Return-Path: <SRS0=0QpP=RQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE5EC43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 21:19:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E61D4213A2
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 21:19:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbfCMVTl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 Mar 2019 17:19:41 -0400
Received: from sauhun.de ([88.99.104.3]:51274 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727657AbfCMVTk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Mar 2019 17:19:40 -0400
Received: from localhost (p54B33543.dip0.t-ipconnect.de [84.179.53.67])
        by pokefinder.org (Postfix) with ESMTPSA id A0DE33E4304;
        Wed, 13 Mar 2019 22:19:38 +0100 (CET)
Date:   Wed, 13 Mar 2019 22:19:38 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Kieran Bingham <kieran@ksquared.org.uk>
Subject: Re: [PATCH v7 0/3] i2c: improve i2c_new_{device|dummy}
Message-ID: <20190313211938.GC3480@kunai>
References: <20190313165526.28588-1-wsa+renesas@sang-engineering.com>
 <CAMRc=Mc85U_WmY1RCNMCwMPJoO2jwYxvOaNiBNbuBaigJnoaqg@mail.gmail.com>
 <20190313210924.GB3480@kunai>
 <CAMRc=McLcqooWZY0j+SZ0cPGb-U+-nApOnjK6ADCuRCEpBJ8_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1ccMZA6j1vT5UqiK"
Content-Disposition: inline
In-Reply-To: <CAMRc=McLcqooWZY0j+SZ0cPGb-U+-nApOnjK6ADCuRCEpBJ8_w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--1ccMZA6j1vT5UqiK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> No problem. Once you'll have these in your tree, could you provide me
> with an immutable branch and I'll try to dig it out for at24 for v5.2?

Quoting my cover letter ;)

===

If the feedback is positive, then I plan to create an immutable branch for the
at24- and MFD-trees after next rc1, so stuff can be based on top of it.


--1ccMZA6j1vT5UqiK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyJc+oACgkQFA3kzBSg
KbaZNw//QKa58jcJaRbJYvmnw3QOtzrIrRK4TI9l6dVM6nb9gtcDtS1oJM6qvE9s
PthN6nNOBj9+TOepD34gTgnfal+QhafC23SjziETrfAE/N57seKttJZW+P2JOKhW
LLIkYIU8tmC68PLOxNTLbk8yG63n8z2527ICzF1Jp06v4RDP2FMntMRvaD5d5M48
mJMrNCR9nzX52bk5lXu1zw4Tdh4vj3IwRFa2uUUA+dS7EYt82cRT6pq8BiGk/Svg
NaySKqXjiNDHG8EQLUuQF7e30LWo+D+JCqxG0E+ir1rINlw9dJkzQSA49UmMbwn0
jwwCFoM15ugVDAohdI64Pj5FiNGMl5zt2Fw3Ude0G+n5SN1BKRG2v947OvCJtYra
Yd3PBT7CfubqfZHK4cF9SqGTsavHBYACIzOCjHCAnZDsrNEANCFuDcFUla94WQsa
USMBw/BnEI6rpPlCgUA5n0NrcGResj3g9GJXxD7x0JKSjKyBXBeApZUx4tEWa2m8
tc+JAHJ136BFDI7zaRgi2LDqFBvYwZpvJt0ttc9uA1B3u3UecG2QHBjp6XdTc7qM
aDhXSYTxBXP6fJeFI3cf4aIwN9HqsWNwJDnG3I+/9ODiwvtG7IQFjxXJ+dSGSrlw
0sAWsPg3mavtEVjSYBLuUDZAchHGTULpjf/38iTx2D6BmmtX3S4=
=Rd2y
-----END PGP SIGNATURE-----

--1ccMZA6j1vT5UqiK--

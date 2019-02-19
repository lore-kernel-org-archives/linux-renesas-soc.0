Return-Path: <SRS0=FLKL=Q2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD4DC43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 16:26:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F010B2147A
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 16:26:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfBSQ0G (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Feb 2019 11:26:06 -0500
Received: from sauhun.de ([88.99.104.3]:47458 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726385AbfBSQ0G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Feb 2019 11:26:06 -0500
Received: from localhost (p54B338D8.dip0.t-ipconnect.de [84.179.56.216])
        by pokefinder.org (Postfix) with ESMTPSA id 4C7C12CF689;
        Tue, 19 Feb 2019 17:26:04 +0100 (CET)
Date:   Tue, 19 Feb 2019 17:26:01 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] i2c: gpio: fault-injector: add 'lose_arbitration'
 injector
Message-ID: <20190219162601.pdop7c44eetu5zfw@ninjato>
References: <20190217124126.7257-1-wsa+renesas@sang-engineering.com>
 <20190217124126.7257-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdVLEeJ4i0rZKv8w2bAO5Q7StxqQWEEV611PPMGeE60JHA@mail.gmail.com>
 <20190218204122.j35itmqth3avo3a6@ninjato>
 <CAMuHMdUB--d6_tJ4oYnvSiXy0YNNoAtMqAyyGfK+qRuX4akhAA@mail.gmail.com>
 <20190219131852.c26hvxieficunmsj@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="d5ujccxbkgcxzptk"
Content-Disposition: inline
In-Reply-To: <20190219131852.c26hvxieficunmsj@ninjato>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--d5ujccxbkgcxzptk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I tested the current code with CTRL+C, there we get EOWNERDEAD back to
> userspace, even with my code not propagating anything. With sending
> SIGKILL, I got 143 which is not defined. I want to double check the
> latter first, might be my tests were flaky...

Yeah, I mixed it up. That was SIGTERM, of course. SIGKILL gives 137. A
signal gives you errorcode 128 + signal_number.

So, I don't think we need to propagate the wait_for_completion result
value.


--d5ujccxbkgcxzptk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxsLhUACgkQFA3kzBSg
KbZh7w//bhjkRQJJqoCX175BDK6HdN9kB/QqnHcQ7wlPBq5QNJedPD8mlTvdNk1a
XKPzwRu2PkkPi62xI3j7H0r/YUJpUGYzgnxnM4OtHASZbgXFRwQ5Uui0GCThBCNn
cTwGWQEvrUQshAlZCPVFMJxBSX+PASySaRbIEPNiIoGjU9lq0XPBHBq+G9na6Im+
OoW/BKhBu3Dx6nhvms8blybCMD+Oq9awCGwK1VupdNKRBG8K7LnGe7kZrFVro8w+
NMnHpTvfGW3HdHSgPxeZKCI1a9UvKJJGVWWxdswUXHj4g1HsL5gwIfr+AD62A5ic
S+ZpYtQ+DbDIaNZZ85A+97LcEaucp8K15CeMk8l0WZama7tgkPNlj9nxkO05yJ+2
uKXYwqA3HJYzNcZPpvWt4CLVZ9ZPZdX5xhsDrygbubk3aR7G1PDMrLL3xOj+yo7O
YPyka/0Me6nGbbubpp9JBNJTS2YfibfVYi9TF4aneMjPHjk2nWlNQMm/5tLReOCA
UVpCIM0SMuY0v4mHrRAlD+Ra8y33L0kYvwiYRfoJk6f8JQIrC6E2LoR9bg59jIBA
j4bO+JFEncHn7rfyHS9WN25ZB6LzD/M05RUCulQBAmNWfXC2b4upKyVeD7W2lz4k
kJ+414X+Dsr6FGJ85et0gzh3cuTjxLtZYgGB86Q8NgSMS2mG5yE=
=C3n9
-----END PGP SIGNATURE-----

--d5ujccxbkgcxzptk--

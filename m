Return-Path: <SRS0=0QnK=RS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A0F9C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 21:08:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 512F621871
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 21:08:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbfCOVIJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Mar 2019 17:08:09 -0400
Received: from sauhun.de ([88.99.104.3]:40388 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726078AbfCOVIJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Mar 2019 17:08:09 -0400
Received: from localhost (ip-109-41-130-2.web.vodafone.de [109.41.130.2])
        by pokefinder.org (Postfix) with ESMTPSA id 9DE102C3637;
        Fri, 15 Mar 2019 22:08:07 +0100 (CET)
Date:   Fri, 15 Mar 2019 22:08:06 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kieran Bingham <kieran@ksquared.org.uk>
Subject: Re: [PATCH v7 2/3] i2c: core: add device-managed version of
 i2c_new_dummy
Message-ID: <20190315210806.GA1749@kunai>
References: <20190313165526.28588-1-wsa+renesas@sang-engineering.com>
 <20190313165526.28588-3-wsa+renesas@sang-engineering.com>
 <a3fd63fb-0eec-78f3-992f-84194bf571dd@axentia.se>
 <7a48e707-bf06-6a95-e1ba-08e45481715c@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline
In-Reply-To: <7a48e707-bf06-6a95-e1ba-08e45481715c@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > I personally really dislike the proposed name. It is akin to the abomin=
ation
> > where some sort of abbreviation of the types of variables are included =
also
> > in the variable names. It's useless clutter, at least to me.
>=20
>=20
> I hate to be jumping in with just a 'me-too' - but I also had a similar
> disliking to the _errptr suffix on the function name here.

As I said to Peter, I am not exactly happy with the naming. I just
couldn't come up with something better. I am totally open for
suggestions here. Let's give ourselves a few days. Maybe inspiration
will hit one of us somehow somewhen.


--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyMFDIACgkQFA3kzBSg
KbY1Cg//WHkpDV2xYsMAm4vCA+53CFV8aI0vZh+7rQOQhwqYPRJxyRCRZr6FbP+Y
DDbzEVtXCKOpIwioPD7d8YzMW4J0S1EcbkjO+pyNQ88M3TaCAdx9ODxf0jZLYBcS
I5QyeKFXlz3Z3l6+tN8rc89e6ryk4Rh/p9mIvLYPUKg0fB3um3iqDmY84S3U5lvb
t2AW6Mk54k7vko2yf0L5+2iyyhN8IWhX0QeYkNYaeekyosZRUs2LL6yjCFG7rpNM
p8LTP52m2+Y7Y/NscSFd1PVZIRdXvimQ0oMjWThZhlhVb3RR4mRXW94g6RS0ffkR
TbuEYf/4s+WUuZKepxLI7mpC38pCC0AYqgyplPjcFmym4giUAyLHrE+hYYiBL8mb
qbv4W03yOxVDz2yXNgkeE1F6rIfua+xbXV84AvZRd+bwg2DZHXGScCeC+tGFE3Ch
0YrWSZ3ZI/yWhXgk4tnIWbHpqEwSbD/7Y5qEoiAXpO113cSBcm0kt5vahtZwsNoJ
IXV9NG2GfBMbFlP7lS6ErzlcL8pIeukGMo3bf9QEPY1oshewn7jXpp21hMhxcoJ2
AWXi/v0yOtMFk+/vs1nOxL1Bv6qJZycRooGj9G+hpEbh9MNNVOZxcGTwbbRr8bUv
xlHIOuuuu43vHg32WnDquRAWnsDS/BRzXakYOeiFil+NkS+C6/A=
=X04I
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--

Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 761D7C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 18:12:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4F08F205C9
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 18:12:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733083AbeLQSMa (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 13:12:30 -0500
Received: from sauhun.de ([88.99.104.3]:40164 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388659AbeLQSMa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 13:12:30 -0500
Received: from localhost (p54B3357B.dip0.t-ipconnect.de [84.179.53.123])
        by pokefinder.org (Postfix) with ESMTPSA id 0E4492E3656;
        Mon, 17 Dec 2018 19:12:28 +0100 (CET)
Date:   Mon, 17 Dec 2018 19:12:27 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     marek.vasut@gmail.com
Cc:     linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: Re: [PATCH V3 3/6] thermal: Register hwmon in
 thermal_zone_of_sensor_register_param()
Message-ID: <20181217181227.GA1529@kunai>
References: <20181217155644.29278-1-marek.vasut@gmail.com>
 <20181217155644.29278-4-marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline
In-Reply-To: <20181217155644.29278-4-marek.vasut@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +			if (!IS_ERR(tzd)) {
> +				tzd->tzp = tzp;

I tried to read the thermal core but couldn't really figure it. We are
not leaking/overwriting the tzp pointer acquired in of-thermal.c here?


--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlwX5wcACgkQFA3kzBSg
KbaPRw//YLKLR89OrweLlqc6T3wn1Yl0GcaFaux81H+nr4kQ2oqN9yHmORRObyUv
yb8Y8PTw3DAnACiKGUJ7k5jl/DLqbgxIcezrDXbUbb9MsZQWoGrwHKdjwuASpXM4
uEEB9PaAF6o1b6iq8BWkHUzcd8uw2672H/7xYQlUqNmGRgnzCmrDHyzA+3IM6CA8
WXOkbaZwRDB2TI/54K10ZsybptkQMDsjM6ZcMURzPUlsyld8aMHgm1pm7JCKmxZd
Iw67Hanry2DU9yxpsOSWzkITG4q2eLRuXX8h0kjg+oVmpilMJgzBAR1PepfP47Gt
9vVfmoLuq/fVSSQYl3DVl9+DRD8caLZZ2lOEpQNMTOBduutnT8B7jS1k8LCyzU5/
7kg7ueUHZvSOVB/dDL72gkstOjsIqeGapm1k82IVSk/DF2KDT+BHQc0HTjYU1uNb
kFD3RwOywDOcygQCvDPe6Lzrtn6+vcw46SGt7iUO9oZ6DGxNiQ18SVzE73SDFVpZ
91hMuQoG+JPIUfZdjsUT0ZYTWXYY3cStEBm6Kec5oqdqPMGsZhEXkTBYlM3uIkbl
+qachbk0pSsqrTiAQ/l8y16XacZc1D3KqHZ/gseD5CdxLw7VlnP5l5GQWDI0AaKB
ySv8bHaarLCsLXyqSn7JIXJMiW1W5anHu4yHduRZQahlu27QLtk=
=mDaL
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--

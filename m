Return-Path: <SRS0=0QpP=RQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B52C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 21:09:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 722452070D
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 21:09:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbfCMVJ0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 Mar 2019 17:09:26 -0400
Received: from sauhun.de ([88.99.104.3]:51150 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726263AbfCMVJ0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Mar 2019 17:09:26 -0400
Received: from localhost (p54B33543.dip0.t-ipconnect.de [84.179.53.67])
        by pokefinder.org (Postfix) with ESMTPSA id C43043E4304;
        Wed, 13 Mar 2019 22:09:24 +0100 (CET)
Date:   Wed, 13 Mar 2019 22:09:24 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Kieran Bingham <kieran@ksquared.org.uk>
Subject: Re: [PATCH v7 0/3] i2c: improve i2c_new_{device|dummy}
Message-ID: <20190313210924.GB3480@kunai>
References: <20190313165526.28588-1-wsa+renesas@sang-engineering.com>
 <CAMRc=Mc85U_WmY1RCNMCwMPJoO2jwYxvOaNiBNbuBaigJnoaqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dc+cDN39EJAMEtIO"
Content-Disposition: inline
In-Reply-To: <CAMRc=Mc85U_WmY1RCNMCwMPJoO2jwYxvOaNiBNbuBaigJnoaqg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--dc+cDN39EJAMEtIO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Wasn't there a patch using this new managed variant in at24 as well?

My Lager board has no EEPROM, so I skipped that. I was more interested
in the core parts for now.


--dc+cDN39EJAMEtIO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyJcYAACgkQFA3kzBSg
KbbMeRAAlwHEaXAk4DZcUCvVIUiuz0j9wcNNZXpwpZJsF0+1DAOJ6LpGYRlA4HSM
RpHMTuuiM1rtgoYrW1cp90KalfqCUBYC0+lAT/yE8CWXRCOYMHUfyhDiArDHj0Sy
xSsIsj2dDP6FqzyGSKf//Hqfs4HXAm8kooApELrX7cQaMmarIBqf1avbtF5egR2M
e3jIf21KG6TUhqNw4rpUmj6NOb50XomVKBOgZzTZwPQVdI5YQMxhM0vKX7ck7GYF
RyNXP3gAdg3GqCHFy4Ot46begqMUqLwbU7Bl/D9gmJWw1Jawl5V/GA3x7p9/81g2
iii9XLIGzZemIRnETN/XdUwuWRZiIg1WKFZFO7xCsg9VXs1Pa3EuNWLLVU2ytrrZ
YNKzQFazbucsqVnbmFPjsmkggDynRz7g8mvjIzgBATcthbAiyMyDu660ivzUrv/2
LG4jl3chGqkvYww6YaA6plJCtXas1rMLLwuqV7gaBQy6ZcoZu2WuJ2tPnz2xiKBo
m7HSJeK0KfEK7IYvnKDgpMnhsHgKw+RtkngErH4l9DXbH3jJHNFQA4UOVKAnY5fF
v1BlYCcPMBqegwjDlVHeed7IRx2L2uFHh8QXOHxP2f1R1/BOvTA6L2vcaLTu261U
Mcftv6MvhsDGdZ4aP4UPJDbNaIIcKzt54KCpIKV62mnxMq+B9ok=
=2v3C
-----END PGP SIGNATURE-----

--dc+cDN39EJAMEtIO--

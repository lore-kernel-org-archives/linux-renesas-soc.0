Return-Path: <SRS0=L5iE=S4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E8ABC43219
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 02:44:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 686612084F
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 02:44:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728710AbfDZCod (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 25 Apr 2019 22:44:33 -0400
Received: from sauhun.de ([88.99.104.3]:49198 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728700AbfDZCod (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Apr 2019 22:44:33 -0400
Received: from localhost (p5486CFAE.dip0.t-ipconnect.de [84.134.207.174])
        by pokefinder.org (Postfix) with ESMTPSA id 8259F2CF687;
        Fri, 26 Apr 2019 04:44:31 +0200 (CEST)
Date:   Fri, 26 Apr 2019 04:44:31 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     skidnik <skidnik@gmail.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFT] i2c: designware: ratelimit 'transfer when suspended'
 errors
Message-ID: <20190426024431.GA8275@kunai>
References: <20190424161632.4994-1-wsa+renesas@sang-engineering.com>
 <1a8172c8-3d2e-1897-88dd-d86aa0130ed8@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline
In-Reply-To: <1a8172c8-3d2e-1897-88dd-d86aa0130ed8@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Patched, biult and tested. This is the new output:

Thank you!

> This solves system journal flooding, but I still have one core under full

Good, so the patch is OK and a first step.

> load after resume from hibernation. The touchpad attached to that bus works
> perfectly fine after resume.

Interesting that the touchpad works. From a first look, I can't tell why
there is the high CPU load. Analyzing the call trace, I can see a flaw
in the designware PCI driver, though. It uses UNIVERSAL_DEV_PM_OPS(),
but should use SET_LATE_SYSTEM_SLEEP_PM_OPS() like the platform driver,
so it will be a bit later and allow regular devices to suspend.

Andy? Jarkko? Mika?


--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzCcIoACgkQFA3kzBSg
Kbau1w/+PGoQhieEZFeHWkGQ7zrE8RPNnvujijHYUCWgCq3x+cxkD17KdHlcMHXi
ea96zhZTjrAcFbkldykMroQMmf+nrncSwJItvNdBuez1jcnocdTMGv0RKhniaL6/
9Qbgtw3Pv4C95gcJWsD1q+ooeO7QPo7C54modjLBt/F5WAt5N/EOfZjzmiPtDChb
AJYE9SRn5P2qPJ/iDV9jbWNNPuOX0gjGIeS5Ex7gFpx+TNoS6E1lJLCYaKtEiGSF
ukW2G8MkLCeM99ykEAZJW1zc2jsW/HxEI1lIyBUB/gvpw5vNDyWwJfJGPNA3p9vc
1KvbxV2QRoRJnnIHAce8XFYJChdDSel+CHyX1DzwiPxQqmm7SuO5RSK36Ml9XBlw
lRxqBwh89jlf73c8VZE5yWGNFCHb1YkHTd9gBfQVfb3gAoHdakozO/oIqHqhiFqg
hy8RF8uN+khhmq1g89vqwEjvi8mlkk2oljb9DEC2nvzEeqxVEAbqvL1T9pSqKnvI
63O2fMU4cKPCULTmRB26k0YhSiRfUdsDLl9vkZ5sZjAceS+e/6Zh3gStOfhNQ/nb
FCVfSJX5fJ48vPtZKsy+paigsbJImiF5j5a7Yrj+fiQShYLR9sTrCM/u400Rnzsi
8rFA+m/ZCR6TxbudTNJcPjxJTnk+YmNtah+TDUcQOZvT/ZM9/MI=
=5zWB
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--

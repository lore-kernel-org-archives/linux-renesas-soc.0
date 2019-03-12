Return-Path: <SRS0=vwGd=RP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45FAEC43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 12:12:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 14118206BA
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 12:12:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbfCLMMB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 12 Mar 2019 08:12:01 -0400
Received: from sauhun.de ([88.99.104.3]:38670 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726284AbfCLMMB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Mar 2019 08:12:01 -0400
Received: from localhost (p54B335FE.dip0.t-ipconnect.de [84.179.53.254])
        by pokefinder.org (Postfix) with ESMTPSA id 18C582C282F;
        Tue, 12 Mar 2019 13:11:59 +0100 (CET)
Date:   Tue, 12 Mar 2019 13:11:55 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Hsin-Yi Wang <hsinyi@chromium.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: add extra check to safe DMA buffer helper
Message-ID: <20190312121155.yuug3mfcwxomqmba@ninjato>
References: <20190309105441.18472-1-wsa+renesas@sang-engineering.com>
 <CAJMQK-iDbBhD95Dweq2q8cMpJ65RCKUTzm8CLTYms6BxpqADXQ@mail.gmail.com>
 <20190311184630.5yqy3wf2xkhukwp5@ninjato>
 <CAJMQK-jPPdGO_-UK5qS1rqt0=Xg7RneLvyKApY3EFd33OPnSaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nco6njdw4ej4j6of"
Content-Disposition: inline
In-Reply-To: <CAJMQK-jPPdGO_-UK5qS1rqt0=Xg7RneLvyKApY3EFd33OPnSaw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--nco6njdw4ej4j6of
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Yes. But I think the debug message here is just to tell caller that
> threshold == 0 might not make sense.

I can agree to the debug message. I'll send V2 soon.


--nco6njdw4ej4j6of
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyHogcACgkQFA3kzBSg
KbY24g/+LIZWa9Ex3xmX8UZlRh+CBCMa3McxrOlk1wL7XA8rsqwpBpabTLJXwY/9
7KnQ2vP+MO+MrtBgqLDbWJCTRhMLovy2qMzROn1WFiontajzxDJobGJJEGCgGJRj
ZB7Of8SGa/wInnG6Eep6i0s7YCvLHCqMmdf3RejmCcbLSQC0VJ5GJ1DCuSZHFNjD
384RBNh9UX1DgdrTY2MV01seP/mniTBvdUaRAoQxSaKKcf7UJ1jTDuS2QuB93DYF
9eZNaoSajX3BMfJ2bBmY5RnphIcX0/WH6CIIpsKeN99bUUtQ+t4nUjrYGjJpjWaE
XqjYXLt375ctU+R45eZBdy0icaLYirZSnXcVuF3l3t+fAZwGuJS+ZbAms+jnsHG3
J9q8gobUUgFj+WcsLLFAt1Zi3hkW4hXqfeV9feciT5D4GcGkbcSjUW50O24MApML
0AAvnZlBegDBve4yEY3VrevpWep5FKjLW98qtrhyRJTMJw+f/eqrcsKWpsa9Z20B
v3faUrN09E6YQlxPgwiXcVs8/8siCiyXUPE2Eg7yeduv79/VT63YFtSroZyFdiDE
qnO0Ys5aMKRnNz1IDkSh3Vp4vkcR3qp69O+XX5trceeGoNCOHfUrmFhAzm7zhLGc
/iqpKm0TojgLfwM/QWtybWmUrLXq7dR2miz80fkqFAuAGxgOqwE=
=t+1O
-----END PGP SIGNATURE-----

--nco6njdw4ej4j6of--

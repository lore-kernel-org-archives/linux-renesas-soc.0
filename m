Return-Path: <SRS0=pBJi=SR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 524C3C10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Apr 2019 12:46:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 296352077C
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Apr 2019 12:46:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727389AbfDOMqu (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 15 Apr 2019 08:46:50 -0400
Received: from sauhun.de ([88.99.104.3]:41536 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726042AbfDOMqu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Apr 2019 08:46:50 -0400
Received: from localhost (p54B331F8.dip0.t-ipconnect.de [84.179.49.248])
        by pokefinder.org (Postfix) with ESMTPSA id EE7162C0114;
        Mon, 15 Apr 2019 14:46:48 +0200 (CEST)
Date:   Mon, 15 Apr 2019 14:46:48 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Chris Brandt <Chris.Brandt@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] i2c: riic: Add Runtime PM support
Message-ID: <20190415124648.GA11768@kunai>
References: <20190320103003.20107-1-geert+renesas@glider.be>
 <20190415121718.gdowmtgwqi2aa4zp@ninjato>
 <TY1PR01MB1562BF027EB966ACFE8BB1C48A2B0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1562BF027EB966ACFE8BB1C48A2B0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I will go and test it to make sure it works on RZ/A1 and RZ/A2 and
> didn't break anything, and then reply.

Cool, thanks!


--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAly0fTAACgkQFA3kzBSg
KbZBUg//fVmECXJlQrc48dbdf2UXAk5GiHro6/9K0SlCtgOvnDb8IM5VDVYBrWL+
z4gAiyUf0IAt4InDwdfkAnD9gafs+eI/Ab0fl2Yb5rY3FkxEMx550B4rRsIqXuJ/
nzPC0mKOihhnl3WRfTK//LiCpKkd74o4bxywv3tSeyLwqcRy4PSKMZKqdnb7aC0M
UU04vTXnTi71rmVvvrhsjgN7WQy/U8rzkxgIvxlCrfzjqJm80/MHzPPRS/vHW6MC
gUqyeB2nTNTSh9nzBx2O3p7OcgnJbxIwAzJgcaW8AGVZVQRgY8TqAjHSsUduoWhe
e+B7pK8MyWNfyIBmNbOQfRKxKo06E10+w1rI2FYSVjnWoau5GNQwEEQHp2o/hQGJ
kZmgmQzzjNdhOnZG0yV7Vr01ABqF6wIzizcSzzpkEUXl1A87muo1KnDEynDdOdZS
/v9JgeDq5uf4+lz2IwxqzY6kTR911Em5en3HuAfsShbSf8RY/WjcFBx9J8UnJIEx
4bEZB2+IHBW+oYyp0MHmz2CIzuVW9tQbQSIuyY+5hlZqJIIBPNVSs2sP+IMc5nxg
Nlk1hmhaAov+HN/SjCrU9LkPs9Ir4afW1F3cogtTPDQXA+e1oxmiHSQKq7q5O56v
m476weOfUDfRrRJu7fq2Y16BcU7gI1LZQh4duWM4UrCEREcW7fo=
=yPV2
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--

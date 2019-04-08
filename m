Return-Path: <SRS0=yOlw=SK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0481EC282CE
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 09:01:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C8B2B208E3
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 09:01:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbfDHJBH (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 8 Apr 2019 05:01:07 -0400
Received: from sauhun.de ([88.99.104.3]:60406 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726189AbfDHJBH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Apr 2019 05:01:07 -0400
Received: from localhost (p54B335C3.dip0.t-ipconnect.de [84.179.53.195])
        by pokefinder.org (Postfix) with ESMTPSA id F113A4A134D;
        Mon,  8 Apr 2019 11:01:04 +0200 (CEST)
Date:   Mon, 8 Apr 2019 11:01:04 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH/RFC net-next] ravb: Avoid unsupported internal delay mode
 for R-Car E3/D3
Message-ID: <20190408090104.GB1615@kunai>
References: <20190408082928.22840-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="v9Ux+11Zm5mwPlX6"
Content-Disposition: inline
In-Reply-To: <20190408082928.22840-1-horms+renesas@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--v9Ux+11Zm5mwPlX6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 08, 2019 at 10:29:28AM +0200, Simon Horman wrote:
> According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of
> August 24, 2018, the TX clock internal delay mode isn't supported
> on R-Car E3 (r8a77990) and D3 (r8a77995).

Yes, it made it also into the revised documentation v1.50, see chapter
50.2.7., bit 14.

> +static const struct soc_device_attribute ravb_delay_mode_quirk_match[] = {
> +	{ .soc_id = "r8a77990", .revision = "ES1.*" },
> +	{ .soc_id = "r8a77995", .revision = "ES1.*" },
> +	{ /* sentinel */ }
> +};

I might have missed it but is there a plan to fix this in later
revisions of D3/E3? I was under the impression that it is not and then
we could base it on compatible rather than soc_device_match?


--v9Ux+11Zm5mwPlX6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyrDdAACgkQFA3kzBSg
KbZAhQ//TyBEa/VRyDK+lbouPbW7EXbtYeBq3zBINc8Ax/oQnBr4D56B4K3EkfRu
+Jv4sc8H9bzbIxBi+QwPUFm810/r5/+CX0Z0qWz9CVeRRdfiBp8WGayt9W1m4HiZ
eZejrdcPqdVwz3hZCqjhyKwOx4E0GjW+DeG39ITy2bPGq3JWnyxGo4hwa3IuJJIv
PpReOHzE5jDs1oyJAQ+9daKWm3A55X52S9Dkx1insWFgx8Nxi46zqrOwcm3K/Kbb
qoBlj4Y8At2nrBZTDdnRIhKWK10urF2Wniv6U/LGvg3gE6748n7B6FOIJfZZ5muJ
nxpMXTizK1YEP48tOxWtlYJDftub8yL88JdlP+STuLEWVFfUfKnXwbC+dax7dBSC
bV7IE7wbT7VJH0dQZEHM1GCDBoeuWmvNU78oIvEOXR8amPKytmnUZVqsC2uxbNyg
zRqbNXj/DbUXSTH0/OkQVeSZHmDEu+m1iTIZqCLQ0NMrxfcdumZ7WpFxQ4RxCI7d
79b+BfU3weBQiPtoup73znXQyuGuBxN6ETfvwKD/NrmDOgKG4MFN7e0DgKJy5Wg+
cKvO8ZRI3vm6Pbroy6MnXaT3C3psJ24MHCbDDd0WyypFNiXMhyKd6aNEovrjYnyk
OJYPIbwQYuPWyUm9vt1towpuAsCFQ7rHvaKslHVHSoAMjDXMy9k=
=Eb3w
-----END PGP SIGNATURE-----

--v9Ux+11Zm5mwPlX6--

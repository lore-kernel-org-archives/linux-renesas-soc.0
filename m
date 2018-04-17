Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:55364 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751810AbeDQKFe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Apr 2018 06:05:34 -0400
Date: Tue, 17 Apr 2018 12:05:32 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
Subject: Re: [PATCH/RFC net-next 2/5] ravb: correct ptp does failure after
 suspend and resume
Message-ID: <20180417100532.tfjgm4hewmi42al4@ninjato>
References: <20180417085030.32650-1-horms+renesas@verge.net.au>
 <20180417085030.32650-3-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qlodmfs5yd22xvm5"
Content-Disposition: inline
In-Reply-To: <20180417085030.32650-3-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--qlodmfs5yd22xvm5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> @@ -2302,6 +2305,7 @@ static int __maybe_unused ravb_resume(struct device *dev)
>  {
>  	struct net_device *ndev = dev_get_drvdata(dev);
>  	struct ravb_private *priv = netdev_priv(ndev);
> +	struct platform_device *pdev = priv->pdev;

Minor nit: I'd save this line...

> +	if (priv->chip_id != RCAR_GEN2)
> +		ravb_ptp_init(ndev, pdev);

... and use ravb_ptp_init(ndev, priv->pdev); here.

But well, maybe just bike-shedding...


--qlodmfs5yd22xvm5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlrVxuwACgkQFA3kzBSg
KbYWJBAAkebFh6JKigZcu+Sqs8emANP/15xWRk1as+3P8u1I/B5faLU7xfRIUeNy
32nGExxX68KBNg+Bsk8KqJ+O9JQFbnYDqnzQwFV2i7TDGg29YeOwu8K/Olodx6xv
6D4+AOAVBWP8p4Wnf23j/OpcSrVYgaxqcqspllAmnwwSTP4P85PwNQgSqu8RppIx
NfWxeTvC8uAjHd5ycRDhoTW74iSKePXeLDovwPFZD2FzlqavZEumnNIGgWJVNj29
B26PCI5V4iN4VAOs+rP9vCGP0lOpws2H94Of1KbQEHqKyHiGP1ksJd8pvS9iCKye
XoAk9T78vi0w0Kwbi7hknnW3qZReSh9ZIGk8SRCovOedUBbJwcG0+clKxE6SRxe2
6ruQNeBGw6qjQROnXiTe/Xrz4JvhN/fvoz8tTFLL+TQ8atrb0kV57SmnriC4USLC
f5eFRcTPr6rBw2Ju2PFQWQr/qlrFEc3toEvkysIUx7cxuu+qhWpb5dJdMQSny7Kj
8ikIWP79uVUSRneWJ2PH7IRTRtDIOzOSabFN6HTLQckm7OZWoKcD6HdmxY6pRbjk
G2lMlBIVpnAe5P9NVNTHrDPKAXWicEFbwou0NVphVm5XqX5JkKfNcw09ugOyH2F3
MNyCVIZGt2890JxBTx67BrFE9AiljLuHs/axXlKxQRvoHZoAOgM=
=VRov
-----END PGP SIGNATURE-----

--qlodmfs5yd22xvm5--

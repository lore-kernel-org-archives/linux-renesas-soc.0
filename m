Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 080E5C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 14:18:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C572620856
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 14:18:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbfAQOSQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Jan 2019 09:18:16 -0500
Received: from sauhun.de ([88.99.104.3]:40058 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725935AbfAQOSQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jan 2019 09:18:16 -0500
Received: from localhost (p54B33243.dip0.t-ipconnect.de [84.179.50.67])
        by pokefinder.org (Postfix) with ESMTPSA id 048A82C3F83;
        Thu, 17 Jan 2019 15:18:13 +0100 (CET)
Date:   Thu, 17 Jan 2019 15:18:12 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Simon Horman <horms@verge.net.au>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: ebisu: Enable HS400 of
 SDHI3
Message-ID: <20190117141812.kvyjeja65r7e26jq@ninjato>
References: <20190110142833.31577-1-horms+renesas@verge.net.au>
 <20190117133216.sx7rqao73xy3ne7r@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sd7bkl657h4vc6nw"
Content-Disposition: inline
In-Reply-To: <20190117133216.sx7rqao73xy3ne7r@verge.net.au>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--sd7bkl657h4vc6nw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 17, 2019 at 02:32:17PM +0100, Simon Horman wrote:
> [CC Wolfram, Niklas]
>=20
> On Thu, Jan 10, 2019 at 03:28:33PM +0100, Simon Horman wrote:
> > Add SDHI3 UHS pin control and use it when enabling HS200 support
> > for SDHI3.
> >=20
> > Based on work by Takeshi Kihara.
> >=20
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> > Tested on top of renesas-devel-20190110-v5.0-rc1
>=20
> I would value a review of this patch.

Can you resend with the added CCs, please?


--sd7bkl657h4vc6nw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxAjqAACgkQFA3kzBSg
KbaUpg/+P2YBrB9/z3BFTyfuIJY+KVx7a0ivXZK3TU15a7yhT8hd07j8GHvIq2HD
Yh30c8YS7DP8J7J+wLONnLt7CWdiWaz2GP/v1mMH1OgNtKqVh/ZYeWmwwJKyjeqT
uMWGFy+CwKVJFq2zWfgq1iT14dkknNo98PU379SXPluXf0/VmjdLgrUE67Fe9yVx
AaHoa+DGTYrSbXQ/z/Znw8zNDdJjFv9SVaqfkSDS6q5YxNuPj7OHjwZpmgisQ4Ns
CP+ap4UglRSA1/CM+BaTvSQUPJHJIlQEuC2QBV0MX2zqiNhLDn3PwvruQPCi9ZUg
iCsCE7jx4+PJT4lwc7OdH/MAngbsUJzrALDlivIn7r5hbkCTMyvyb/WZAxVsbSPQ
WMYb/FQOVM8xaXnruDUaaHlo9ba4WXKIUWCVA0pg+kLbSS/rnL4amN3QURgC2y7Z
C30DYj/mQndbuSyUuPLovVi9Ea6hk5wWd4V/RTpHUtK3YMe5ZkEnMv5RzPg39Eb/
Ip/dfW9QqUAVlBlbUIyMcDUvhXz/qKt44VTKjo8YLc2iqK4Ppxvhi4G2F598ysKQ
QSpT2tXrqcUzBIwi9/yH4eHj+YuU/oqK1ggb4PzRTl2lWkFLwYr/A6jFlJnfyGdx
g7tMAKjnihJTbsgr+u5DKIrCUd13AnHMOaLsNfJF8eNQS3XlQcg=
=ZyD/
-----END PGP SIGNATURE-----

--sd7bkl657h4vc6nw--

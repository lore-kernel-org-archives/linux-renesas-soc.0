Return-Path: <SRS0=7Xuf=PR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB7E6C43613
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 10:57:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 98AE0218B0
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 10:57:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730514AbfAIK55 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 9 Jan 2019 05:57:57 -0500
Received: from sauhun.de ([88.99.104.3]:59310 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729752AbfAIK55 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jan 2019 05:57:57 -0500
Received: from localhost (p54B337E0.dip0.t-ipconnect.de [84.179.55.224])
        by pokefinder.org (Postfix) with ESMTPSA id 630A33E4151;
        Wed,  9 Jan 2019 11:57:55 +0100 (CET)
Date:   Wed, 9 Jan 2019 11:57:54 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Simon Horman <horms@verge.net.au>
Cc:     Marek Vasut <marek.vasut@gmail.com>, devicetree@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V3] arm64: dts: r8a77990: ebisu: Add and enable SDHI
 device nodes
Message-ID: <20190109105754.vvqx6uvsktvxeq7a@ninjato>
References: <20181106204647.18051-1-marek.vasut+renesas@gmail.com>
 <20190109104922.z6g772vgncdqqbqt@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="phwlhbwhrxbkakdi"
Content-Disposition: inline
In-Reply-To: <20190109104922.z6g772vgncdqqbqt@verge.net.au>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--phwlhbwhrxbkakdi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> [    3.373714] renesas_sdhi_internal_dmac ee100000.sd: mmc0 base at 0xee100000 max clock rate 200 MHz
> [    3.456829] renesas_sdhi_internal_dmac ee120000.sd: mmc1 base at 0xee120000 max clock rate 200 MHz

No mmc2 initialized. That should work regardless of eMMC. Probably
something wrong in the DT somewhere.


--phwlhbwhrxbkakdi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlw107IACgkQFA3kzBSg
KbZUJA//YTnAX1C+RWIs26zxjrhGtZVQqNchtRQVPrtAgcDh9swKWcOpLbIcEH1W
cb9Ly2QqkKMNMh271IW2SxkaocaQ7vTKl1lwGP3MqKfHc2MB8EWcmOjzRGiASD+P
/LSilcxUpxb2yweyUH/2V/DNSVU1oNgFTn6ux44LqlZEtHgXMxFQY4jXaYrBZ3Mu
2FhnFx6m7NCXYA9bTPZz1eEOsWHxEfCrCJzRqLP29zhg0RiBmOYcwy5GNyaFZfuT
kS1QqD0AwmF17WmekCOBNTKgMKnMHJxIs3yjE7FMDTUKR94eNL9eok2PiXZt8JSv
N1aMmw+5ISR0ZPDn5mlq0H52vCyTRmHu9R6Z1phJdR5MaSh8+ELP1C5GPxudMpfS
BKUzEIN2aX5BmlLhGrDMAhlv3vutKQp03/6Y4ZTXZPhyiDqA1oY4YFuTUCt+/8ny
21sBlIHd+LvU0H3exLLz1yOb3D72unvbNhNVixlmS4LY9qLAXcfTf1bsp/Dt48q3
cCKjmCGElASTJDfxL4PcN5z72eevgKHlIzeMDu/22ZAUVsOK/0mjYN102uONyaTb
nlHG1pndronLO35R1ncv9AqiCKm8bEyjvvBkDFQpE4oCPC0Xl5S3eRpB40LphHjE
17zX5/0YgUZ5hL+roYh96FQB1y8P+kh3XXx7BR6F7j/wJDppdNQ=
=6CtJ
-----END PGP SIGNATURE-----

--phwlhbwhrxbkakdi--

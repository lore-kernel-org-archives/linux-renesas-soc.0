Return-Path: <SRS0=yOlw=SK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F3EC10F13
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 13:40:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9D75521473
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 13:40:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726584AbfDHNkg (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 8 Apr 2019 09:40:36 -0400
Received: from sauhun.de ([88.99.104.3]:34386 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726523AbfDHNkf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Apr 2019 09:40:35 -0400
Received: from localhost (p54B335C3.dip0.t-ipconnect.de [84.179.53.195])
        by pokefinder.org (Postfix) with ESMTPSA id BC67E4A134D;
        Mon,  8 Apr 2019 15:40:33 +0200 (CEST)
Date:   Mon, 8 Apr 2019 15:40:33 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Simon Horman <horms@verge.net.au>
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH/RFC net-next] ravb: Avoid unsupported internal delay mode
 for R-Car E3/D3
Message-ID: <20190408134033.GA5226@kunai>
References: <20190408082928.22840-1-horms+renesas@verge.net.au>
 <20190408090104.GB1615@kunai>
 <20190408094823.24bbzfp63mhzdkaa@verge.net.au>
 <20190408111252.GB4553@kunai>
 <20190408130159.qwqttnl747tyiqwz@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline
In-Reply-To: <20190408130159.qwqttnl747tyiqwz@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I do think that the quirk approach is cleaner, So all things being equal
> I'd slightly prefer to stick with that approach. Shall I drop
> the .revision portion?

Yup, sounds good to me. This way we can also properly describe if TXID
is fixed in a potential ES2.0


--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyrT00ACgkQFA3kzBSg
KbZTJQ/9G2GRG7CfKyEPLV73/B+s3L+WqcT7ncYDti5VeSSSgozIjzxXQ2kn69dj
Oc69GvjKb9z+hjW/kaGT5lwn/FnRNxczv9E/lIQ/BTCIJqil47jsIGa+Up1Sym2A
IOJdSS18pp1x9pETGJmHCSJK8HntJ4+eBE/hLbSb7dXXPQ0dyhosnqSh5GVKQgCT
yiHSTugZmXhkXIbM/C4LoxrArvnQ2DS3iWynZWGQCf+B3oa4PgsMJKWrzlLptcUW
9WhZfu0usN4exI5+7tHgMJ1Q1ZD1beBPK4gNfCTITRXuXD+jTVX7rH2MiZo9H1M8
3HkF1LrbDIqXdx9n/HJTsS7pJHWsB53lDWOpu+R25EA1FL3pITIjYbtCjyC/lsow
nfiY5VaQqzb8xZNSRxw0Qg3zAQVT9USu0PWtdn+pIoSFCrBGGM1npLwEAemjEi/L
6SbBRQ1V7RH3FeuoWrqmHwJk2or4p1PpPaDAHoDGQ3byPe1cn/5qJs0TiOt7iQGO
ELtOHFEdDdM7pUWIztJXsmtledzoULzung+5AMXAR8pPcXgA/0hkNAKsmIW5fiyU
UWxUzc92m18WCN94aQzMMMP/pBwTu7nkx0wlOblmh/QOv/VzDVV+mWCEYl1aDKe6
WLuYFzbGnGYn50hk5Bk5GLpV6F9oT7a0/CpwbbkTQP8UVBJUdt0=
=ecUW
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--

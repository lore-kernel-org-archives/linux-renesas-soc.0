Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA046C169C4
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 21:30:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B7063218DA
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 21:30:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727129AbfBHVae (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 16:30:34 -0500
Received: from sauhun.de ([88.99.104.3]:59852 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726949AbfBHVae (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 16:30:34 -0500
Received: from localhost (p54B331AB.dip0.t-ipconnect.de [84.179.49.171])
        by pokefinder.org (Postfix) with ESMTPSA id AB23B2C282F;
        Fri,  8 Feb 2019 22:30:32 +0100 (CET)
Date:   Fri, 8 Feb 2019 22:30:32 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Haavard Skinnemoen <hskinnemoen@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: Re: [PATCH v2] i2c: gpio: merge two very similar comments
Message-ID: <20190208213032.GF12451@kunai>
References: <20190205125841.12445-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QNDPHrPUIc00TOLW"
Content-Disposition: inline
In-Reply-To: <20190205125841.12445-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--QNDPHrPUIc00TOLW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 05, 2019 at 01:58:41PM +0100, Wolfram Sang wrote:
> I think it is clear enough if we have the explanation once and make it
> clear it is applicable for both SCL and SDA. Reword it a little with
> the help of Simon's native language skills :)
>=20
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--QNDPHrPUIc00TOLW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxd9PgACgkQFA3kzBSg
KbZrtQ//UxZhMtjAu3n64fGJIfgPb1x8QYuHmtiNym5qLMz3ilxOgIYzmadbTJay
QT13I0MyYn8uNk2tA8Sfx2GgCUAFcknWOiw4/l28Efd9WTxagxPXDBViIP86jKHr
XM3RI80DpmNm6bb3rCmr/sYZPAWs9n44+C4Uwd7Kx1RlCbcHzvBu926zOqN8U0O9
mfWLXI9QT280lgfdKIOldBQ6ARkL+10DSDL9c662w23huv4ckkakYhOPCyJ7HUzW
UhPZIPCRbvg1a7IMhZ7mkAHeLmOuuIMeeULi9wELWSy3BTVrLTJikX2NPubDqiBf
KEEFk2uy+/9DCzK7bSu9FDz5ll7OsdEXY+2Pct6OqW7SedtTvpcdnstPIBpAvu6C
/0EgMnxAQ4wm2gERkDvbDd1YoVbHQaM53MsNQthDPl2aC7SD8DhMtfCTUyNJpufZ
WAOIAsFYkRd9EBfgMNidKXTvd2K6LhJt33CFoi3968+ADf5pvOs9v6TgCzG/0MD4
bUAwE9e7MbXOaku18UHkBShpYUE6ObIrV886scyPdsVoJW9whUrcLw1lbVDZ7MeR
I32mMRw7JNClmkFGRpm5CBu9TcXxVFYoV4vLZCv/tADfHLWYwXHXZfLo0RpwMDkv
Sz/fJ9oLbEXEJSwoXS6NfS0hKRFIKnGbpROjcZUB68If4dZb5iU=
=rltL
-----END PGP SIGNATURE-----

--QNDPHrPUIc00TOLW--

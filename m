Return-Path: <SRS0=0QpP=RQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B31B8C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 17:04:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 845942077B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 17:04:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725876AbfCMREu (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 Mar 2019 13:04:50 -0400
Received: from sauhun.de ([88.99.104.3]:49354 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725856AbfCMREu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Mar 2019 13:04:50 -0400
Received: from localhost (p54B33543.dip0.t-ipconnect.de [84.179.53.67])
        by pokefinder.org (Postfix) with ESMTPSA id 53A4D3E4304;
        Wed, 13 Mar 2019 18:04:48 +0100 (CET)
Date:   Wed, 13 Mar 2019 18:04:48 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v2] i2c: add extra check to safe DMA buffer helper
Message-ID: <20190313170437.hicxk4opwq4vgbjt@ninjato>
References: <20190312124442.10098-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="67wjmazvqdgvoai5"
Content-Disposition: inline
In-Reply-To: <20190312124442.10098-1-wsa+renesas@sang-engineering.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--67wjmazvqdgvoai5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2019 at 01:44:42PM +0100, Wolfram Sang wrote:
> Make sure we report 'no buffer' for 0-length messages. This can only
> happen if threshold is set to 0 which is kind of bogus but we should
> still handle this situation. Update the docs and add a debug message
> to educate callers of this function.
>=20
> Reported-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Fixes: e94bc5d18be0 ("i2c: add helpers to ease DMA handling")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Fixed a whitespace issue and applied to for-current, thanks!


--67wjmazvqdgvoai5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyJOC8ACgkQFA3kzBSg
KbbGEQ//dPzvfgEGU3UoguBNSIuHyBSTgkWuM83FlvdPH/Bh5LqFey2Wwg2cZ06y
5zZxuCKiNTNyEQMN1Ph+uQ02kjuw0dY+PitIK//V2mxWdcu3tecQ6wbGge9+dPwK
kVf/x9IHxBvU9beI1l+kxBJNzxuiCRzE7XzObFlyZqcLUmDhQGYSSfRNQuK/TbRV
lhgJpCRqMa6bh6vWLsgQvQ/5TEweF054y7OjzyWmXfl6XD29a13SnkJRKFMCGn8s
e4AeG661YrJQUZfdAOi4LeBJvGaDbgtM2ygCJzBy9yFuLrW54dxcjhg25qRm9V4H
yjLpsu9+Bfj0KkM9fn3K/6C1cM1CCcfgVhq6wKbNWiw+kd9xHJ0ZTCsrCrZpcm5j
ngtqH8/2sXVYwAtVZklWOtuPsEIP7PM8Nt2I1vRMfdhEItNzDEgHTs/4C0Ci5RQ/
eLGoedBejnqq96u8IIbSk882jOmwRJypKQ7Zxxxzem6XxjdF5Ej8HMUEqfCC6D0f
U7tfeEV9NgyyXhl/hhArJd3l7e0QxvRqmd92AuayhdHAVhL7L0WpxcVDeb6faVNR
+Kobv8qittiqU9jQgx+P4wyeAsw8O+WPUCEeWJ5RSosH5YsthPjqE49l3OpxGuwY
uFOllLfAiB/0npwLeehX7Ta3/2atH/7D6bZBBTPKyOvQDUUuwDM=
=UTCV
-----END PGP SIGNATURE-----

--67wjmazvqdgvoai5--

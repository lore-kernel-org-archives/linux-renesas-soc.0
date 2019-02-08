Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92BE9C282CB
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 21:29:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6199D218DA
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 21:29:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbfBHV34 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 16:29:56 -0500
Received: from sauhun.de ([88.99.104.3]:59834 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726949AbfBHV34 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 16:29:56 -0500
Received: from localhost (p54B331AB.dip0.t-ipconnect.de [84.179.49.171])
        by pokefinder.org (Postfix) with ESMTPSA id 5A8E92C282F;
        Fri,  8 Feb 2019 22:29:54 +0100 (CET)
Date:   Fri, 8 Feb 2019 22:29:54 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 2/2] i2c: sh_mobile: use new clock calculation formulas
 for Gen3
Message-ID: <20190208212953.GD12451@kunai>
References: <20190204220010.5671-1-wsa+renesas@sang-engineering.com>
 <20190204220010.5671-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eqp4TxRxnD4KrmFZ"
Content-Disposition: inline
In-Reply-To: <20190204220010.5671-3-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--eqp4TxRxnD4KrmFZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 04, 2019 at 11:00:10PM +0100, Wolfram Sang wrote:
> We could finally measure the clock on an Ebisu board. The new formula
> gives way better results, i.e. 100kHz instead of 106kHz and 400kHz
> instead of 387kHz. Switch to these formulas for all Gen3 SoCs.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--eqp4TxRxnD4KrmFZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxd9NEACgkQFA3kzBSg
KbbH+w/+KhnWhqwFBloodpK6xNCsk/Qs1brn3uP2T1r1dcYtxH3kxRjXpZ1z1StN
UfVJEHpuRHwYXV4cN8AigAKZ7seXOkqMCrb1rKWn7i2wie1mK8XShSTTMKezcneY
rNsjg9cszZ+iy93nrqR3KbZ95aCQsNFgghsgSwwiZHajq61uqOvNeHMj+DArT6Nz
LiIu6Go4MukMza4GhXxq6dkNTXl8nuF/BqSejrVI7ta/LFZ+JpKx9OV8Q04yFsuS
6lPLGDGz3uj8eAfbnogtQa5vTjAPLtKXrYzqL+E/LCD28/qtMqocLRU9yJvm0rXf
HEIBe145YyX4GMp1pWlkk/BTfa1XL/vOTTJ0jiIepWgkixfjhFwQLKNphea5BdgS
6q96qZbFJjsSIxyUZ06dMbBSg4vVUiB7mlEXCvDVDlsAJ7pesCwrvvpz+2iPfD2y
GNf1gi/awkjDrSO7Ha7lGoitq7HNOHkH9XaE8EnCKUcBJ7TxgOSmG6VZwkMeabEw
RLp7tPzhMsRK08txMMf9JVh048Tw4hM9o/4tlM7XrIYXoJ8ZDP7M3NYIJJDg8qf7
/B7ioi63R0rPoCSyS4V0ft0d8fq/dTLEdeAnjIiP2uoGo5EpeQf+ykMrWIndUUDZ
cW7V+1Uic+1GVTKHqB2VuYOSd58/gS+8lfqLUS/ol0kVBgtYZOs=
=yytx
-----END PGP SIGNATURE-----

--eqp4TxRxnD4KrmFZ--

Return-Path: <SRS0=0aVP=RX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE64C10F0D
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 17:20:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9504021873
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 17:20:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbfCTRUL (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Mar 2019 13:20:11 -0400
Received: from sauhun.de ([88.99.104.3]:55172 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726123AbfCTRUL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Mar 2019 13:20:11 -0400
Received: from localhost (p5486CF7E.dip0.t-ipconnect.de [84.134.207.126])
        by pokefinder.org (Postfix) with ESMTPSA id CA4514A1346;
        Wed, 20 Mar 2019 18:20:09 +0100 (CET)
Date:   Wed, 20 Mar 2019 18:20:09 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 3/3] i2c: rcar: wait for data empty before starting DMA
Message-ID: <20190320172009.gqyxlla5ijbwqqhm@ninjato>
References: <20190305175434.13107-1-wsa+renesas@sang-engineering.com>
 <20190305175434.13107-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qsnghys5oq7wzqch"
Content-Disposition: inline
In-Reply-To: <20190305175434.13107-4-wsa+renesas@sang-engineering.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--qsnghys5oq7wzqch
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 05, 2019 at 06:54:34PM +0100, Wolfram Sang wrote:
> When sending with DMA, the driver transfers the first byte with PIO (as
> documented). However, it started DMA right after the first byte was
> written. This worked, but was not according to the datasheet which
> suggests to wait until data register was empty again. Implement this.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--qsnghys5oq7wzqch
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlySdkkACgkQFA3kzBSg
KbYVtA//TRBPUNhpW31ZxpHw0AcB+xtvz6+AUSlhv7VfHPHCfrOhKwo8MAe4bioI
o1hDAUbP8ru6xTCMsvGQpSI37ydZ/8iffzgTFHhAqugD/Wc0gh9TOFSbqL4yIRAB
dQeexpkz77vecfmoMXVrdIFa/S19BTbJq4eCimLDyJ6jfCD8bBP5iwhdmeAeB1T4
y6v4J94N2PVTVyz/xoizRn7NRvAdvjY3uCeVtxjALOvbsNPv/WhXFPQnouig3z0m
ZiNleUBJwHg4n52l3bIvGuHsa68dlubn6vYdlrCDTmN8KhPB+Y5wEYTKhayuvRNL
VhErtI3HA0P/qpDPRE0O3chXCKSskpMlO1fREpcc7+k1bqa7NLU9p7ebw2DjeBXD
MNW7ysXFpmParJXWe5nmT9b9XuQSbr1DqBm2kr6ZNFlqWvaVX/Wm3x3Daks/xS50
ZX/YsF+1NPZDAtvBvm+MI6Mgks1JntaTg2ocUnIc51TKJ55Yxhvw1jFLHEDXsEAF
ee9lvl2RAxAxxzE7k1tm5shxBK6qnIs1UDC4yRuLBwjt4gXQdU1u2UYyx3TS3UtU
D/ktrSpl/x9Y5BdzEuCWmuqCtCACdcT17DLmzxEg1dTzIkqdG2xJahaWk6QAkjHG
BSPm8TgS2nNobgh+37lrMeppRD9U7+1GzpVUXG8xsRL4GjP3LIk=
=Fq+J
-----END PGP SIGNATURE-----

--qsnghys5oq7wzqch--

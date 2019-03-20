Return-Path: <SRS0=0aVP=RX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68477C10F05
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 17:20:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4703821873
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 17:20:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727055AbfCTRUE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Mar 2019 13:20:04 -0400
Received: from sauhun.de ([88.99.104.3]:55154 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726123AbfCTRUD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Mar 2019 13:20:03 -0400
Received: from localhost (p5486CF7E.dip0.t-ipconnect.de [84.134.207.126])
        by pokefinder.org (Postfix) with ESMTPSA id CF3B24A1346;
        Wed, 20 Mar 2019 18:20:01 +0100 (CET)
Date:   Wed, 20 Mar 2019 18:20:01 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 1/3] i2c: rcar: sanity check for minimal DMA length
Message-ID: <20190320172001.uze7emhlr5c3qpoa@ninjato>
References: <20190305175434.13107-1-wsa+renesas@sang-engineering.com>
 <20190305175434.13107-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ainokctvl7nyrh2i"
Content-Disposition: inline
In-Reply-To: <20190305175434.13107-2-wsa+renesas@sang-engineering.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--ainokctvl7nyrh2i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 05, 2019 at 06:54:32PM +0100, Wolfram Sang wrote:
> Use a macro for the hardcoded value and apply a build check. If it is
> not met, the driver logic will not work anymore.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--ainokctvl7nyrh2i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlySdj0ACgkQFA3kzBSg
Kbb/PA//f0q/mTl/MF2NODPENIvMi2pUihmeurziV7mTwOUZIWB868el8gpEem2o
ENMU7Pk/N3fW5PVKuF7U4sZEt5Hs32N9Rgpv8XUPA39uT4NyCm1j04pf01iLYSb6
kkbHxDYkFMcQBZxhVK+mpcImeFWVdEJfkCX6mhHiwXxzYsWcPa2sQOrVYJUuIFQF
WRjKmLGjQb5OOvDmcQa/UFrsa91vR8O/6bIO+63jo38q5FLLK5CW0MJ2iow+3L/0
w3NwHJTDi3IoJptkE5r2m5UNYUTsGc6UCpIP7/dfrTV7BcxvLRRppnQ/cOQFRfR7
9EPPx92RFMgt6b4BXSkwugxdAJYbIn3GbXw9dEMEHMIISSgJcVUqDg31Lz3bgbj7
QTGYxTVU8dW6JKY+ePEtEhVjhab5ObIaXPobxcwx6vY56GskR8Dq6Cnuf6xHp/6f
te10gQuVZAN3CM5MVMqqtGbFOKX+wGDQRvd3SCyl8vEjgnQX98NS5VI3fHXgPDaV
EB+r9CyY//wCL3kbUuycUCS87VeZ8EbI1dykjgrKIqsbjhJ+z+r3C176wdWty9g+
vM0/Qj3XIeh6X6s2PwOWituWleXtUCInHr4uTSJHhvo1jLmvbhb4U+rlYxySllr7
olbVkJMyX64jrfqSAY5gejNUBG0cFKPUPQHi0MxxCiFRic/57JA=
=8/po
-----END PGP SIGNATURE-----

--ainokctvl7nyrh2i--

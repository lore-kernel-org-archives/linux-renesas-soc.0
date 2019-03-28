Return-Path: <SRS0=Kbds=R7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B18C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Mar 2019 08:33:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2C42F2173C
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Mar 2019 08:33:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbfC1IdF (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 28 Mar 2019 04:33:05 -0400
Received: from sauhun.de ([88.99.104.3]:42842 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725779AbfC1IdF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Mar 2019 04:33:05 -0400
Received: from localhost (p54B33178.dip0.t-ipconnect.de [84.179.49.120])
        by pokefinder.org (Postfix) with ESMTPSA id 8CA2F2C27DA;
        Thu, 28 Mar 2019 09:33:03 +0100 (CET)
Date:   Thu, 28 Mar 2019 09:33:03 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        geert@linux-m68k.org, linux-renesas-soc@vger.kernel.org,
        linux-serial@vger.kernel.org, Dirk Behme <dirk.behme@de.bosch.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        "George G. Davis" <george_davis@mentor.com>,
        Andy Lowe <andy_lowe@mentor.com>,
        Joshua Frkuska <joshua_frkuska@mentor.com>,
        Tobias Franzen <tfranzen@de.adit-jv.com>,
        magnus.damm@gmail.com, greg@kroah.com
Subject: Re: [PATCH v2] serial: sh-sci: Support for HSCIF RX sampling point
 adjustment
Message-ID: <20190328083303.GA3993@kunai>
References: <1522856931-6225-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <20190327183555.GA23991@vmlxhi-102.adit-jv.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Content-Disposition: inline
In-Reply-To: <20190327183555.GA23991@vmlxhi-102.adit-jv.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Eugeniu,

> JFYI, quite far away in the delivery chain, we've received below report:
>=20
> > With this patch [2-4] there are reports about broken data
> > communication with 115200 baud with SXM module. Reverting
> > this patch results in successful communication, again.
>=20
> While this scarce information barely helps anybody, I thought that
> sharing it with you might be beneficial in case you collect several
> reports linked to this specific commit in future, meaning it potentially
> adds a regression.

Thank you for this report! True, the information is scarce, but we will
see what we can do with it. If we find something, I'll report back.

Kind regards,

   Wolfram


--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlychroACgkQFA3kzBSg
Kbaaww/+LVuYiU+4atmFKVXLU1lKrSlxoG+su650qn2wiL/LRHBuvlzPzJqmje+q
uL4Q+lOsc9VcFn12RxgedTrDgHJWTs9wqPxuXYKdhgkqbrF+VSmI8VtlljEEvRAl
grzHVocYRWHKcL+LNca1Veodq97sf+ANLBaCKM483Loy2IkyBvwslBcXuir36Csl
LI0Q/GjSB83IzYnhSpIJg+jkq8300ooTqnWIXc2lML43zyiw5btypeW4PRmKTMW2
fvC3zJ0W+ytnCfpvsnF9kZpL7TvQzMhu9iOJ90O50XS/pwQ6MljrJOatETz+uhJh
UkKckm6DPqTvUx0ye6h11CQcmf8FEl1WNSSGOnQA2c2jkwU8i4Dq1y1i/zVEBKqL
oIaFDfYSN3cdhV23k3Ftl6Lh4sxPI95qAWblBBJUNp993iYWnRcQM2DCJnxDTx77
hUNYKBDLK+oes1KBeu1XK0zVfgyM8pv1nfVN0eBQo1qs350zS3bngQVX+WwoRQBL
fgqLWzAFMzy463Ap7Ka3BadfPZa3dxh3SIGLkDkXcYUbqwNzB9B58FiuROrs2pGW
Nb2qh7eSPVC7QVz7ho8+YrHJU8GZDurIM+FUgdBajphvahQFYpQuGvn5AQcrZvMs
4rfc2IaQYX66d7ZO0GuMJSCQ+u9utF1TVBpMssZtAZe/8lClH/0=
=pona
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--

Return-Path: <SRS0=0aVP=RX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F85C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 17:20:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 693CB20850
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 17:20:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727062AbfCTRUH (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Mar 2019 13:20:07 -0400
Received: from sauhun.de ([88.99.104.3]:55166 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726123AbfCTRUH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Mar 2019 13:20:07 -0400
Received: from localhost (p5486CF7E.dip0.t-ipconnect.de [84.134.207.126])
        by pokefinder.org (Postfix) with ESMTPSA id 01E9E4A1348;
        Wed, 20 Mar 2019 18:20:05 +0100 (CET)
Date:   Wed, 20 Mar 2019 18:20:05 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 2/3] i2c: rcar: let DMA enable routine return success
 status
Message-ID: <20190320172005.d2osn5eeo6gadxpv@ninjato>
References: <20190305175434.13107-1-wsa+renesas@sang-engineering.com>
 <20190305175434.13107-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vc66x6n4zzyx3mz5"
Content-Disposition: inline
In-Reply-To: <20190305175434.13107-3-wsa+renesas@sang-engineering.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--vc66x6n4zzyx3mz5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 05, 2019 at 06:54:33PM +0100, Wolfram Sang wrote:
> We will need to know if enabling DMA was successful in a later patch.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--vc66x6n4zzyx3mz5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlySdkUACgkQFA3kzBSg
KbY60Q/+LPqLohcPpDyZqecs82glv6K/ie3CJ8cfusqFFW88NZInzrjJwEHlpr00
Uo+AtbPPV00H+wVl5dGBCJIu95pvoxS2yPs06s98F15UfwvDWUYMB6fkEDvDEtkF
3sWRZcfzvqnJZXtuHcug6JP15Y7ZM7OAKqz5Pe5R/AVlBpxKHr5ZFMT05zi1BTyE
hFMsJbOzejJ/N4IcKBmCtsXwkl6JpKaUwO9RA+VeYeTkI+QZ4vRziYv5f72djubR
0wJKNJ+KDv//GkQ3wBvVy9McP7IDsHRZL+A7X4/YA7IeXDn/ynsvfcbgJfF9hf3i
F0o7ny8w3BAACo5SoEBOv4HPZ2ouiTO3ZUISIB4Nw2Q4WabJmMBNQ27dz6ZOxn63
UZRg9/TITESoajUDlpPfd/gGk1H9qgwCfZr5esirvXotMclbvw94dEJkyHejE0l8
ZrHhwsuvxUw6NPnP7/b5fAf9qat7iLre87I1y+O7k9UQnvJoXQ/CxeR6dXXXMQ/w
cImQVj9cINzDmnCxFxMhvX/CHmQG080EYWEsibBO0wc9xaPV53zo0ZDSY96Ns7lm
5/QJZqsYxBDe+hWMqd8KCeXQLmv6w/OXpACRzrVQxsBL8Og9eaP9sYyse27kcMxS
Ww3yS2nhf/OZyGKLkBU94gi7Cbmkaf8PLnXIxUolCp4nd0I5qTg=
=c17Z
-----END PGP SIGNATURE-----

--vc66x6n4zzyx3mz5--

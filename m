Return-Path: <SRS0=pEya=RU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35DCAC43381
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Mar 2019 21:36:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0472320835
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Mar 2019 21:36:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbfCQVgG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 17 Mar 2019 17:36:06 -0400
Received: from sauhun.de ([88.99.104.3]:58170 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726229AbfCQVgG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Mar 2019 17:36:06 -0400
Received: from localhost (unknown [81.92.17.147])
        by pokefinder.org (Postfix) with ESMTPSA id 1F2912C27DA;
        Sun, 17 Mar 2019 22:36:04 +0100 (CET)
Date:   Sun, 17 Mar 2019 22:36:03 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH i2c-tools 2/2] tools: restrict all addresses defined by
 the standard
Message-ID: <20190317213602.GB1471@kunai>
References: <20190311223335.18586-1-wsa+renesas@sang-engineering.com>
 <20190311223335.18586-3-wsa+renesas@sang-engineering.com>
 <20190315142446.5571d5aa@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Content-Disposition: inline
In-Reply-To: <20190315142446.5571d5aa@endymion>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jean,

> > The I2C standard reserves addresses 0x03-0x07. Adapt our tools to that.
>=20
> I have a different interpretation of the specification. Addresses
> 0x04-0x07 are marked as "Hs-mode master code". They are not explicitly
> marked as "reserved" (although admittedly the table is named "Reserved
> addresses"). My understanding is that HS-mode will "use" these

Yes, my understanding is that the table lists all reserved addresses.

> addresses, which means that you can't use HS-mode _and_ slaves at
> addresses 0x04-0x07 on the same I=C2=B2C bus segment. I do not read this =
as
> "non-HS-mode slaves can't use these addresses". But maybe this is just
> me, and also I don't know that much about HS-mode really.

=46rom the spec, section 5.3.2: "Hs-mode master codes are reserved 8-bit
codes, which are not used for slave addressing or other purposes."

> Address 0x03 is indeed reserved, so obviously that this really makes me
> wonder how the original range of 0x03-0x77 was decided. Unfortunately
> the git history doesn't go that far (this range was already used in
> i2cget and i2cdetect at the time i2c-tools was split to its own
> repository).

My theory (only guessing, I didn't check): When introducing Hs-mode, the
I2C designers wanted to have the possibility for 8 Hs-masters. So, they
took addresses 0x04-0x07 (and the R/W bit) which allows for easy logic
in HW. And 0x03 was marked "reserved for future use" because it was in
the middle of those two reserved blocks. That would mean that before
Hs-mode, addresses 0x03-0x77 was in deed possible.

> That being said... In the end it doesn't really matter if addresses
> 0x03-0x07 are considered reserved but "should not", as long as the user
> has an option to override that limitation. Now that such an option is
> consistently available for all i2c tools, I have no objection to being
> more conservative by default.

Cool, I read this as an ack. Thanks!

   Wolfram


--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyOvcIACgkQFA3kzBSg
KbZT3xAAmpogBg/iMEOQ+qNqTrW/pUTCM7Aim/BCsMdjr1huOV+S5Qgiyz2Xxn+V
UvPTOx9F5xGKrYmY9FC9wU1xl7EZDX5T8YDH6gKD3uwC5V9XzlXTaJ94h6ELYCUL
mRPTLHcPAEBIJrChhgiA/HkTPjgJV3zGgWQdFslzaXMtfnLv8GZih0WaHbM8JH1s
Se+nJ9o1+Vsf0mbO3hXrK8gD1XegZ1k9zfhi2mx+sUbrGQnCWeJdWRl/5RzxqTmg
HhrHAbb56434gSjc/ZiLLJyIF08DR0VWHW2CZiwlvnDaJAlRCwOcVoVXbXLkFkxr
+622n7sTiRNhwuTVSw2vL4aySLAzbHuRO4KTY+C6DlollhySTcZw3KD90fRZ8UvG
PcpQgJAtI8yZL9JChJUXppOARmGw1d0ZT1XNcM0pSFfjVHIQYKSLVEKosM7I4VbF
+biCgjHUmGL1pEbmdVxABRXoQWlgkKIF4bqkQBlc278DALdyzWDdZ2xCJVnjlO2V
HN3wclsbScakCHgCK1mYD4uhE1bxyOAs32qDa1EPLZMxZtLwZO5n0zcIgWE6nVqS
7EQMOMHHFpBzZJq9FIkEggm6unN+XO7ws0pXsVHwbESxGD3qZoCD9KIlMhmoHIke
MdJ9NFuQ2yBUiZF3fPhlPG1ABpgFkx6CN6yhIG8Vnbp33NNgZQs=
=kZKV
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--

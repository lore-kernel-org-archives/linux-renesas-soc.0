Return-Path: <SRS0=Fsko=S3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1BCC10F03
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 07:47:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 54323217D7
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 07:47:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbfDYHrW (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 25 Apr 2019 03:47:22 -0400
Received: from sauhun.de ([88.99.104.3]:43716 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726184AbfDYHrW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Apr 2019 03:47:22 -0400
Received: from localhost (p5486CE26.dip0.t-ipconnect.de [84.134.206.38])
        by pokefinder.org (Postfix) with ESMTPSA id DC6B82CF687;
        Thu, 25 Apr 2019 09:47:19 +0200 (CEST)
Date:   Thu, 25 Apr 2019 09:47:16 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     skidnik <skidnik@gmail.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFT] i2c: designware: ratelimit 'transfer when suspended'
 errors
Message-ID: <20190425074716.qdkmtuyovoqnc6fo@ninjato>
References: <20190424161632.4994-1-wsa+renesas@sang-engineering.com>
 <ce8b3f16-2874-c7b8-d8ee-34664d0169db@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="e74oevczl5z4i5od"
Content-Disposition: inline
In-Reply-To: <ce8b3f16-2874-c7b8-d8ee-34664d0169db@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--e74oevczl5z4i5od
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2019 at 11:54:17PM +0300, skidnik wrote:
> > There are two problems with dev_err() here. One: It is not ratelimited.
> > Two: We don't see which driver tried to transfer something with a
> > suspended adapter. Switch to dev_WARN_ONCE to fix both issues. Drawback
> > is that we don't see if multiple drivers are trying to transfer while
> > suspended. They need to be discovered one after the other now. This is
> > better than a high CPU load because a really broken driver might try to
> > resend endlessly.
> >=20
> > Link: https://bugs.archlinux.org/task/62391
> > Fixes: 275154155538 ("i2c: designware: Do not allow i2c_dw_xfer() calls=
 while suspended")
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
=2E..
> I have little experience in compiling and applying patches, guess I can a=
dd
> this diff as a patch to linux-mainline PKGBUILD and try to build it. I'll
> try.

Great, thanks for trying!


--e74oevczl5z4i5od
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzBZgAACgkQFA3kzBSg
KbajRQ/9F2o14npIM3MHd5T9scvHxb3NGbfA/y4Cub5I/uHEqSQf4KsrQKYA4jPl
/60jNSZ/udjzi6f9JAAijE5KsQy53FxjlbAzOytHPf6mHygwtiAqrbO0SbKXOfE0
fNPuW8XP/lJlVPmrITTG508i9mEPaCEIzYEyKBP1AT/MnUqZGxUg7jiJgXMh4U7e
ycctrnHjjD3uf6tw81nzV71ofZOfbvKekl1VbvIu2NIpMi5E5bpejfiyUoD11eg7
SDrmtVCMVUPDb2PCEsPIfarndGhkdobiBIQ5zMQpOy+qMs8c/iomlYLt1ovplqi+
XI5INESIi1dD6pZsB/wqhKwN3tvVy98O98IvD9ACAYxidAGf2QoiWBJlvEwU5siC
HGZNalaLL39w8jJlv97M0PqRIlPR4/sElZ7i9qpzVvIGWgXjuvzHbwin9axxSKJJ
oUJLe7LOVNP66X8zp8LbyHiWawkJAulN1YyFXzTkLzwKdJdni3l32pzzFSN79bpR
YwgZeo+Tn94Eu9P3puZaLb2dN284JSp7hZtMmYAtbPD4Lhb2YeRXJUwxtC+fy7Hk
wHz2Q2/rwCfRcEIsvs3sW9Ily9S4nRI3FBL3CNPhxY9w2suaIvEwy2/6WGxi9XbO
g6rK49QYIsjiud9n7m1qbKQLyFm2EZTuhDiD2vJZhIlYfl/GPCc=
=dAap
-----END PGP SIGNATURE-----

--e74oevczl5z4i5od--

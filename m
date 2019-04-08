Return-Path: <SRS0=yOlw=SK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3743C10F13
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 10:56:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8E3A4208E3
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 10:56:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbfDHK4X (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 8 Apr 2019 06:56:23 -0400
Received: from sauhun.de ([88.99.104.3]:32958 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725984AbfDHK4X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Apr 2019 06:56:23 -0400
Received: from localhost (p54B335C3.dip0.t-ipconnect.de [84.179.53.195])
        by pokefinder.org (Postfix) with ESMTPSA id 14B784A1351;
        Mon,  8 Apr 2019 12:56:21 +0200 (CEST)
Date:   Mon, 8 Apr 2019 12:56:20 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Simon Horman <horms@verge.net.au>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH/RFC] arm64: dts: renesas: ebisu, draak: Limit EtherAVB to
 100Mbps
Message-ID: <20190408105620.GA4553@kunai>
References: <20190408083148.23134-1-horms+renesas@verge.net.au>
 <20190408084143.GA1615@kunai>
 <20190408094550.omzfxgsxalux7pxv@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline
In-Reply-To: <20190408094550.omzfxgsxalux7pxv@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > +		max-speed =3D <100>;
> >=20
> > What about adding a comment explaining this speed limit?
>=20
> Sure, if you think its worth highlighting in the dts as
> well as the changelog.

I think this will be helpful for people just getting a tarball of the
kernel and no further history of it. But just 2=C2=A2 here, nothing major...


--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyrKNAACgkQFA3kzBSg
KbbT9A/+Oa/QjgSw6bCCRJdcPHQ/eKzHHZiizboanxjDJf/9k94rEJVEWg/L93Xp
9peNz/mi9G1KCz0CNVY0IkV4XdXqhdGitdhIqXE3hd4ZYObbg/XC6OvFqQwUwViE
SFQuebAi+VSCZ/ikUHZxJ/kNieyWPnH2IL6//AMRonyvJ7ESRRnwnWLViBLSjch3
Oy6rvIMfZlNfubcbLV/Jp6orESmY5sLR/MViqTMUNETT5H6z9zLfnnmNGsSkgNs7
ItsIxS6PR80PHxy7924gqbsgFscO2j2bns7FIq/SijyByJTZVt414mNZnOHXjLJB
sUDqLatJaFKFeWkq/RFelD6di5dNnPG507JTtMuVnrS2K5Spsn8yvcFqHIpe1TrO
qoKjfH/e49VK0WJ4X/xA8HKeAr1SqKP9iM0FeVHAuXrVKrEV3Nwx9ZfNC6J5a+DF
x80/ouAJ7wkOoqPzFZvJ0oUwFrLccNnGjFX4x8gFuJXQaWaBZoPtrk5k8nXC7LTS
R1pbOaF7/Y5+2KcQHEXOfPAdSihfKZrAKd2GNSLTqSky1V8LsqKBtiYTM+//meJg
JTMa1i6CYM1XMFPst/E2H3S0EETJHmlJI6a5Twj7W7MYq0blZgC+N3qyOQe3L800
1NWPIamQqOkZapBHj7VSa6PobMYRbCsSEfMHJ8KkBDpc8sUwG0E=
=eixi
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--

Return-Path: <SRS0=qJci=OX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D055C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 16:14:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7FF98206E0
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 16:14:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729933AbeLNQO1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 11:14:27 -0500
Received: from sauhun.de ([88.99.104.3]:44996 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729931AbeLNQO1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 11:14:27 -0500
Received: from localhost (p54B6730A.dip0.t-ipconnect.de [84.182.115.10])
        by pokefinder.org (Postfix) with ESMTPSA id 01F794C0E8F;
        Fri, 14 Dec 2018 17:14:23 +0100 (CET)
Date:   Fri, 14 Dec 2018 17:14:22 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v4 3/4] serial: sh-sci: Resume PIO in sci_rx_interrupt()
 on DMA failure
Message-ID: <20181214161422.GB4236@kunai>
References: <20181213184444.21904-1-geert+renesas@glider.be>
 <20181213184444.21904-4-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="24zk1gE8NUlDmwG9"
Content-Disposition: inline
In-Reply-To: <20181213184444.21904-4-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--24zk1gE8NUlDmwG9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 13, 2018 at 07:44:43PM +0100, Geert Uytterhoeven wrote:
> On (H)SCIF, sci_submit_rx() is called in the receive interrupt handler.
> Hence if DMA submission fails, the interrupt handler should resume
> handling reception using PIO, else no more data is received.
>=20
> Make sci_submit_rx() return an error indicator, so the receive interrupt
> handler can act appropriately.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--24zk1gE8NUlDmwG9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlwT1t4ACgkQFA3kzBSg
Kbbdnw/7BCXNyz4hhWDj3pPv0kGSp0BETt2k8U6FdLksxBp/Sf3JugLqYE543aPI
Jk3h2baedFiERJRt54ajq2tUTxt8ZoBN+tf6k+63Z+/Wni8VWtQf8M2KYxmmqZIK
U9PVbjoKe95VbAXQDs/QObbOTL2qZnroGOGi33mXiwsGndrjFy/hCjLnd5PJOC46
ZcuMnqai4f25TR4ca9MiJ5zE3OzuAfTI+o/+MLNwXJfjMyOShf4fZfxol9Sc1Zdc
kEp2ITne/nPgll1PLgLD/525TmMPYouaeaSdvNwC9Ie+dmWM446zB5wgRwakv55R
n7BNk3u9wsn5O4StFXhc32oliOMQ9rVPaNgxRJcgJGKyBLP4qYhEL9BUs5497FcL
c+eS6llS2XDXj4dVQho9ANKS8Pykr/hNAZ7LsMGVPff1z+f2bHIk8AWLJx0Qf7he
REsNvEN4XIkxnMIKJlz7PkdmLGOIzxn/cvTJJhNtB/hMXkRdQ1Vppw2s1kypxqzO
JCDBVKbfneL8jUNDuWSs6yfDlyPyT0IGl0rZuLykmWJpSsltY9ehZP8HXf3vDNV1
7RqF/pk8wRQD72yvBDuDlrW1OUqczuGhPreg+BWeBbu+YPl5bEs7yIuA5D2c+T+s
FqVzjjNMV1/TQBy2Pr++9BmpVTiUTDfpcJnWtLNlleXS6OHMhiQ=
=wzjE
-----END PGP SIGNATURE-----

--24zk1gE8NUlDmwG9--

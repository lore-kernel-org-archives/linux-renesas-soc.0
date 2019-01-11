Return-Path: <SRS0=sjaF=PT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A832C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 12:45:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DD6DC20872
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 12:45:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732427AbfAKMpT (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Jan 2019 07:45:19 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:51771 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729913AbfAKMpT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jan 2019 07:45:19 -0500
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 9C6EB1C000D;
        Fri, 11 Jan 2019 12:45:14 +0000 (UTC)
Date:   Fri, 11 Jan 2019 13:45:22 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 0/4] pinctrl: sh-pfc: rcar-gen3: Deduplicate remaining
 VIN pin definitions
Message-ID: <20190111124522.plpetipyztebwsyw@uno.localdomain>
References: <20190111122705.32365-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vjgxyjthrmg22asd"
Content-Disposition: inline
In-Reply-To: <20190111122705.32365-1-geert+renesas@glider.be>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--vjgxyjthrmg22asd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Geert,

On Fri, Jan 11, 2019 at 01:27:01PM +0100, Geert Uytterhoeven wrote:
> 	Hi,
>
> As of commit 50f3f2d73e3426ba ("pinctrl: sh-pfc: Reduce kernel size for
> narrow VIN channels"), the infrastructure is available to avoid
> duplication of pin definitions for narrow Video IN (VIN) channels.
> Make use of his to deduplicate the remaining VIN pin definitions on
> R-Car Gen3 SoCS.
>
> This is similar to what was done before for the wide VIN channels e.g.
> commit 9942a5b52990b8d5 ("pinctrl: sh-pfc: r8a7795: Deduplicate VIN4 pin
> definitions").
>
> This reduces kernel size for an R-Car Gen3 kernel by almost 1 KiB.
>
> I plan to queue these in sh-pfc-for-v5.1.
>
> Thanks!

Thanks for this. I have compared the new tables in the series with the
removed ones (but not against the datasheet, as I assume what was
already in the driver is correct).

Please add:
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

>
> Geert Uytterhoeven (4):
>   pinctrl: sh-pfc: r8a7795: Deduplicate VIN5 pin definitions
>   pinctrl: sh-pfc: r8a7796: Deduplicate VIN5 pin definitions
>   pinctrl: sh-pfc: r8a77970: Deduplicate VIN[01] pin definitions
>   pinctrl: sh-pfc: r8a77980: Deduplicate VIN1 pin definitions
>
>  drivers/pinctrl/sh-pfc/pfc-r8a7795.c  |  90 ++++++------------
>  drivers/pinctrl/sh-pfc/pfc-r8a7796.c  |  90 ++++++------------
>  drivers/pinctrl/sh-pfc/pfc-r8a77970.c | 128 +++++++++-----------------
>  drivers/pinctrl/sh-pfc/pfc-r8a77980.c |  64 +++++--------
>  4 files changed, 115 insertions(+), 257 deletions(-)
>
> --
> 2.17.1
>

--vjgxyjthrmg22asd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlw4j+IACgkQcjQGjxah
VjwmAA/+O0QTYPfF50YR6IoKbKCU2BtQ5anOThVh5WBu+J6sW5AfZ7ZvfzedGaTS
J9dzJRKuWELG29ahJLft7tXFEQehT+RDSe+hdylYOa9o/tbiABPSxgeaH1G+8H0t
NKzHJfF+OjeKbuxLT9Eqg3yBL1he+0g807nYHgPyQ6NHg4rcQ2mot0YozR0Tu1ma
k/J+9JfI/rmUNQJLkaNr3nqOLlFDuCsAEy1qDf0A0OodNv5MzsGuPVIO2pMJct15
VDsrU6b9HxD0XvPsWhnhs3d0ncX0PDt96oknRxm4BCh8oCxZGkHa6exxgzyKz7As
JDY8DP4xzFOJ23YCnT+W+/e5kZiCI4l4z4fXz4N62TW0Er4B2zhMVRjVDGEtdlzg
TOUIybkZKZ/1zTN9qknYwFJ0givdF18ttHP1PXBm2wMFmXNDrG0WvVP6ugCHWJ+/
6XETAkPmLUDf1MNc+UJ05Bkp+A8BYs+fyvDwsS9LJqDswfIrQY0CjtGB8BZExYtt
aTCBraAi6ntBMjaktAOvh0570JL8rjuyZ2SqwZukm+JIbvh3Qz9Rp21iMtQEBh0H
zaapKKJYS/Zo/Od+vHNLPtzj63cBMjxQa77lfdT/Iw8AXW/DxAOcBYL5PCzj9GPl
xOfk1xTQpHgDWPAf/vq7KJqvmLe00YnbqGCAneAC/viLPDa0mFg=
=vyiS
-----END PGP SIGNATURE-----

--vjgxyjthrmg22asd--

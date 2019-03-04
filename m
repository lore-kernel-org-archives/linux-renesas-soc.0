Return-Path: <SRS0=YxuQ=RH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2BFC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 11:14:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3D70021019
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 11:14:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UciOG2LB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726226AbfCDLO5 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Mar 2019 06:14:57 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39651 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbfCDLO4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Mar 2019 06:14:56 -0500
Received: by mail-wm1-f65.google.com with SMTP id z84so4269829wmg.4;
        Mon, 04 Mar 2019 03:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=A4H9vC7QhItOnbyRaLiFBCyD+GeVzRUufCeoIsduVw8=;
        b=UciOG2LBiYZV8EumfhJbJpnCrM/J1Kn71BHyluh9/82RxCvUbAl7dQPkN5pLVDmv5B
         3OPwFUiqbhw39Dookn+DVh822lE2TptQgrRpBsxlOv73kTX5XAaX+17jbvvks3hUzT3Y
         vonVnfGixJsNuTPez4PzyHd/bWRBgB6BouYQjWaS+t5t2iJIbl3TLVX00sBUgj3JwQr1
         0kd/0k0Hp488kcjP0P/5SLO9LK/yFU98zIqXmcBYxjg1rgAeb0/jUR3FKZgfB9M5i/f9
         oI1vV+/DN60yuD3YszugeS1FgUpJx+8Cocmtk/yLCk0zRP7NRbA7UdyWd855Nde3d8xC
         WZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=A4H9vC7QhItOnbyRaLiFBCyD+GeVzRUufCeoIsduVw8=;
        b=qtVdF/Pc9GzYMyInwMB0d4Exn9mUncEc+jKqiZmaW1xss+4O5wGujNAgmCM+mI8znI
         MgcbsKr89zBEAougFI9PAqWC3lvaiS9RQLjpTMubX0zpf7IpCKKnU6QmEcB+9iGR55mT
         SKpICZfNl216FfekN/poJcUrs6MUOyeVdsTVgoaM+o1bISkkXyE0at+JfjEhQC2hrBQL
         cEVAsFYsPVnf9SvmVO4FoGJVt61ViC3bh6c20CcsFOf14myOWcFUXS9InnLg1PpKyzJR
         3ldLB6eDdieJsA7TY0KfDmGuaJT8FWBIFoZv657UjJiFsK2i+PHxW20dVPKm2u+YXQr7
         rQCQ==
X-Gm-Message-State: AHQUAuZmLaKY711ujpytY0jwgBYrIpxE+m/jwXpreuiTmo+j26MdUxdy
        iDqUVNbEDUUynUWOSnj/Yu46E78v
X-Google-Smtp-Source: APXvYqzc6A1BpsQiSaLSc/LqknKjE+m7+9O6pw9ufmHMlRmOsbjUzTR79WHcyFLGcSltk5Af08vWdQ==
X-Received: by 2002:a1c:720f:: with SMTP id n15mr9927105wmc.64.1551698093227;
        Mon, 04 Mar 2019 03:14:53 -0800 (PST)
Received: from localhost (pD9E51D2D.dip0.t-ipconnect.de. [217.229.29.45])
        by smtp.gmail.com with ESMTPSA id b195sm7147596wmg.36.2019.03.04.03.14.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2019 03:14:52 -0800 (PST)
Date:   Mon, 4 Mar 2019 12:14:51 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-pwm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 0/4] pwm: rcar: Add support "atomic" API and improve
 calculation
Message-ID: <20190304111451.GC5121@ulmo>
References: <1547021948-7664-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="XWOWbaMNXpFDWE00"
Content-Disposition: inline
In-Reply-To: <1547021948-7664-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--XWOWbaMNXpFDWE00
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 09, 2019 at 05:19:04PM +0900, Yoshihiro Shimoda wrote:
> This patch series adds support for PWM "atomic" API and improve
> the clock calculation.
>=20
> Changes from v2 [1]:
>  - Add Acked-by of Uwe in patch [234]/4.
>  - Modify a condition to support normal polarity only.
>  - Fix possible to output wrong a duty cycle when disabling in patch 1/4.
>  - Fix overflow value on 32-bit arch in patch 4/4.
>=20
> Changes from v1 [2]:
>  - Remove workaround code of output pseudo low level for now because it is
>    rejected on the ML.
>  - Add a condition for polarity because the HW doesn't support polarity c=
hange
>    in patch 1/4.
>  - Improve the clock calculation in patch 4/4.
>=20
> [1]
> https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=3D632=
19
>=20
> Remarks:
> On the email thread of patch 2/4, we discuss about suspend/resume
> handling and I suposed to improve it. However, I need more time
> how to improve it. So, for now, I don't improve it on this patch series.
>=20
> [2]
> https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=3D531=
93
>=20
>=20
> Yoshihiro Shimoda (4):
>   pwm: rcar: Add support "atomic" API
>   pwm: rcar: Use "atomic" API on rcar_pwm_resume()
>   pwm: rcar: remove legacy APIs
>   pwm: rcar: improve calculation of divider
>=20
>  drivers/pwm/pwm-rcar.c | 99 ++++++++++++++++++++++++--------------------=
------
>  1 file changed, 48 insertions(+), 51 deletions(-)

Applied, thanks.

Thierry

--XWOWbaMNXpFDWE00
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlx9CKsACgkQ3SOs138+
s6GvXBAAtQ63hJn8VU76YX0xf+hldzGWYzwFe2NrcZVW2zsBo7E93/MS2bDgQUXf
X5iFiRgNPWaHTpvxumNBHMo4Xl7ZwyMJHFvzFVuIYLr3DQ9otjJnpUxur6XBlMYl
+ePGcip2cbuEA8lqrhKs1A3H6l8UJ5cJJjy62oWkl0emwe4hVLwI0RwejDIs5pFT
7tYNwR/hLW0ku2iLcfG6jgmPM+hDAwmBexh8XoyQW9DHFG5XaVF/jDlQ8XWkZNME
kZ4C7q7mpt3giD9GUJPdSU1nzjkm8PS1O6IkovjCASLMAxCKzBJVEIPNpro0azWe
v9xvUb8uQxWBu4OxfT4tJSnPoWUkyQMt0V5MMDAoy39gnFCd9mgYTnSlSr3NISvA
0WNW5mUQxXMqnE57wTcj+ikE6MOiflbxpiPKq9zv6Jwk4xfGRHnIrX4CU+UT9Wp0
HuoPcOfrEDUED+Yh7cmXCifurj+7tKETARtJqrpaS/Ho+wK3R1fky6cSnwAzxnBJ
mZ2tcgGl0AGH4afZoOSHkNZPy528Juv6UI7ePq0ERRszPoaHwjBfBdAJ7SgrD3FU
Pv7RiULroMeSgH9DwVeiznmWDujXxOERDPKrBSqQHzPX0mCFVJj8d+/Gvf6+hDoK
lwXSfw8jvCy+Q1bgKrUDxh2CRsqkmC9oTSft1YFJ4wyBHNPgzoQ=
=a31g
-----END PGP SIGNATURE-----

--XWOWbaMNXpFDWE00--

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:47574 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726934AbeKMVzJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Nov 2018 16:55:09 -0500
Date: Tue, 13 Nov 2018 12:57:18 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Hoan Nguyen An <na-hoan@jinso.co.jp>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?utf-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        =?utf-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        =?utf-8?B?44Kr44Kq44O744O044Kh44Oz44O744OJ44Oz?=
        <cv-dong@jinso.co.jp>, Eduardo Valentin <edubezval@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Subject: Re: [PATCH] thermal: rcar_gen3_thermal: Add supports the hwmon
 thermal sysfs
Message-ID: <20181113115718.327dw3maw26bzkcd@ninjato>
References: <1542091543-31597-1-git-send-email-na-hoan@jinso.co.jp>
 <CAMuHMdVXN3ZpXwbODrOWThCE+y0mxkOriDOjDGo2rXEG1asOaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="flsidio6bx43qzs6"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVXN3ZpXwbODrOWThCE+y0mxkOriDOjDGo2rXEG1asOaw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--flsidio6bx43qzs6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Please run scripts/get_maintainer.pl on your patches, to get the list of
> maintainers.
>=20
> CC thermal

Thanks, Geert!


Hi Hoan,

> +		/* Enable hwmon thermal sysfs */
> +		tsc->zone->tzp->no_hwmon =3D false;

A driver diving so deep into core structures always looks suspicious.
Questions I have:

1)

We have that code also in rcar_thermal.c, but the commit introducing
it[1] has a reason which does not apply for this driver, or?

2)

of_parse_thermal_zones() intentionally sets this flag with this
comment:

/* No hwmon because there might be hwmon drivers registering */

Why does it not apply for us?

3)

If it turns out, we really need it, there should be some thermal core
helper or flag for it, I'd think...

Regards,

   Wolfram

[1] 64a411e8042e ("thermal: rcar-thermal: enable hwmon when thermal_zone_of=
_sensor_register is used")


--flsidio6bx43qzs6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvqvB4ACgkQFA3kzBSg
KbZeoRAAnb7LRuVItFADKUHj+tFoFp7z/XU2W4QAWkLlFtVW+M/M/BlgdSRdLseq
9966kHtSkptqpfADmrP1ZoGF189lwDWG0LbykVomOgyqZSWmInlrJ9ewJ2PrP2Fw
IYPSPSNVxVKzTViAO8rYGPcR0ePDr7yxRc35Q6o7G1B6VkHo89AQ7ii4j+x5V5qU
+yp/a6hyuoOk7yk+h2/ahg3PbqEzZtL2GxBgX7SiNSaDgKSILFLGxOvR/W+w6Wxc
OBwHL4ecDJU71rdjJaX65ZN9d7sAPPwX9+6UA/tZox7qLdbJkrW4bZGP1k8tfQtG
5qbf6Mn7M6Unp5kdNcrncEnJEOh0PAx1Kp840+A793VMDdoWTInVk3O/JYmk9yn+
PcSg1GIsbutEmc1yY94/UEwcgFg2MfOdIYORJPo7l+Nwb2MfHLZIQsD1sOQbByIC
mYouZ8gLV36WnbXYdrFk0aTaE3i32WPyb2JpIisnyrU9rrkfMCHR8Cvf4t7pZuiZ
6+sRDh9X18lqslBNd8z1NBXOlNse7QsAe8yBjUVGVe5Q6ccJrFuH8j6+dsE174xe
N0LQfLxS7k8bV98kttNw/LTCXBDja5PXCIz32SvYojOTDGTSlnHJ6V0MgNvMzxtI
lo02kZuEJW+/jq8BSMWQ/ah23YKVsEhAyHHCBhfgJFsOsKJSRdY=
=nHGy
-----END PGP SIGNATURE-----

--flsidio6bx43qzs6--

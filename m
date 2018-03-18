Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:51555 "EHLO
        mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754689AbeCRXun (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 18 Mar 2018 19:50:43 -0400
Received: by mail-wm0-f50.google.com with SMTP id h21so12100890wmd.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Mar 2018 16:50:42 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH 3/3] nvram: at24c: use a sane default for
 "rom-size"
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        qemu-devel@nongnu.org, linux-renesas-soc@vger.kernel.org,
        Michael Davidsaver <mdavidsaver@gmail.com>
References: <20180312214230.17561-1-wsa+renesas@sang-engineering.com>
 <20180312214230.17561-4-wsa+renesas@sang-engineering.com>
 <5108cc9b-9fb9-d202-d4bc-a5c1dd4d4f76@amsat.org>
 <20180313201649.w44jtdbk4bow2f7x@ninjato>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f90bfd58-1f51-dc72-a67a-c0021345f9ba@amsat.org>
Date: Mon, 19 Mar 2018 00:50:30 +0100
MIME-Version: 1.0
In-Reply-To: <20180313201649.w44jtdbk4bow2f7x@ninjato>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="FUyLHEgzR0MXMtDtFfnP6N6h1EN29bNpZ"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FUyLHEgzR0MXMtDtFfnP6N6h1EN29bNpZ
Content-Type: multipart/mixed; boundary="7jrvbtmUIGjQxexCa9Wc6Igyo55xros3i";
 protected-headers="v1"
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, qemu-devel@nongnu.org,
 linux-renesas-soc@vger.kernel.org, Michael Davidsaver <mdavidsaver@gmail.com>
Message-ID: <f90bfd58-1f51-dc72-a67a-c0021345f9ba@amsat.org>
Subject: Re: [Qemu-devel] [PATCH 3/3] nvram: at24c: use a sane default for
 "rom-size"
References: <20180312214230.17561-1-wsa+renesas@sang-engineering.com>
 <20180312214230.17561-4-wsa+renesas@sang-engineering.com>
 <5108cc9b-9fb9-d202-d4bc-a5c1dd4d4f76@amsat.org>
 <20180313201649.w44jtdbk4bow2f7x@ninjato>
In-Reply-To: <20180313201649.w44jtdbk4bow2f7x@ninjato>

--7jrvbtmUIGjQxexCa9Wc6Igyo55xros3i
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On 03/13/2018 09:16 PM, Wolfram Sang wrote:
> Hi Philippe,
>=20
>>>  static Property at24c_eeprom_props[] =3D {
>>> -    DEFINE_PROP_UINT32("rom-size", EEPROMState, rsize, 0),
>>> +    DEFINE_PROP_UINT32("rom-size", EEPROMState, rsize, 128),
>>
>> This patch should goes before your 2/3 in your series.
>=20
> I don't mind much, but why? My reasoning was "let's first fix the cause=

> and then the symptom"?

The '0' case is worst than incorrect, it segfaults, so you are right :)

>=20
>> Can you add a #define for this value? Such AT24C_ROMSIZE_MIN.
>=20
> Can do, of course. But won't that give room for regressions because
> people are already using it with lower values?

Your patch already introduce the regression :)

I prefer self-explanatory #defines than magic value, but I see your
point, so if we can not decide a value, can you add a comment to explain
the magic value? I think the clearer is to add a #define with a comment.

>=20
> Ideally, we would have a "model" variable. The model type would define
> the size of the memory. The "rom-size" variable could then be kept as i=
s
> (except for the 0 bugfix) or deprecated?

IMO there are too many AT24C eeproms to model, so the "rom-size"
variable is the easiest way. Your patch #2 is simple enough to avoid the
#DIV/0!

>=20
> Thanks for the review,
>=20
>    Wolfram
>=20


--7jrvbtmUIGjQxexCa9Wc6Igyo55xros3i--

--FUyLHEgzR0MXMtDtFfnP6N6h1EN29bNpZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAlqu+0YACgkQ4+MsLN6t
wN4WeRAAzJ/q0BunZ2yh+CjOwq0jk6tCRr9YR6OJ+xxx21mMjCBHesxFBNozml0n
H0YkxymnFAdpRAGMwbmitaa3ltCp8s4etxcCLl0QgF9f7GCv3A+3SAmt9p0kSPka
FCMkqU86xWwqdO2n5EJhu9WQHOmShH35hITRdQIA0tSzCYlCI5XiuaY4El12Jk+c
sRIv5ZbjTOkvmpLtksMLJHYOmOjXM6VepmE2ePu7qBq6sHpHCnBxorMYFfcUu2wQ
o/Ss8u9HvyEx2WuKGG1ebO2OX3zs5a/EV4tzrnlvhN8Ey5aMNJo2wq8puvumMRjc
PssQBxbkERA1MbVsFGoPsJKSnj9WjWkAvMMRoRbrphJln3ztZ2RUV0O0WRVEyRj/
Ly/RMoLpMLHOSFwNfrEyUZ8/PMtI9yGONbqsQBbd7qVPodmt01d5CfkSgfXzZyxh
lIHGeH5astj3EGSxnUyDV+ctttswqGQ3MchPCbmDxipa6PfVHabG5wPIc/QGJPdq
zlY9oSxP++Y+092HSdtrfVJQJcWwMxCQRMk8PxMoJm5hMVb/zzJ2nDTIVrbRb+xk
5o6y33S6GPQf9qBW5FhWFX7PzNXqPocScsr9E4ITzq3putMp2kpHzyicvVTZKUht
PPDPdP31i7VO1sFln+T32Z8oJza/Jmshmg7EgRVi6gIyHBmfdjU=
=O5lZ
-----END PGP SIGNATURE-----

--FUyLHEgzR0MXMtDtFfnP6N6h1EN29bNpZ--

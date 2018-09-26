Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:41952 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726937AbeIZSj0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Sep 2018 14:39:26 -0400
Subject: Re: [RESEND PATCH] drm/shmobile: Replace drm_dev_unref with
 drm_dev_put
To: kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20180926115525.24500-1-tzimmermann@suse.de>
 <7e35303c-7bcd-1c6b-6986-40c4413e57aa@ideasonboard.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <2721d64e-f3a4-9e0a-3af8-dfec8b1bd90c@suse.de>
Date: Wed, 26 Sep 2018 14:26:38 +0200
MIME-Version: 1.0
In-Reply-To: <7e35303c-7bcd-1c6b-6986-40c4413e57aa@ideasonboard.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="CwEGeIJNx2TnwkwnQyji0thRZ0FdwdLdr"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CwEGeIJNx2TnwkwnQyji0thRZ0FdwdLdr
Content-Type: multipart/mixed; boundary="mCLgeStQ982TpuIsTcms5vbUeZcWOiDnm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kieran.bingham+renesas@ideasonboard.com, laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <2721d64e-f3a4-9e0a-3af8-dfec8b1bd90c@suse.de>
Subject: Re: [RESEND PATCH] drm/shmobile: Replace drm_dev_unref with
 drm_dev_put
References: <20180926115525.24500-1-tzimmermann@suse.de>
 <7e35303c-7bcd-1c6b-6986-40c4413e57aa@ideasonboard.com>
In-Reply-To: <7e35303c-7bcd-1c6b-6986-40c4413e57aa@ideasonboard.com>

--mCLgeStQ982TpuIsTcms5vbUeZcWOiDnm
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

thanks for reviewing the patch and the one for rcar-du. Please also add
them to your tree.

Best regards
Thomas

Am 26.09.18 um 14:14 schrieb Kieran Bingham:
> Hi Thomas,
>=20
> Thank you for the patch,
>=20
> On 26/09/18 12:55, Thomas Zimmermann wrote:
>> This patch unifies the naming of DRM functions for reference counting
>> of struct drm_device. The resulting code is more aligned with the rest=

>> of the Linux kernel interfaces.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
>=20
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>=20
>> ---
>>  drivers/gpu/drm/shmobile/shmob_drm_drv.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/dr=
m/shmobile/shmob_drm_drv.c
>> index 6ececad6f845..8554102a6ead 100644
>> --- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
>> +++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
>> @@ -194,7 +194,7 @@ static int shmob_drm_remove(struct platform_device=
 *pdev)
>>  	drm_kms_helper_poll_fini(ddev);
>>  	drm_mode_config_cleanup(ddev);
>>  	drm_irq_uninstall(ddev);
>> -	drm_dev_unref(ddev);
>> +	drm_dev_put(ddev);
>>
>>  	return 0;
>>  }
>> @@ -290,7 +290,7 @@ static int shmob_drm_probe(struct platform_device =
*pdev)
>>  	drm_kms_helper_poll_fini(ddev);
>>  	drm_mode_config_cleanup(ddev);
>>  err_free_drm_dev:
>> -	drm_dev_unref(ddev);
>> +	drm_dev_put(ddev);
>>
>>  	return ret;
>>  }
>> --
>> 2.19.0
>>
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstr. 5, D-90409 N=C3=BCrnberg
Tel: +49-911-74053-0; Fax: +49-911-7417755;  https://www.suse.com/
SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Jane Smithard,
Graham Norton, HRB 21284 (AG N=C3=BCrnberg)


--mCLgeStQ982TpuIsTcms5vbUeZcWOiDnm--

--CwEGeIJNx2TnwkwnQyji0thRZ0FdwdLdr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAlurev4ACgkQaA3BHVML
eiOChgf/byVrs/JABsWxF/z9MCjgENoJHPFjTwTHe0RUCvIngGexBJ3KSTFGEc+k
+LzH8lFwHfIHYvciP3bmZnIlO2pEAJ5DIqcfMIAm6MDY4f9ZUtOu5dQvPnKmmmfC
WjR9wOWhQBCztHx7/I/SwgPjAxoj6TfdN/d9VS+SXmeNxrMSEWhLfynbhn7qkzxm
d//eKEwQ3Ny7iBbDUIHxOhmo77br4R4b38EwqrtvHfDEvuOGDJFq2EfdR2kFxvek
xfgIFH95ZQI38+tKg++Z6G50IV0DaIJ4lp3oyNH7v0tD+yifV7mPgNMvWjxhyF7L
E77OqzqoG8aKNvdIQ+cE3lqN+9Q62g==
=6o74
-----END PGP SIGNATURE-----

--CwEGeIJNx2TnwkwnQyji0thRZ0FdwdLdr--

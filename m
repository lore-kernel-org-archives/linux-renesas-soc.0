Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:29867 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751111AbeEUKUh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 May 2018 06:20:37 -0400
From: Felipe Balbi <balbi@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "gregkh\@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc\@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH/RFC] usb: gadget: function: printer: avoid wrong list handling in printer_write()
In-Reply-To: <OSBPR01MB22935EE44B856F9612DFB8C8D8950@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1526632641-30086-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <87r2m58pir.fsf@linux.intel.com> <OSBPR01MB2293D296A8A8F8249A6E6BFAD8950@OSBPR01MB2293.jpnprd01.prod.outlook.com> <87603h8mea.fsf@linux.intel.com> <OSBPR01MB22935EE44B856F9612DFB8C8D8950@OSBPR01MB2293.jpnprd01.prod.outlook.com>
Date: Mon, 21 May 2018 13:18:50 +0300
Message-ID: <87wovx71md.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:
> Hi,
>
>> From: Felipe Balbi, Sent: Monday, May 21, 2018 5:05 PM
> <snip>
>> seems like it would be better to just move this like before
>> usb_ep_queue():
>>=20
>> modified   drivers/usb/gadget/function/f_printer.c
>> @@ -631,19 +631,19 @@ printer_write(struct file *fd, const char __user *=
buf, size_t len, loff_t *ptr)
>>  			return -EAGAIN;
>>  		}
>>=20
>> +		list_add(&req->list, &dev->tx_reqs_active);
>> +
>>  		/* here, we unlock, and only unlock, to avoid deadlock. */
>>  		spin_unlock(&dev->lock);
>>  		value =3D usb_ep_queue(dev->in_ep, req, GFP_ATOMIC);
>>  		spin_lock(&dev->lock);
>>  		if (value) {
>> +			list_del(&req->list);
>>  			list_add(&req->list, &dev->tx_reqs);
>>  			spin_unlock_irqrestore(&dev->lock, flags);
>>  			mutex_unlock(&dev->lock_printer_io);
>>  			return -EAGAIN;
>>  		}
>> -
>> -		list_add(&req->list, &dev->tx_reqs_active);
>> -
>>  	}
>>=20
>>  	spin_unlock_irqrestore(&dev->lock, flags);
>>=20
>> --
>
> Thank you very much for your patch! This could resolve the issue.
> So, should I submit this your patch as your author?

you can send it with your authorship, it's totally fine :-)

You can also add my:

Acked-by: Felipe Balbi <felipe.balbi@linux.intel.com>

thanks

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlsCnQoACgkQzL64meEa
mQYlYxAAlwvec3Hw7d32hm8/p++T7vYsoHvdwB/JbsadO2nmIQsQWSySsN3FKGzo
CFLyC/uo7fz04I1oCkX++lPz5QL6xu36Ga4CW6uKAK5QwjFVXrgSOn+N2TV6sGeQ
EFtWt4YncHheSbsu1qzO/F7c4b+NCBBRbco7OyjSFZJsc3JTmS1VtxqUQ0F0D7p/
mTgE5P79uCG/3e4GjdvPh4zqfDsizrDd6m16CzSwKvra9oITYlJNX5RhSFMwQkzh
px4u9qzHiIlulUGtLBzK9Sg/dLmY42tfhYhNNwknhBaoBJ0L2BmDZ57UppGhGFhA
kRshINr+gdT99QlvK9g2QXvJKnuRPiAyvDa5M9IV6BfWF/b2zb+h/5B3/Rfhk2GX
29PKPT8It8XxSTD2jS54MfUvNyN5oKaN5NCbIw/7hphyr+Ojow2PCJUpzPKi9it6
k+393woSdv1rgFwFiK7YmlU90zREkNvXFXwPpkQzdHONxkdWNhx/PTfSoOhc2FCg
gFwRkOGlCG1+NIZp75NQxK9KNd7KXT9trvIQd85t/0oewVIWD3uTfzHIxPJlD4zx
DicPjW6/Kg5Kv7dSeMAYzGwUcnvZP0VJUwSg/XrYsqcOpYNbELbzJx+LYtzVR+01
jDVBai7cIfMVaGdWgn1I25XOghaDxPFnNj1bdn47S3uaHfV0Fuc=
=5Fsw
-----END PGP SIGNATURE-----
--=-=-=--

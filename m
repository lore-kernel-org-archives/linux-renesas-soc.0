Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:51479 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750898AbeEUG7J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 May 2018 02:59:09 -0400
From: Felipe Balbi <balbi@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH/RFC] usb: gadget: function: printer: avoid wrong list handling in printer_write()
In-Reply-To: <1526632641-30086-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1526632641-30086-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Date: Mon, 21 May 2018 09:57:16 +0300
Message-ID: <87r2m58pir.fsf@linux.intel.com>
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
> The usb_ep_queue() in printer_write() is possible to call req->complete().
> In that case, since tx_complete() calls list_add(&req->list, &dev->tx_req=
s),
> printer_write() should not call list_add(&req->list, &dev->tx_reqs_active)
> because the transfer has already finished. So, this patch checks
> the condition of req->list before adding the list in printer_write().
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  This issue can be caused by renesas_usbhs udc driver. I'm not sure
>  this patch is acceptable or not. So, I marked RFC on this patch.

can you explain this a little more? How do you trigger the problem?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlsCbc4ACgkQzL64meEa
mQaxfRAAhu0BaNNfERDpSYmcZgW8TcWagivRYYNp5DUWVjjfyX8g33+3kGmIgt3Y
TJOGI1aZaJNpUGP9Vfj57zIeE44MNMMTiwoYhbA2yWlkSggSPnSrz7Fvq/2OB3m9
o3hbNhDqIRX9zxam3a6N0JEWMTgvnTuRjv2JsjwlLPMzApuYkAm6KDfggOcYyLGm
Z95wsxRe8NNMwQx7re1Ra7z8bfNKf+vQZsLMWcJAR0dSw8kTk/HRhMBc4XTqnSS5
v5zAAaCkJ3Hk7W5UWuFQ1elRQDh4BEtAKxPtor1QwfqzCsvgfsFAA9+9RA+OS3Vp
IpeZe0QcdJit9idJCFcmRPLTR8N0HhuTnO9I4k10aQ5zuN7lR3h48SdUljRtpC3Y
KwvSBMJIRviXn5mHJ/pw7mG/Cjb65Ut6qU9u3pzfsv6YLiVSSsgprH/iFab4KXET
b9vEMAx3D1jgmBhFObo6h2b5fU6QsGjpOipg9yolPYpPnGJCzHmeFEXRjULP4Bzx
shrjzhtIfkebVxPDDMtFtjO24gufz09BS1Pb2XGDYcYXPAI9mXWyjD+D4+E/Z/5r
yzMXu93CMSNKTh1AiHKGhIDqB+B5esmBBkxqyaM4Qg9Hgzg5AZjWpV+4WHI4L7tY
pcDCDfjhK8kYXL8WHRuDoVkVSow1oo2Qr6UDsIGuRuZ1jA94jrY=
=duRm
-----END PGP SIGNATURE-----
--=-=-=--

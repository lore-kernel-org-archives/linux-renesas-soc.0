Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:33149 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750910AbdFBJte (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Jun 2017 05:49:34 -0400
From: Felipe Balbi <balbi@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "gregkh\@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc\@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/5] usb: gadget: udc: renesas_usb3: add DMAC support
In-Reply-To: <TY1PR06MB09923F1ACA6B07A4D43ED674D8F90@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1493207411-24416-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <TY1PR06MB09923F1ACA6B07A4D43ED674D8F90@TY1PR06MB0992.apcprd06.prod.outlook.com>
Date: Fri, 02 Jun 2017 12:48:56 +0300
Message-ID: <87fufivhx3.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:
> Hi Felipe,
>
>> -----Original Message-----
>> From: Yoshihiro Shimoda
>> Sent: Wednesday, April 26, 2017 8:50 PM
>>=20
>> This patch set is based on the latest Feribe's usb.git / testing/next br=
anch
>> (the commit id =3D 28ea6be01e2cf244c461a40c8e9593816f894412.)
>
> I'm afraid but, would you review this patch set?
> This patch set can be applied on the today's testing/next branch.

I was thinking that we need the fixes during the -rc cycle. No? In that
case, we need to get rid of the dependencies between 1-4 and patch 5.

patches 1-4 are in my testing/fixes now.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlkxNIgACgkQzL64meEa
mQZwEw//e1herj441fyKYH4CXvZPUQ9NGkyD64nsHjcfwgJBe0+2uPMWjAYWf9OL
NjGeaCP6OHUk7pA4uDHZAHgnPXe5NQSlwSSh2XAEuGMzuLrSHvwrYu3fDGI//gRi
V+vRZZPqviAPUpmsCw4vpSA8NTr9FukOEaueW1HbUzqSM/CD/3w1AmKPQxgpB644
39+RGV67MCxWQpckTKqSz1/1jo0kfPtrLJkNOMxsSYdtRgBPBemdz3RHWUeL6iya
fwMy3MNNh7bMPjasz7gdpOhakUOAJKpex/T8jnlb+1VuoudUqx0hftekM9dgm5cE
3J+GdjHnDrn0BANslA7rma5T+eAVT98SIUZL1QWaXNxm5T8LHpjHfJi4VLD8Ugf0
JD366NchFonQFA4EyiVAnEwReSaV8jpEewiDAPQTsinAvX2eR0eDeL0RVTzIKlwG
7HG6zM4XnzyvRyTfG40RL5BupUfaZwJX7lBiPcd+SEy6SAV9AyhlRSnUuY/AjurI
jzgYOEdnLH14aVilJOgHXq86ImufKnuIJmGxJk/E2KXQ5QPZ1YcZxBcIujW3IKOt
BocnqCMEgZXrAH16gsGWnIxzGsb4bv25ZXjaYKoDJp/NlmUURT1s3YzVqwEJ6zCX
fkG30N5bpRVSwtXBvFql2SLwoaHjleH+TrtPFeOHnASRsQHriOg=
=tqCA
-----END PGP SIGNATURE-----
--=-=-=--

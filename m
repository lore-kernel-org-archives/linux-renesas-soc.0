Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:33972 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751389AbdFFJkb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Jun 2017 05:40:31 -0400
From: Felipe Balbi <balbi@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "gregkh\@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc\@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/5] usb: gadget: udc: renesas_usb3: add DMAC support
In-Reply-To: <TY1PR06MB0992A258F9BD28CED69B7618D8CB0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1493207411-24416-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <TY1PR06MB09923F1ACA6B07A4D43ED674D8F90@TY1PR06MB0992.apcprd06.prod.outlook.com> <87fufivhx3.fsf@linux.intel.com> <TY1PR06MB0992A258F9BD28CED69B7618D8CB0@TY1PR06MB0992.apcprd06.prod.outlook.com>
Date: Tue, 06 Jun 2017 12:39:36 +0300
Message-ID: <87y3t5sbdz.fsf@linux.intel.com>
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
> Hi,
>
>> From: Felipe Balbi
>> Sent: Friday, June 2, 2017 6:49 PM
>>=20
>> Hi,
>>=20
>> Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:
>> > Hi Felipe,
>> >
>> >> -----Original Message-----
>> >> From: Yoshihiro Shimoda
>> >> Sent: Wednesday, April 26, 2017 8:50 PM
>> >>
>> >> This patch set is based on the latest Feribe's usb.git / testing/next=
 branch
>> >> (the commit id =3D 28ea6be01e2cf244c461a40c8e9593816f894412.)
>> >
>> > I'm afraid but, would you review this patch set?
>> > This patch set can be applied on the today's testing/next branch.
>>=20
>> I was thinking that we need the fixes during the -rc cycle. No? In that
>> case, we need to get rid of the dependencies between 1-4 and patch 5.
>
> Indeed.
>
>> patches 1-4 are in my testing/fixes now.
>
> Thank you!
> I will resubmit the patch 5 later.

Thanks a lot :-) If you can just rebase it on my testing/next, that'll
help a lot already. We will have a couple conflicts when merging, but
I'll make sure to solve them ;-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlk2eFgACgkQzL64meEa
mQaLlhAArYKZbSKVU+k8syXfHuYramJ6TTB6YnLJIG5qTQ5SBFBtUGfomC/hITtH
Ch3gK4qwdmSRIaT2dQjeP9fWhtxq5MHg+hVUGLPp72G2WM7HYl96yUiTbW3a3jct
/LzsUA1sMDkDWOlT5EoK9PyRHR5ZvIzwGUNlcFSerInh+sP5064QrvSm891WqJo7
phiVYs7LWqyCsycXtbhWefN8RRJ0shpB8M0eC7B2n0M8EE4f5UefmW3YOqoU5EhV
WibIEGuuwIEzrGgu5LMOvAfy8FHYrKWdyffxKACYRsCv2QxJTvm/PHX4hoQXG8++
NkUx4TuI84FysA46BIeR25QkFS7mEnNzFlZI3u7CPTl4gGN2nIIAIgldZAFQWNmJ
WS8PgzoUYajO9/RgwUXp5pZ4Vgo/Y02OBw4nZyn0LuTAEU1TEZ4kEtEtFJf4YSWx
O0iPyUGK2ex/fUzRUKZbSUH24+4q9piyAWOna3bQbDmtI6SqiaArbgTH2gxXgouT
J9K1VxQMXyn0waI6yCx0Gfwz+LEILbxffU8uT+yKBfef2CHwjjVDhP/nnr9NgqgD
jkcS2QbAsXVxvedBNQ2mQ8FsLs1cyZT/mKfnY5AkJqSnF7q0xfBEQTVMcjLe3lZ6
AWsAdd6l1N7GYzCq5eLtNFcECQKsq7OXma/Ky4ikhX+mT9H1S64=
=BIth
-----END PGP SIGNATURE-----
--=-=-=--

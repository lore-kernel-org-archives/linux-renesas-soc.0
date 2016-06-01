Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:44010 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751488AbcFAHvX (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 1 Jun 2016 03:51:23 -0400
From: Felipe Balbi <felipe.balbi@linux.intel.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"mathias.nyman\@intel.com" <mathias.nyman@intel.com>,
	"gregkh\@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-renesas-soc\@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 0/2] usb: host: xhci: rcar: fix the quirks setting of XHCI_NO_64BIT_SUPPORT
In-Reply-To: <SG2PR06MB09197E3B4C185C618230B608D8470@SG2PR06MB0919.apcprd06.prod.outlook.com>
References: <1464763483-6224-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <87bn3ll7ei.fsf@linux.intel.com> <SG2PR06MB09197E3B4C185C618230B608D8470@SG2PR06MB0919.apcprd06.prod.outlook.com>
Date: Wed, 01 Jun 2016 10:49:04 +0300
Message-ID: <8760ttl573.fsf@linux.intel.com>
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
>> From: Felipe Balbi
>> Sent: Wednesday, June 01, 2016 4:01 PM
>>=20
>> Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:
>>=20
>> > I'm afraid but I found a regression of xhci-rcar in v4.7-rc1.
>> > This regression is caused by the following commit:
>> >
>> > commit b1c127ae990bccf0187d741c1695a61e54de1943
>> > Author: Felipe Balbi <felipe.balbi@linux.intel.com>
>> > Date:   Fri Apr 22 13:17:16 2016 +0300
>> >
>> >     usb: host: xhci: plat: make use of new methods in xhci_plat_priv
>> >
>> >     Now that the code has been refactored enough,
>> >     switching over to using ->plat_start() and
>> >     ->init_quirk() becomes a very simple patch.
>> >
>> >     After this patch, there are no further uses for
>> >     xhci_plat_type_is() which will be removed in a
>> >     follow-up patch.
>> >
>> >     Acked-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>> >     Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>
>> >     Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> >     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> >
>> > < Overview >
>> > The regression is the quirks flag "XHCI_NO_64BIT_SUPPORT" will be over=
written
>> > by xhci_gen_setup(). Then, the driver will not work correctly.
>> >
>> > < Detail >
>> > Since the previous code will do the following, the quirks flag can be =
set:
>> >
>> > xhci_plat_setup()
>> >  -> xhci_gen_setup(hcd, xhci_plat_quirks);
>> >   -> xhci->quirks =3D quirks;
>> >    -> get_quirks() [This is xhci_plat_quirks]
>> >     -> xhci->quirks |=3D XHCI_NO_64BIT_SUPPORT
>> >
>> > However, after we applied the patch above, the quirks will disappear:
>> >
>> > xhci_plat_setup()
>> >  -> xhci_priv_init_quirk();
>> >   -> xhci_rcar_init_quirk();
>> >    -> xhci->quirks |=3D XHCI_NO_64BIT_SUPPORT
>> >   -> xhci_gen_setup(hcd, xhci_plat_quirks);
>> >    -> xhci->quirks =3D quirks; <----------------- here
>> >     -> get_quirks() [This is xhci_plat_quirks]
>> >
>> > So, I submitted incremental patches to resolve this issue like the fol=
lowings:
>> >
>> > xhci_plat_setup()
>> >  -> xhci_priv_init_quirk();
>> >   -> xhci_rcar_init_quirk();
>> >   -> xhci_gen_setup(hcd, xhci_plat_quirks);
>> >    -> xhci->quirks =3D quirks;
>> >     -> get_quirks() [This is xhci_plat_quirks]
>> >      -> xhci->quirks |=3D priv->quirks (XHCI_NO_64BIT_SUPPORT)
>>=20
>> isn't the following enough?
>>=20
>> @@ -4886,7 +4886,7 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_q=
uirks_t get_quirks)
>>  		xhci->hcc_params2 =3D readl(&xhci->cap_regs->hcc_params2);
>>  	xhci_print_registers(xhci);
>>=20
>> -	xhci->quirks =3D quirks;
>> +	xhci->quirks |=3D quirks;
>>=20
>>  	get_quirks(dev, xhci);
>
> Thank you for the comment!
> You're correct. This also can resolve the issue.
> Do you prefer such a simple patch?
> At least, I prefer such a simple patch :)

I'll defer that to Mathias :-)

> Why I wrote this patch set is I thought I should implement similar
> flow before regression.

understood :-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXTpNwAAoJEIaOsuA1yqREPgoP/02cXXnv2H1dA5qvs5U6mMsW
rvxmnD4wrFgaYmmBEGuC6+6y1XIzJSv8BivOFegwV7qhW609X9TD9uq7lOMTSUeU
MNnSUOgIN61He9tuamyoUOt/oPNsN0EUQ5GeaBpQ9cgjHmy6w9KhVj53s0c0L2G1
o61I4GWVfa2AYdQ5geFtTUdCr0chVDsEzKlOS+QMUEqn7h8qL3TXSa62Im98jouh
rLgj+JSGfZbc1IUDwtrCpkUdcN7RFOrBqITSa4YmBrUiwV1D4ya/62vtstDSg41n
TkjQaNeBnjcOj8vDPxUibODuryfdx646viOBOFzVO/M6SsVHtX+o512Cl+IvOfh7
5EmZOKquk/TvYvpnccYPnJq+8Ey26kBFyY1ZVOEGfsNXusdjFGJtcSICKIpL0IyF
mJ41QbGVphO4oD6VLohR/+2JTSDFeLKfvI+xTDfHwOE9xwOpa4pKpc6i3h14R1CU
ZZLX3kr6ydPhpB4Sk6+MohWNOV33onTkJXdzX/vudN/hRZQwe0iBKVhR0wsCdkuV
47US5x6MC3LrFjLf4XjVwMbxptJbKBcOnbDhvt4k3V8E37Bw62+Bn/0ObSf/SxSM
J0nv6Ez+bS7JK/LBk2sA5aM5uuvvWrujvKFNl9Flna8LYC5L6lBf0i1ZP37je0Ru
nb2B95PN6db4fcyPwU5N
=eJPC
-----END PGP SIGNATURE-----
--=-=-=--

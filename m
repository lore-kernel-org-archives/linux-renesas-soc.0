Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:64520 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751714AbcEFH4g (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 6 May 2016 03:56:36 -0400
From: Felipe Balbi <felipe.balbi@linux.intel.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	stable@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v3] usb: host: xhci-rcar: Avoid long wait in xhci_reset()
In-Reply-To: <1462515611-6972-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1462515611-6972-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Date: Fri, 06 May 2016 10:54:27 +0300
Message-ID: <8737pvipu4.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:
> The firmware of R-Car USB 3.0 host controller will control the reset.
> So, if the xhci driver doesn't do firmware downloading (e.g. kernel
> configuration is CONFIG_USB_XHCI_PLATFORM=3Dy and CONFIG_USB_XHCI_RCAR
> is not set), the reset of USB 3.0 host controller doesn't work
> correctly. Then, the host controller will cause long wait in
> xhci_reset() because the CMD_RESET bit of op_regs->command is not
> cleared for 10 seconds.
>
> So, this patch modifies the Kconfig to enable both CONFIG_USB_XHCI_PLATFO=
RM
> and CONFIG_USB_XHCI_RCAR.
>
> Fixes: 4ac8918f3a7 (usb: host: xhci-plat: add support for the R-Car H2 an=
d M2 xHCI controllers)
> Cc: <stable@vger.kernel.org> # v3.17+
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

looks good to me, thanks :)

Reviewed-by: Felipe Balbi <felipe.balbi@linux.intel.com>

> ---
>  Changes from v2:
>   - Modify the Kconfig instead of xhci-rcar.h
>     http://www.spinics.net/lists/linux-usb/msg139681.html
>     http://www.spinics.net/lists/linux-usb/msg139722.html
>
>  Changes from v1:
>   - Revise the commit log.
>     http://www.spinics.net/lists/stable/msg130007.html
>
>  drivers/usb/host/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index 3050b18..e9d4dde 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -35,6 +35,7 @@ config USB_XHCI_PCI
>=20=20
>  config USB_XHCI_PLATFORM
>  	tristate "Generic xHCI driver for a platform device"
> +	select USB_XHCI_RCAR if ARCH_RENESAS
>  	---help---
>  	  Adds an xHCI host driver for a generic platform device, which
>  	  provides a memory space and an irq.
> @@ -63,7 +64,7 @@ config USB_XHCI_MVEBU
>=20=20
>  config USB_XHCI_RCAR
>  	tristate "xHCI support for Renesas R-Car SoCs"
> -	select USB_XHCI_PLATFORM
> +	depends on USB_XHCI_PLATFORM
>  	depends on ARCH_RENESAS || COMPILE_TEST
>  	---help---
>  	  Say 'Y' to enable the support for the xHCI host controller
> --=20
> 1.9.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXLE2zAAoJEIaOsuA1yqREr2sQAK6YiFOBFK//l8TPnXgCw1U9
ld5HO4MqK2HpBg5JyZD7Gwr7eM5MD5N10LlAmsi2nO993inj/o7pmCln2YpDyn3q
nJFKbRePDytGBiSN2WyhRM5lvvTiifE6huveZNaYko3UsddJt/pgu5drL/cjVBoB
vRo9P832q9kanVtBcCd8DK4LoI1xqWz/4BpZiD/cApL18iSpXmS4rzMoxlnyc8Mc
uEZk+ZNp5XMDyT3bHKoWQAYoreef6quWD7XIE1wf1I+HFpxBhCny846cnTKtAgTx
dt0YJ/tWw8ALzo8e3fokPbwROxiupuM1354mG/1Ad+hJQgMk6ItsgPiNVSIVwQlm
aEJQWKy3/YfzwpohrXu5j3KufPlJEilWybVZHbPEPmF/AKp+K22UT3/T2NQ2pFEt
fumUgVPOZ9bmfGIp+Gv9Sv7AEo0HMpGqtdtHNmcaUqDFmoFmyc1WSIEBTZt8Cmo5
JugW1MSPIYEjWWNKn+HmfiuGnUc4gzLijnKvlhGjXjZG9vPh4EEiOYViJ0MQudXF
5r331C//FMo9w0cEDK2wkn+LVtb9C3IS/DXjlHqZ43+0v3MVbTfNuhCLoePhsQZT
v3CtSoPrutF3fKkO05ZybYb10NuQTPht9Dvvvk62ehHuTAMkymkrQcs2wqPzQhq7
eg62zFzgBA+MsbR+FK2J
=pmvR
-----END PGP SIGNATURE-----
--=-=-=--

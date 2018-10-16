Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:52747 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727255AbeJQArJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Oct 2018 20:47:09 -0400
Date: Tue, 16 Oct 2018 18:55:46 +0200
From: jacopo mondi <jacopo@jmondi.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add Renesas RZ/A and RZ/N files to Renesas
 pinctrl section
Message-ID: <20181016165546.GC11703@w540>
References: <20181016115653.12810-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="s9fJI615cBHmzTOP"
Content-Disposition: inline
In-Reply-To: <20181016115653.12810-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--s9fJI615cBHmzTOP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Geert,

On Tue, Oct 16, 2018 at 01:56:53PM +0200, Geert Uytterhoeven wrote:
> Add paths for the Renesas RZ/A and RZ/N series pin controller drivers,
> as they are not under sh-pfc/, but still maintained with the other
> Renesas pin controller drivers.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thank you
   j

> ---
> To be queued in sh-pfc-for-v4.21.
>
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 809600de0b7293c8..77ff83bc09464c1f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11672,6 +11672,7 @@ M:	Geert Uytterhoeven <geert+renesas@glider.be>
>  L:	linux-renesas-soc@vger.kernel.org
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git sh-pfc
>  S:	Maintained
> +F:	drivers/pinctrl/pinctrl-rz*
>  F:	drivers/pinctrl/sh-pfc/
>
>  PIN CONTROLLER - SAMSUNG
> --
> 2.17.1
>

--s9fJI615cBHmzTOP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbxhgSAAoJEHI0Bo8WoVY83vgP/39LrFO7TU8FDmHaZll21HhC
1RMhelOoP5xUSaOF5povl8nNTfXI8r6DpC7b0IlbzhK41bWP1cealQAxx544j6XW
37U55QnhfjMDgau0kiXs7i+5XwW+F4mEu/ZimCp2nCM9DJf2E0kxk4xEmIcD/3B4
BEWlVKb23M6Wy602oomdLV8LvbsLeAKH6AzvxlyV24eVyJSi5oySW/31fW0TCDQR
C7frwfgrrfQ+54ZkY26IhmCMwBbf8WCbI31sUHcmdgAh7+aka2oBlHdI01OZFik9
S/plDP+5T7M8Gf/mDJMVQ7JjZVb7mo2MFzmcEles+afWBdcbF3htdQoUZvFALuoY
I3Wd43svTrftXidCpKyjxg6VkX8KG+CPQ/nO9dFDkNp50rCCfJrMSZhBK1z8EHMD
+aIFTKgx+zz8z6TBM5MRUpVuQZqkgmzSkDAlCaGPW6aIjvNH/czfngvVW91Dh6qq
69YpxpymYbE0C0cX+yidEL+lod+xCGUk7HEBr3ryZ/ZgZBDj0WuRI9eFpCLXZtbD
lax11sanZ7nIxlPLBfgYJ9lTlDsg/6ZDpAEu6DD1mzaQx0ZV62W3XSkHR5EeGEhS
Qr5y2O1FwaWFBuC+4oImAxIRZPPnvlPteQ4h/J8rMY1PINlt28IhhxFf2MZ+/7Uk
S2iexepT/wskwZwfIpjy
=fjzZ
-----END PGP SIGNATURE-----

--s9fJI615cBHmzTOP--

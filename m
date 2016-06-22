Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:31796 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751538AbcFVIQN (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 22 Jun 2016 04:16:13 -0400
From: Felipe Balbi <felipe.balbi@linux.intel.com>
To: Mathieu Malaterre <mathieu.malaterre@gmail.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-kernel@lists.codethink.co.uk,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] usb: renesas_usbhs: make usbhs_write32() static
In-Reply-To: <CA+7wUsxSypNQTCQ-p0VkD=dciPFDGKCX6WGqhFjQ_CEbcTZ0fg@mail.gmail.com>
References: <1466531574-3096-1-git-send-email-ben.dooks@codethink.co.uk> <CA+7wUsxSypNQTCQ-p0VkD=dciPFDGKCX6WGqhFjQ_CEbcTZ0fg@mail.gmail.com>
Date: Wed, 22 Jun 2016 11:15:44 +0300
Message-ID: <87d1n9ljv3.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Mathieu Malaterre <mathieu.malaterre@gmail.com> writes:
> On Tue, Jun 21, 2016 at 7:52 PM, Ben Dooks <ben.dooks@codethink.co.uk> wr=
ote:
>> The usbhs_write32 function is not used outside of the rcar3.c
>> file, so fix the following sparse warning by making it static:
>>
>> drivers/usb/renesas_usbhs/rcar3.c:26:6: warning: symbol 'usbhs_write32' =
was not declared. Should it be static?
>>
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: linux-usb@vger.kernel.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> ---
>>  drivers/usb/renesas_usbhs/rcar3.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/renesas_usbhs/rcar3.c b/drivers/usb/renesas_usb=
hs/rcar3.c
>> index 38b01f2..1d70add 100644
>> --- a/drivers/usb/renesas_usbhs/rcar3.c
>> +++ b/drivers/usb/renesas_usbhs/rcar3.c
>> @@ -23,7 +23,7 @@
>>  #define UGCTRL2_RESERVED_3     0x00000001      /* bit[3:0] should be B'=
0001 */
>>  #define UGCTRL2_USB0SEL_OTG    0x00000030
>>
>> -void usbhs_write32(struct usbhs_priv *priv, u32 reg, u32 data)
>> +static void usbhs_write32(struct usbhs_priv *priv, u32 reg, u32 data)
>>  {
>>         iowrite32(data, priv->base + reg);
>>  }
>> --
>> 2.8.1
>
> static inline ?

why? compiler can make that choice

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXakkwAAoJEIaOsuA1yqREd3cP/3m+qorFLTf2tjmmjyhKmGRB
BP4ILrmeg5ienkPm1FR9xIA7BMMcJw9k3Drv8FitLBPAguSwLJCORmi5yOcohCSd
d+GEW246rpUYkj3wWxHAvTJJ18HVmymDNhMkuav/4qDg5vKEZMNWJx4m9YeBFXIX
v3eY0V4oGeVur+DnmLTap2eWbxYtA2oCwzySRUKlDrfzcTTAURVFDl9g3Em/agIJ
Jbzy1MzrBqF+mAJq1R1lmPl0+fuYmCOtg2wbpfGw2akrzxZVkTWU8AwMRiA1mJhX
3GOEV1auwjuO8wm+vTuDfg/NyNUKzSCGq9K/l4aEEjuKgY58CQ9LvfwfOB2jiTLs
eU3KJGdHdtyjqa9wJQQOQgAqD20wY/VjJ2xhQgVKBf3YGU2dqWT+QcCJmSqhdw0M
DJzRX6SDf7GnSTJZVWOCEnrkj0i80PS/zc4L0aWbYRS9OPIKBtdO82WBJkHSqfax
HBuxGDxDJgVL30364qUIfK1TJAmbQTYz8CCV3AB81N4FAb4uuz9/ZSWJvRPGFfxJ
203G7UQX+SwgDxhqsQnEhatpbgp9kzjLSQ4MTXm8RMeldh6qKn0pk9XlCXk77uQc
bdgdLrvWj010eiEUCpKsa8OMmi89LT26kxy4+NbzYJen2YrtvBBumhK0TadFVAZN
0TsAe0CtFedHT9UO2wf9
=FSUq
-----END PGP SIGNATURE-----
--=-=-=--

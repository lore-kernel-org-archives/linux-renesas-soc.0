Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Peter Chen <hzpeterchen@gmail.com>
CC: "kishon@ti.com" <kishon@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "Peter.Chen@nxp.com" <Peter.Chen@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3] phy: rcar-gen3-usb2: add sysfs for usb role swap
Date: Tue, 8 Nov 2016 10:15:25 +0000
Message-ID: <HK2PR06MB0548DB0A4DFDAFEF0A27D2C2D8A60@HK2PR06MB0548.apcprd06.prod.outlook.com>
References: <1478069232-20570-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20161108092516.GB12276@b29397-desktop>
In-Reply-To: <20161108092516.GB12276@b29397-desktop>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

> From: Peter Chen
> Sent: Tuesday, November 08, 2016 6:25 PM
>=20
> On Wed, Nov 02, 2016 at 03:47:12PM +0900, Yoshihiro Shimoda wrote:
< snip >
> > +	/* If current and new mode is the same, this returns the error */
> > +	if (is_host =3D=3D new_mode_is_host)
> > +		return -EINVAL;
> > +
> > +	if (new_mode_is_host) {
> > +		if (!is_b_device && !is_host)	/* A-Peripheral */
> > +			rcar_gen3_init_from_a_peri_to_a_host(ch);
> > +		if (is_b_device && !is_host)	/* B-Peripheral */
> > +			rcar_gen3_init_for_b_host(ch);
>=20
> is_host must be false here

Thank you for the review!
I will clean up the code and submit v4 patch soon.

> > +	} else {
> > +		if (!is_b_device && is_host)	/* A-Host */
> > +			rcar_gen3_init_for_a_peri(ch);
> > +		if (is_b_device && is_host)	/* B-Host */
> > +			rcar_gen3_init_for_peri(ch);
>=20
> is_host must be true here

Same the above.

> > +	}
> > +
> > +	return count;
> > +}
> > +
>=20
> How can you handle the case which ID pin is incorrect, eg, ID is 0, but
> it is peripheral mode at the initialization?

This driver always checks the ID pin and sets the suitable mode in initiali=
zation timing.
So, we can ignore such a situation.

< In detail >
 phy_init()			@ drivers/phy/phy-core.c
 --> rcar_gen3_phy_usb2_init()
  --> rcar_gen3_phy_init_otg()
   --> rcar_gen3_device_recognition()
    --> if (!rcar_gen3_check_id(ch))
          rcar_gen3_init_for_host(ch);   <-- Sets the mode as host
        else
          rcar_gen3_init_for_peri(ch);   <-- Sets the mode as peripheral
++phy->init_count;		@ drivers/phy/phy-core.c

Best regards,
Yoshihiro Shimoda

> --
>=20
> Best Regards,
> Peter Chen

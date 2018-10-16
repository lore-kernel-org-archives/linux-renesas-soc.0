Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mslow2.mail.gandi.net ([217.70.178.242]:52576 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbeJPQ2k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Oct 2018 12:28:40 -0400
Date: Tue, 16 Oct 2018 10:24:42 +0200
From: jacopo mondi <jacopo@jmondi.org>
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2] pinctrl: rzn1: Fix check for used MDIO bus
Message-ID: <20181016082442.GE6485@w540>
References: <20181015150147.23295-1-phil.edworthy@renesas.com>
 <20181015151206.GE21294@w540>
 <TY1PR01MB1769071215D442A9796FE086F5FE0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="xA/XKXTdy9G3iaIz"
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1769071215D442A9796FE086F5FE0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--xA/XKXTdy9G3iaIz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Phil,

On Tue, Oct 16, 2018 at 08:04:53AM +0000, Phil Edworthy wrote:
> Hi Jacopo,
>
> On 15 October 2018 16:12 jacopo mondi wrote:
> > On Mon, Oct 15, 2018 at 04:01:47PM +0100, Phil Edworthy wrote:
> > > This fixes the check for unused mdio bus setting and the following
> > > static checker warning:
> > >  drivers/pinctrl/pinctrl-rzn1.c:198 rzn1_pinctrl_mdio_select()
> > >  warn: always true condition '(ipctl->mdio_func[mdio] >= 0) => (0-u32max
> > >= 0)'
> > >
> > > It also fixes the return var when calling of_get_child_count()
> > >
> >
> > Not really, since you skip the assignement if return value is <= 0:
> >
> > 	nfuncs = of_get_child_count(np);
> > 	if (nfuncs <= 0)
> > 		return 0;
> >
> > 	ipctl->nfunctions = nfuncs;
> >
> > This seems more likely to be here to make 'rzn1_pmx_get_funcs_count()'
> > happy, as it returns a signed integer, but since nfunctions is only assigned if
> > 'nfuncs' > 0, then the cast is safe there.
> >
> > I would keep this unsigned, and rather return an error if
> > 'of_get_child_count()' returns an error of any sort in 'probe_dt()', otherwise
> > assign 'ipctl->nfunctions = nfuncs;' unconditionally and return immediately if
> > nfuncs == 0. This makes sure nfunctions is initialized even if there are no
> > functions registered.
> Ok, I get what you're saying, though nfunctions will always be initialised due
> to allocation with devm_kzalloc.
>

Right, sorry for missing that.

> > Anyway, small issues, this just doesn't belong to this patch, but it's likely not
> > to cause any harm I guess.
> True... should I leave this patch as is or respin again?

I think you should handle the case where of_get_child_count() returns
an error, but in a follow up patch. You can leave this one as it is,
even if that change is imho not necessary.

Thanks
   j

>
> Thanks
> Phil
>
> > > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> > > ---
> > > v2:
> > >  - Don't use implicit type conversion.
> > >  - Fix type of return var when calling of_get_child_count().
> > > ---
> > >  drivers/pinctrl/pinctrl-rzn1.c | 10 +++++-----
> > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/pinctrl/pinctrl-rzn1.c
> > > b/drivers/pinctrl/pinctrl-rzn1.c index ce05e3a00be2..4998463c54a0
> > > 100644
> > > --- a/drivers/pinctrl/pinctrl-rzn1.c
> > > +++ b/drivers/pinctrl/pinctrl-rzn1.c
> > > @@ -112,13 +112,13 @@ struct rzn1_pinctrl {
> > >  	struct rzn1_pinctrl_regs __iomem *lev2;
> > >  	u32 lev1_protect_phys;
> > >  	u32 lev2_protect_phys;
> > > -	u32 mdio_func[2];
> > > +	int mdio_func[2];
> > >
> > >  	struct rzn1_pin_group *groups;
> > >  	unsigned int ngroups;
> > >
> > >  	struct rzn1_pmx_func *functions;
> > > -	unsigned int nfunctions;
> > > +	int nfunctions;
> > >  };
> > >
> > >  #define RZN1_PINS_PROP "pinmux"
> > > @@ -195,9 +195,9 @@ static void rzn1_hw_set_lock(struct rzn1_pinctrl
> > > *ipctl, u8 lock, u8 value)  static void rzn1_pinctrl_mdio_select(struct
> > rzn1_pinctrl *ipctl, int mdio,
> > >  				     u32 func)
> > >  {
> > > -	if (ipctl->mdio_func[mdio] >= 0 && ipctl->mdio_func[mdio] != func)
> > > +	if (ipctl->mdio_func[mdio] >= 0 && ipctl->mdio_func[mdio] !=
> > > +(int)func)
> > >  		dev_warn(ipctl->dev, "conflicting setting for mdio%d!\n",
> > mdio);
> > > -	ipctl->mdio_func[mdio] = func;
> > > +	ipctl->mdio_func[mdio] = (int)func;
> > >
> > >  	dev_dbg(ipctl->dev, "setting mdio%d to %u\n", mdio, func);
> > >
> > > @@ -810,8 +810,8 @@ static int rzn1_pinctrl_probe_dt(struct
> > platform_device *pdev,
> > >  	struct device_node *np = pdev->dev.of_node;
> > >  	struct device_node *child;
> > >  	unsigned int maxgroups = 0;
> > > -	unsigned int nfuncs = 0;
> > >  	unsigned int i = 0;
> > > +	int nfuncs = 0;
> > >  	int ret;
> > >
> > >  	nfuncs = of_get_child_count(np);
> > > --
> > > 2.17.1
> > >

--xA/XKXTdy9G3iaIz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbxaBKAAoJEHI0Bo8WoVY8mrwP+gIiP1G6Z7RrlL3QqfB9wZ9Z
u2FkKbfeU+LsIYwhjOPs9DCBtQIzkWYQ8rtopZ+DWhb+gFafUkFppXtyjtzdb/N9
mz+6WpOwV5JKbUh13R8pYmW4vbvfXVgtQP8udj7mBGko1J0phpH5gBiNQ/hLTLwC
KdaaQpgRaRT+cxtEtOZjq5TJktAb1gWb+kBC7LP36Q60MkW/TE/C/pfz4dcwHmTo
iQRRwuoGaxYJhRlquj8F8av+5sLxHiVWDZ6F+HM7K3cyT0uN1tgCSO0qxchRIrWE
pbwGoUw/8K+J7E7Teu7f1GhtSyIc0DG6sPh3NiCotPVKve8vnI4X2NngO5vam6jk
ff3p1lGXW8xOzQe3aR5a24ohye9LL8VI24dmSH0hZwTNlsWIZ866kJghGKADgNIG
swqX4/DObpHbjvZMsdDXzKuWIEW4B3+Qcfi7mDOly/+sXur6agFEwljVmVsgE5l/
bmRSglYs6eEAAVcJPrDbDPSItX2CNXFs4l5VEM5o23j58Zu0K1tSBD6hvuYmYsz1
jgqZSqcohlILfQXm1yxeKaK9/mIVWq9v76N4faAuH/UFVPRCyZMhL/tYnAzoKG1j
DE+n4ksCqOpAGnew+1MevN/4KnPejlz51kB4X05iYOwa5k2kwOdVfdYguSk/Q+jB
7NS655h4rIiNGGtNLppx
=juDW
-----END PGP SIGNATURE-----

--xA/XKXTdy9G3iaIz--

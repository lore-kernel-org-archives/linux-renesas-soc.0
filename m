Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:37645 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727716AbeINNvN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Sep 2018 09:51:13 -0400
Date: Fri, 14 Sep 2018 10:35:15 +0200
From: jacopo mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 03/16] dt-bindings: display: renesas: lvds: Add EXTAL and
 DU_DOTCLKIN clocks
Message-ID: <20180914083515.GC28160@w540>
References: <20180904121027.24031-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180904121027.24031-4-laurent.pinchart+renesas@ideasonboard.com>
 <20180914080046.GK11509@w540>
 <6030546.koD4IuRgeG@avalon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="eu8nj/18vubUeVCi"
Content-Disposition: inline
In-Reply-To: <6030546.koD4IuRgeG@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--eu8nj/18vubUeVCi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Fri, Sep 14, 2018 at 11:24:32AM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> On Friday, 14 September 2018 11:00:46 EEST jacopo mondi wrote:
> > On Tue, Sep 04, 2018 at 03:10:14PM +0300, Laurent Pinchart wrote:
> > > On the D3 and E3 SoCs, the LVDS encoder can derive its internal pixel
> > > clock from an externally supplied clock, either through the EXTAL pin or
> > > through one of the DU_DOTCLKINx pins. Add corresponding clocks to the DT
> > > bindings.
> > >
> > > To retain backward compatibility with DT that don't specify the
> > > clock-names property, the functional clock must always be specified
> > > first, and the clock-names property is optional when only the functional
> > > clock is specified.
> > >
> > > Signed-off-by: Laurent Pinchart
> > > <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > >
> > >  .../devicetree/bindings/display/bridge/renesas,lvds.txt      | 12 ++++++-
> > >  1 file changed, 11 insertions(+), 1 deletion(-)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > > b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt index
> > > 13af7e2ac7e8..9e3913f6a643 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > > @@ -19,7 +19,17 @@ Required properties:
> > >    - "renesas,r8a77995-lvds" for R8A77995 (R-Car D3) compatible LVDS
> > >    encoders
> > >
> > >  - reg: Base address and length for the memory-mapped registers
> > >
> > > -- clocks: A phandle + clock-specifier pair for the functional clock
> > > +- clocks: A list of phandles + clock-specifier pairs, one for each entry
> > > in
> > > +  the clock-names property.
> > > +- clock-names: Name of the clocks. This property is model-dependent.
> > > +  - The functional clock is mandatory for all models, shall be listed
> > > first,
> >
> > I would write
> >
> > The functional clock, which is mandatory for all models, shall be listed
> > first and shall be named "fck".
>
> I'll change that.
>
> > > +    and shall be named "fck".
> > > +  - On R8A77990 and R8A77995, the LVDS encoder can use the EXTAL or
> > > +    DU_DOTCLKINx clocks. Those clocks are optional. When supplied they
> > > must be
> > > +    named "extal" and "dclkin.x" respectively, with "x" being the
> > > DU_DOTCLKIN
> > > +    numerical index.
> >
> > Is it valid to list other clocks here for the other SoCs?
>
> No, those clocks only exist for D3 and E3, as stated (R8A77990 and R8A77995).
> Do you think the text isn't clear enough ?

It's fine. I now read it as:
"On R8A77990 and R8A77995 _only_, the LVDS encoder can use the EXTAL or"

It's all good, with the little "which" added to the first statement
please add to v2:
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j

>
> > > +  - When the clocks property only contains the functional clock, the
> > > +    clock-names property may be omitted.
> > >
> > >  - resets: A phandle + reset specifier for the module reset
> >
> > Thanks
> >    j
> >
> > >  Required nodes:
>
> --
> Regards,
>
> Laurent Pinchart
>
>
>

--eu8nj/18vubUeVCi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbm3LDAAoJEHI0Bo8WoVY80o0QALB5qyw+YDGKucV1yxGTYuuj
uWALz98xOhfFePemFJy+X5KIcAdjbWfQNJMCMUr1Ui5euD+0mGaDKEP5gZ3LgkYA
joghUmx0Ybhos98fUPjy8K0fNYNXNW0ZSE4/XBLo79nbMcTp71RHNAB2hJpgtvxu
ARAI1WOpUEQek2/hmm87Yow5J8C8+vOVCprkQobpNIB4E1ibm/RcmJrXsiRqXCeq
lHqPmfhErCnyreUU72MN8ZFH0CtlpJ4Larrb2lgAwc3GMRVekHicmiPeMsq6JXhR
6AHcMriDYPPW4/SmShZ7sqDuPx+sOiJOWbb/0sHT3JEBA0DnbHm6ffS0yd2Oi0+y
2UzjhZuxscRE5qd4Epm4C8zlK+hoOksHMVYQeT7p79ZXzyuxo1y+p14vQJevmj+W
yxVi+4f5cI7zcrT0OO6X74Gz3uYKK0p6mu+q7nQ22FYN8Lc1n7BKQSaoeWhIJdKL
vX+lMpxfp6IWJ7BSowzn6AEbkOyd3YUGhnarKluKXTya93caXzwoCb9+AdEm5PFm
+ZDCKuvvp975lkFaDCkNdXIF2nWI0vaW4ySTNt77B8B99Nz7T13240LZ7NaILfkL
+t17u/oseet9yay7ek1bDE0Ebt0paydmBCoDbHvvEaBVKykGQ6lR33qKkfOK83Ww
CPrE+ZmT2L0VngBrW62x
=HaL4
-----END PGP SIGNATURE-----

--eu8nj/18vubUeVCi--

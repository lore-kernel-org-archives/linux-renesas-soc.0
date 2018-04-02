Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:36636 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750710AbeDBNgu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Apr 2018 09:36:50 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: jacopo mondi <jacopo@jmondi.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rob Herring <robh@kernel.org>, architt@codeaurora.org,
        airlied@linux.ie, horms@verge.net.au, magnus.damm@gmail.com,
        geert@linux-m68k.org, niklas.soderlund@ragnatech.se,
        mark.rutland@arm.com, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: display: bridge: Document THC63LVD1024 LVDS decoder
Date: Mon, 02 Apr 2018 16:36:55 +0300
Message-ID: <4549018.sA3EWz2jVz@avalon>
In-Reply-To: <6353eb46-5a2d-7b75-a60b-c31c59c8636a@mentor.com>
References: <4060923.7DxT9ae38L@avalon> <20180327101008.GM27746@w540> <6353eb46-5a2d-7b75-a60b-c31c59c8636a@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Vladimir,

On Tuesday, 27 March 2018 14:03:25 EEST Vladimir Zapolskiy wrote:
> On 03/27/2018 01:10 PM, jacopo mondi wrote:
> > On Tue, Mar 27, 2018 at 12:37:31PM +0300, Vladimir Zapolskiy wrote:
> >> On 03/27/2018 11:57 AM, jacopo mondi wrote:
> >>> On Tue, Mar 27, 2018 at 11:30:29AM +0300, Vladimir Zapolskiy wrote:
> >>>> On 03/27/2018 11:27 AM, Sergei Shtylyov wrote:
> >>>>> On 3/27/2018 10:33 AM, jacopo mondi wrote:
> >>>>> [...]
> >>>>>=20
> >>>>>>>>>>> Document Thine THC63LVD1024 LVDS decoder device tree bindings.
> >>>>>>>>>>>=20
> >>>>>>>>>>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >>>>>>>>>>> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> >>>>>>>>>>> Reviewed-by: Niklas S=F6derlund
> >>>>>>>>>>> <niklas.soderlund+renesas@ragnatech.se>
> >>>>>>>>>>> ---
> >>>>>>>>>>>=20
> >>>>>>>>>>>   .../bindings/display/bridge/thine,thc63lvd1024.txt | 66
> >>>>>>>>>>>   +++++++++++++++++++
> >>>>>>>>>>>   1 file changed, 66 insertions(+)
> >>>>>>>>>>>   create mode 100644
> >>>>>>>>>>>=20
> >>>>>>>>>>> Documentation/devicetree/bindings/display/bridge/thine,thc63l=
vd1
> >>>>>>>>>>> 024.txt
> >>>>>>>>>>>=20
> >>>>>>>>>>> diff --git
> >>>>>>>>>>> a/Documentation/devicetree/bindings/display/bridge/thine,thc6=
3lv
> >>>>>>>>>>> d1024.txt
> >>>>>>>>>>> b/Documentation/devicetree/bindings/display/bridge/thine,thc6=
3lv
> >>>>>>>>>>> d1024.txt
> >>>>>>>>>>> new file mode 100644
> >>>>>>>>>>> index 0000000..8225c6a
> >>>>>>>>>>> --- /dev/null
> >>>>>>>>>>> +++
> >>>>>>>>>>> b/Documentation/devicetree/bindings/display/bridge/thine,thc6=
3lv
> >>>>>>>>>>> d1024.txt
> >>>>>>>>>>> @@ -0,0 +1,66 @@
> >>>>>>>>>>> +Thine Electronics THC63LVD1024 LVDS decoder
> >>>>>>>>>>> +-------------------------------------------
> >>>>>>>>>>> +
> >>>>>>>>>>> +The THC63LVD1024 is a dual link LVDS receiver designed to
> >>>>>>>>>>> convert LVDS streams
> >>>>>>>>>>> +to parallel data outputs. The chip supports single/dual
> >>>>>>>>>>> input/output modes, +handling up to two two input LVDS stream
> >>>>>>>>>>> and up to two digital CMOS/TTL outputs.
> >>>>>>>>>>> +
> >>>>>>>>>>> +Single or dual operation modes, output data mapping and DDR
> >>>>>>>>>>> output modes are
> >>>>>>>>>>> +configured through input signals and the chip does not expose
> >>>>>>>>>>> any control bus.
> >>>>>>>>>>> +
> >>>>>>>>>>> +Required properties:
> >>>>>>>>>>> +- compatible: Shall be "thine,thc63lvd1024"
> >>>>>>>>>>> +
> >>>>>>>>>>> +Optional properties:
> >>>>>>>>>>> +- vcc-supply: Power supply for TTL output and digital circui=
try
> >>>>>>>>>>> +- cvcc-supply: Power supply for TTL CLOCKOUT signal
> >>>>>>>>>>> +- lvcc-supply: Power supply for LVDS inputs
> >>>>>>>>>>> +- pvcc-supply: Power supply for PLL circuitry
> >>>>>>>>>>=20
> >>>>>>>>>> As explained in a comment to one of the previous versions of t=
his
> >>>>>>>>>> series, I'm tempted to make vcc-supply mandatory and drop the
> >>>>>>>>>> three other power supplies for now, as I believe there's very
> >>>>>>>>>> little chance they will be connected to separately controllable
> >>>>>>>>>> regulators (all supplies use the same voltage). In the very
> >>>>>>>>>> unlikely event that this occurs in design we need to support in
> >>>>>>>>>> the future, the cvcc, lvcc and pvcc supplies can be added later
> >>>>>>>>>> as optional without breaking backward compatibility.
> >>>>>>>>>=20
> >>>>>>>>> I'm okay with that.
> >>>>>>>>>=20
> >>>>>>>>>> Apart from that,
> >>>>>>>>>>=20
> >>>>>>>>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.c=
om>
> >>>>>>>>>>=20
> >>>>>>>>>>> +- pdwn-gpios: Power down GPIO signal. Active low
> >>>>>>>>>=20
> >>>>>>>>> powerdown-gpios is the semi-standard name.
> >>>>>>>>=20
> >>>>>>>> right, I've also noticed it. If possible please avoid shortenings
> >>>>>>>> in property names.
> >>>>>>>=20
> >>>>>>> It is not shortening, it just follow pin name from decoder's
> >>>>>>> datasheet.
> >>>>>>>=20
> >>>>>>>>>>> +- oe-gpios: Output enable GPIO signal. Active high
> >>>>>>>>>>> +
> >>>>>>>>=20
> >>>>>>>> And this one is also a not ever met property name, please consid=
er
> >>>>>>>> to rename it to 'enable-gpios', for instance display panels defi=
ne
> >>>>>>>> it.
> >>>>>>>=20
> >>>>>>> Again, it follows datasheet naming scheme. Has something changed =
in
> >>>>>>> DT conventions?
> >>>>>>=20
> >>>>>> Seconded. My understanding is that the property name should reflect
> >>>>>> what reported in the the chip manual. For THC63LVD1024 the enable =
and
> >>>>>> power down pins are named 'OE' and 'PDWN' respectively.
> >>>>>>=20
> >>>>> But don't we need the vendor prefix in the prop names then, like
> >>>>> "renesas,oe-gpios" then?
> >>>>=20
> >>>> Seconded, with a correction to "thine,oe-gpios".
> >>>=20
> >>> mmm, okay then...
> >>>=20
> >>> A grep for that semi-standard properties names in Documentation/
> >>> returns only usage examples and no actual definitions, so I assume th=
is
> >>> is why they are semi-standard.
> >>=20
> >> Here we have to be specific about a particular property, let it be
> >> 'oe-gpios' vs. 'enable-gpios' and let's collect some statistics:
> >>=20
> >> % grep -Hr oe-gpios Documentation/devicetree/bindings/* | wc -l
> >> 0
> >>=20
> >> $ grep -Hr enable-gpios Documentation/devicetree/bindings/* | wc -l
> >> 86
> >>=20
> >> While 'thine,oe-gpios' would be correct, I see no reason to introduce a
> >> vendor specific property to define a pin with a common and well
> >> understood purpose.
> >>=20
> >> If you go forward with the vendor specific prefix, apparently you can =
set
> >> the name to 'thine,oe-gpio' (single) or even to 'thine,oe', or does the
> >> datasheet names the pin as "OE GPIO" or "OE connected to a GPIO"? I
> >> guess no.
> >=20
> > Let me clarify I don't want to push for a vendor specific name or
> > similar, I'm fine with using 'semi-standard' names, I'm just confused
> > by the 'semi-standard' definition. I guess from your examples, the
> > usage count makes a difference here.
>=20
> yes, in gneneral you can read "semi-standard" as "widely used", thus
> collecting statistics is a good enough method to make a reasoning.
>=20
> Hopefully the next evolutionary step of "widely used" is "described in
> standard".
>=20
> >> Standards do not define '-gpios' suffix, but partially the description=
 is
> >> found in Documentation/bindings/gpio/gpio.txt, still it is not a secti=
on
> >> in any standard as far as I know.
> >>=20
> >>> Seems like there is some tribal knowledge involved in defining what
> >>> is semi-standard and what's not, or are those properties documented
> >>> somewhere?
> >>=20
> >> The point is that there is no formal standard which describes every IP,
> >> every IC and every single their property, some device node names and
> >> property names are recommended in ePAPR and Devicetree Specification
> >> though.
> >>=20
> >> Think of a confusion if 'rst-gpios' (have you seen any ICs with an RST
> >> pin?) and 'reset-gpios' are different. Same applies to 'pdwn-gpios' vs.
> >> 'powerdown-gpios'.
> >=20
> > I see all your points and I agree with most of them. Anyway, if the
> > chip manual describes a pin as 'RST' I would not find it confusing to
> > have a 'rst-gpio' defined in bindings :)
> >=20
> > Let me be a bit pesky here: what if a chip defines a reset GPIO, which
> > is definitely a reset, but names it, say "XYZ" ? Would you prefer to
> > see it defined as "reset-gpios" for consistency with other bindings,
> > or "xyz-gpios" for consistency with documentation?
>=20
> If a pin is definitely an IC reset as you said, then my preference is to =
see
> it described under 'reset-gpios' property name, plus a comment in the IC
> device tree documentation document about it. I can provide two reasons to
> advocate my position:
>=20
> 1) developers spend significantly more time reading and editing the actual
>    DTSI/DTS board files rather than reading and editing documentation,
>    it makes sense to use common property names to save time and reduce
>    amount of "what does 'oe' stand for?" type of questions; I suppose
>    that the recommendation to avoid not "widely used" abbreviations in
>    device node and property names arises from the same reasoning,
>=20
> 2) "widely used" and "standard" properties are excellent candidates for
>    developing (or re-using) generalization wrappers, it happened so many
>    times in the past, and this process shall be supported in my opinion;
>    due to compatibility restrictions it might be problematic to change
>    property names, and every new exception to "widely used" properties
>    makes problematic to develop and maintain these kinds of wrappers, and
>    of course it postpones a desired "described in standard" recognition.
>=20
> If my point of view is accepted, I do admit that a developer who
> translates a board schematics to board DTS file may experience a minor
> discomfort, which is mitigated if relevant pin names are found in device
> tree binding documentation in comments to properties, still the overall
> gain is noticeably higher in my personal opinion.

I have to disagree with this. When using a property name that doesn't=20
correspond to the hardware documentation, developers will need to refer to =
the=20
DT bindings documentation to confirm the property name. "Widely used" prope=
rty=20
names will not save time, they will use more time. This is of course margin=
al=20
and I don't think it would have any noticeable impact, but I don't think yo=
ur=20
argument holds.

I'm all for standardizing properties across DT bindings for multiple=20
components, but doing so in a semi-random fashion will in my opinion not=20
result in any gain. We can decide that power-down or output-enable GPIOS=20
should have common property names (and I'm not even sure that would be usef=
ul,=20
but we can certainly discuss it), but in that case someone should make a=20
proposal and get the names standardized. Unless we do so, no matter what=20
property name gets picked for a particular binding, it won't become=20
universally used by magic.

I'd like to hear the DT bindings maintainers position on this matter.

=2D-=20
Regards,

Laurent Pinchart

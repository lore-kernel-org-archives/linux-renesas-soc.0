Return-Path: <devicetree-owner@vger.kernel.org>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: jacopo mondi <jacopo@jmondi.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, architt@codeaurora.org,
        a.hajda@samsung.com, airlied@linux.ie,
        vladimir_zapolskiy@mentor.com, horms@verge.net.au,
        magnus.damm@gmail.com, geert@linux-m68k.org,
        niklas.soderlund@ragnatech.se, sergei.shtylyov@cogentembedded.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v7 1/2] dt-bindings: display: bridge: Document THC63LVD1024 LVDS decoder
Date: Fri, 06 Apr 2018 18:40:14 +0300
Message-ID: <2441543.5xTHaLXzZ0@avalon>
In-Reply-To: <20180406142558.GP20945@w540>
References: <1523018517-24121-1-git-send-email-jacopo+renesas@jmondi.org> <1664336.M7KDjLhzuK@avalon> <20180406142558.GP20945@w540>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

(CC'ing Mark Brown)

On Friday, 6 April 2018 17:25:58 EEST jacopo mondi wrote:
> On Fri, Apr 06, 2018 at 04:15:35PM +0300, Laurent Pinchart wrote:
> > On Friday, 6 April 2018 15:41:56 EEST Jacopo Mondi wrote:
> >> Document Thine THC63LVD1024 LVDS decoder device tree bindings.
> >>=20
> >> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> >> Reviewed-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>
> >> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> ---
> >>=20
> >>  .../bindings/display/bridge/thine,thc63lvd1024.txt | 60
> >>  +++++++++++++++++++
> >>  1 file changed, 60 insertions(+)
> >>  create mode 100644
> >>=20
> >> Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> >>=20
> >> diff --git
> >> a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.=
tx
> >> t
> >> b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.=
tx
> >> t
> >> new file mode 100644
> >> index 0000000..1191f17
> >> --- /dev/null
> >> +++
> >> b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.=
tx
> >> t
> >> @@ -0,0 +1,60 @@
> >> +Thine Electronics THC63LVD1024 LVDS decoder
> >> +-------------------------------------------
> >> +
> >> +The THC63LVD1024 is a dual link LVDS receiver designed to convert LVDS
> >> streams
> >> +to parallel data outputs. The chip supports single/dual input/output
> >> modes,
> >> +handling up to two two input LVDS stream and up to two digital CMOS/T=
TL
> >=20
> > s/to two two/to two/
> > s/stream/streams/
> >=20
> >> outputs.
> >> +
> >> +Single or dual operation modes, output data mapping and DDR output
> >> modes are
> >> +configured through input signals and the chip does not expose any
> >> control bus.
> >> +
> >> +Required properties:
> >> +- compatible: Shall be "thine,thc63lvd1024"
> >> +
> >> +Optional properties:
> >> +- vcc-supply: Power supply for TTL output, TTL CLOCKOUT signal, LVDS
> >> input,
> >> +  PPL and digital circuitry
> >> +- powerdown-gpios: Power down GPIO signal, pin name "/PDWN". Active l=
ow
> >> +- enable-gpios: Output enable GPIO signal, pin name "OE". Active high
> >=20
> > As Rob mentioned in a reply to v6, we currently use "enable" as the
> > inverse of "powerdown". I would call this one oe-gpios instead. Quoting
> > Rob:
> >=20
> > "Debating "oe" vs. "output-enable" is bikeshedding IMO. Anyone familiar
> > with h/w design should recognize OE."
>=20
> I got a different understanding of what Rob meant. I thought "anyone
> familiar with h/w design should recognize OE" as that nobody would get
> confused if a pin named OE in the chip manual is descibed by an
> 'enable' property.
>=20
> But as discussed offline, enable has probably to be used as the
> opposite of powerdown for complete chip sleep, not just for output
> pad.
>=20
> Anyway, we spent enough time on naming issues, starting from my first
> stupid 'pdwn' permutations then on this semi-standard names.
>=20
> I'll send next version with 'powerdown-gpios' and 'oe-gpios'
> properties hoping that would be finally accepted by everyone.

I certainly won't complain (as long as you write pwdn instead of pdwn in th=
e=20
driver :-)).

> Same on the mandatory/optional VCC supply thing. Let's try to make
> next version the final one. If the optional property with the dummy
> regulator doesn't satisfy you and it is preferred to have a fixed-regulat=
or
> anyhow in DT I'll do in next version, othewise let's try not to change
> it again. I'll just remark here that in the current Eagle design vcc is
> connected to a power rail with no regulator at all :)

I don't like the dummy regulator much, as it generates a dev_warn(), which=
=20
makes me believe that it's a hack rather than a proper solution. You might=
=20
want to ask Mark Brown for his opinion.

> >> +
> >> +The THC63LVD1024 video port connections are modeled according
> >> +to OF graph bindings specified by Documentation/devicetree/bindings/
> >> graph.txt
> >> +
> >> +Required video port nodes:
> >> +- port@0: First LVDS input port
> >> +- port@2: First digital CMOS/TTL parallel output
> >> +
> >> +Optional video port nodes:
> >> +- port@1: Second LVDS input port
> >> +- port@3: Second digital CMOS/TTL parallel output
> >> +
> >> +Example:
> >> +--------
> >> +
> >> +	thc63lvd1024: lvds-decoder {
> >> +		compatible =3D "thine,thc63lvd1024";
> >> +
> >> +		vcc-supply =3D <&reg_lvds_vcc>;
> >> +		powerdown-gpios =3D <&gpio4 15 GPIO_ACTIVE_LOW>;
> >> +
> >> +		ports {
> >> +			#address-cells =3D <1>;
> >> +			#size-cells =3D <0>;
> >> +
> >> +			port@0 {
> >> +				reg =3D <0>;
> >> +
> >> +				lvds_dec_in_0: endpoint {
> >> +					remote-endpoint =3D <&lvds_out>;
> >> +				};
> >> +			};
> >> +
> >> +			port@2{
> >> +				reg =3D <2>;
> >> +
> >> +				lvds_dec_out_2: endpoint {
> >> +					remote-endpoint =3D <&adv7511_in>;
> >> +				};
> >> +			};
> >> +		};
> >> +	};

=2D-=20
Regards,

Laurent Pinchart




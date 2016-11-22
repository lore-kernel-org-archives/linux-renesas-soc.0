Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:34286 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932718AbcKVLFu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Nov 2016 06:05:50 -0500
Date: Tue, 22 Nov 2016 12:05:48 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 01/13] devicetree/bindings: display: Document common
 panel properties
Message-ID: <20161122110548.GB22735@ulmo.ba.sec>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1479526093-7014-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yEPQxsgoJgBvi8ip"
Content-Disposition: inline
In-Reply-To: <1479526093-7014-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--yEPQxsgoJgBvi8ip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 19, 2016 at 05:28:01AM +0200, Laurent Pinchart wrote:
> Document properties common to several display panels in a central
> location that can be referenced by the panel device tree bindings.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
>  .../bindings/display/panel/panel-common.txt        | 91 ++++++++++++++++=
++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel=
-common.txt
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-common=
=2Etxt b/Documentation/devicetree/bindings/display/panel/panel-common.txt
> new file mode 100644
> index 000000000000..ec52c472c845
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-common.txt
> @@ -0,0 +1,91 @@
> +Common Properties for Display Panel
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This document defines device tree properties common to several classes of
> +display panels. It doesn't constitue a device tree binding specification=
 by
> +itself but is meant to be referenced by device tree bindings.
> +
> +When referenced from panel device tree bindings the properties defined i=
n this
> +document are defined as follows. The panel device tree bindings are
> +responsible for defining whether each property is required or optional.
> +
> +
> +Descriptive Properties
> +----------------------
> +
> +- width-mm,
> +- height-mm: The width-mm and height-mm specify the width and height of =
the
> +  physical area where images are displayed. These properties are express=
ed in
> +  millimeters and rounded to the closest unit.

Erm... this is already implied by the compatible string. Having this in
device tree is completely redundant.

> +- label: The label property specifies a symbolic name for the panel as a
> +  string suitable for use by humans. It typically contains a name inscri=
bed on
> +  the system (e.g. as an affixed label) or specified in the system's
> +  documentation (e.g. in the user's manual).
> +
> +  If no such name exists, and unless the property is mandatory according=
 to
> +  device tree bindings, it shall rather be omitted than constructed of
> +  non-descriptive information. For instance an LCD panel in a system that
> +  contains a single panel shall not be labelled "LCD" if that name is not
> +  inscribed on the system or used in a descriptive fashion in system
> +  documentation.
> +
> +
> +Display Timings
> +---------------
> +
> +- panel-timing: Most display panels are restricted to a single resolutio=
n and
> +  require specific display timings. The panel-timing subnode expresses t=
hose
> +  timings as specified in the timing subnode section of the display timi=
ng
> +  bindings defined in
> +  Documentation/devicetree/bindings/display/display-timing.txt.

Why? That's also implied by the compatible string. Honestly, I thought
by now we had been over this often enough...

Thierry

--yEPQxsgoJgBvi8ip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYNCaLAAoJEN0jrNd/PrOhHjIP/ipeDm6ehL6Y7T/WIhBRk0wJ
edpqRNiasxFjoCgRuU+kHFM/+RQaHqNtzyr8s9kVm5yg4KxPXjddLV3YDLFW/+jy
ZUeQfeS9sn7sgH9C6kOJxcQYjtUmx1DK+u2jdrnjRt3mP+qa95jAIg53BhSg0gy8
56Z+2y6SpW/CCYRQaXHL7gUJPu3TxnIqyVxVM03W70N3iUgq751nfODcZqDH2Ro/
S3XYEGEAeVj6ulzGxeSUmNCD9IZDTHyqI54BWxFCTOKCvFzttncRWWfHseq7EFmt
EtVRe5Xg5QsEdG1rUqqfLRoCGaou2nQxiA+mwr1sA9Xb1aximet2hG/6mXkUZu6j
LC4M0qXa5QuBeVKluKE7l3gMMpaF18/lYlXHAOWsiJMrZreyeKQGYBURS95GLvU+
EH2zHwuR1bbfIFBaznSyda77+ddz+tYKTpSPNoV1KLO0Zwf8cgqKPtTZ2wdIEVoz
TFxtElSu7Pcn9KbPYyfc5z34wjDX0PNkP/Xz4nE50Zt4FYVVdmXHt8Af+iw8qXTD
VqWGjGu3XZCqvxE4Ili1N4osw3h+E51SjUriqoUMpuXYtlTNAxmeKdGvt+57jeDq
E2QMX3QPfrbCfK517CFY4jXaj8TBbWrRvOcftcMPNaAJem40NGpuEkX/aCT8nSV0
m3MKOQTaP6zn1Jvqt1xh
=6JEd
-----END PGP SIGNATURE-----

--yEPQxsgoJgBvi8ip--

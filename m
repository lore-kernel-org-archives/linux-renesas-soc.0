Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([198.47.19.12]:49864 "EHLO arroyo.ext.ti.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933305AbcJUNcH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Oct 2016 09:32:07 -0400
Subject: Re: [PATCH 1/6] video: of: Constify node argument to display timing
 functions
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        <dri-devel@lists.freedesktop.org>
References: <1475584299-21236-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1475584299-21236-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
CC: <linux-renesas-soc@vger.kernel.org>,
        David Airlie <airlied@linux.ie>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <4fe0f974-da8e-a5c7-c3e6-52c112ae871d@ti.com>
Date: Fri, 21 Oct 2016 16:26:57 +0300
MIME-Version: 1.0
In-Reply-To: <1475584299-21236-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature";
        boundary="F1bC0q9R6Hx1N5GxNwp3eNdASpKKdaQ1U"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

--F1bC0q9R6Hx1N5GxNwp3eNdASpKKdaQ1U
Content-Type: multipart/mixed; boundary="n7tGPlDS899MbNV9lswA4eo51rSpeamJ1";
 protected-headers="v1"
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, David Airlie <airlied@linux.ie>
Message-ID: <4fe0f974-da8e-a5c7-c3e6-52c112ae871d@ti.com>
Subject: Re: [PATCH 1/6] video: of: Constify node argument to display timing
 functions
References: <1475584299-21236-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1475584299-21236-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1475584299-21236-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>

--n7tGPlDS899MbNV9lswA4eo51rSpeamJ1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 04/10/16 15:31, Laurent Pinchart wrote:
> The node pointer passed to the display timing functions is never
> modified, make it const.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.=
com>
> ---
>  drivers/video/of_display_timing.c |  6 +++---
>  include/video/of_display_timing.h | 15 ++++++++-------
>  2 files changed, 11 insertions(+), 10 deletions(-)
>=20
> Cc: David Airlie <airlied@linux.ie>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

And ack for merging via drm.

 Tomi


--n7tGPlDS899MbNV9lswA4eo51rSpeamJ1--

--F1bC0q9R6Hx1N5GxNwp3eNdASpKKdaQ1U
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYChehAAoJEPo9qoy8lh71jRgP/jjLR6eMdus00MsPDHtqYw5n
OGplNQYdfkrw03bhpfwhb73wHtLknvGOO7nygTorcRJYxLOh/7H9GzjXF0RpOGcU
IaRHHwQyWCD3TrnAnhq89A1bLQ18W3Zk2xMUCDGORQ+SoqLE3xjLX37lDvTpSq4F
OTKKUkF93KXF60V6ILZCCr3fgJWUD4UXty98JyPWkmYtX6/KBd0UCT6yv0hmww+e
ICMuz7YVlP3Sy8y1EbBS/mZU6JePBMXG8vQTo2fOjDx7wUU3FgwhprLcxHEDrReW
s395aRr0WRIGkZwhLdRyESlowP/rW35+wm2xTH3mvvQStI20fm2ZA1cXLCLKil5Z
z2GZ+qAfLnd1pFuJnqGxDL4maaPg8J3BNU5yPf+SPQ4LrVbLeS3DpDImOIZs5EpL
T3/vH/9Mc5VNlQpFqjQKXdf3Qxjl7m0FrXm0dxPMtyLrCNgdqgP6GmApwmgDDYyx
IzoI1heD3KxUSGepPAcAM+AGW5yPRS7QZ+VQHbipt7LbJVM+I4KwftInlKmpECtQ
g+lgni+wSRIokw/hDWnS0g6Bq6f5hKDMhjfQxaB3cLRxDBieILog3DOhAf9KjJEU
o0R7N3WZK+QjFhgOval85EaO0ikjQ89/y1v+wzaFpv/k5N4Ry+3hf0zRzB7jEyzg
iCvuqMcCmwIFbS44HFdb
=oxCn
-----END PGP SIGNATURE-----

--F1bC0q9R6Hx1N5GxNwp3eNdASpKKdaQ1U--
